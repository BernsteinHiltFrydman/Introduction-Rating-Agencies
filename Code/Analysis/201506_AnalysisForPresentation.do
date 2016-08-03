
* Main Analysis File for Intro RA Paper
* 
* 
* Last checked on 8/17/2015

* Set the working directory
cd "C:\Users\asafb\Dropbox (MIT)\RatingAgencies\Data_Programs\Data"

* Log results
log using 201406_Analysis.txt, replace

* Load the NYSE Bond secondary market data (combined intra-day and EOD)
use merged_intra_wkly, clear
	drop _merge
	* Merge with firm-level ratings
	merge m:m issuer_id using Firm_Ratings_v2, force 
	* 3,349/85,446 = 3.9% observations don't match. Need to investigate these more
	* later
	keep if _merge==3
	drop _merge	

	* Recompute year, month, day variables
	replace year = year(date)
	replace month = month(date)
	replace day = day(date)

	* Force the unit of observation to be 1 issue per date
	egen unique_id = group(issuer_id issue_id)
	duplicates drop unique_id date, force
	* 3,046 observations dropped (need to look at this more)
	xtset unique_id date	
	
	* Rename the numeric (1=Aaa) rating of the firm across all bonds
	rename rating_bond_1909_medianq rating_bond_1909_median	
	* Round up the closest (best) rating at a firm-level.
	replace rating_bond_1909_median = ceil(rating_bond_1909_median)
	
	*********************************
	* Simple Summary Statistics
	*********************************
	disp _N
	* Start with 82,400 observations
	preserve
		duplicates drop issuer_id issue_id, force
		disp _N
		* 1,859 unique bonds
		duplicates drop issuer_id, force
		disp _N
		* 415 unique issuers
	restore
	preserve
		* Compute the mean yield in 1908 (for surprises)
		gen yield_1908 = perp_yield if year == 1908
		bys issuer_id: egen mn_yield_1908 = mean(yield_1908)
		*
		drop if mn_yield_1908==. | mn_yield_1908==0 | mn_yield_1908<0
		keep if  year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=.
		disp _N
		* 20,827 observations after implementing filters (mostly caused by reduced sample period and required 1909 rating)
		duplicates drop issuer_id issue_id, force
		disp _N
		* 751 unique issues
		duplicates drop issuer_id, force
		disp _N
		* 173 unique issuers
	restore
	
	*********************************
	* Trading Volume ($), Railroad vs. Non-Railroad Bonds 1905-1914
	*********************************	
	preserve
		gen RR = 1
		replace RR = 0 if rating_bond_1909_median==. | rating_bond_1909_median==0
		drop if transaction_data_dum==1
		bys date RR: egen sum_volume_byRR = sum(salesXlast)
		tabdisp date RR, cell(sum_volume_byRR)	
	restore
	
	*********************************
	* Winsorize Data and Recompute Summary Statistics
	*********************************	
	* Winsor data
	local prod_vars `" perp_yield salesXlast abs_ret price_impact last coupon salesXprice_trans "'
	foreach x of local prod_vars {		
		*sum `x', d
		winsor `x', generate(`x'_tmp) p(0.01)
		drop `x'
		rename `x'_tmp `x'
		*sum `x', d
	}
	
	* Compute the mean yield in 1908 (for surprises)
	gen yield_1908 = perp_yield if year == 1908
	bys issuer_id: egen mn_yield_1908 = mean(yield_1908)	
	
	*******
	* Compute summary statistics for all Bonds (Part A)
	*******
	sum last, d
	sum coupon, d
	sum perp_yield, d
	sum salesXlast, d
	sum rating_bond_1909_median, d
	preserve
		duplicates drop date, force
		disp _N
		*450 dates with observations in full sample
	restore

	*******
	* Compute summary statistics for 1908-1909 RR Bonds (Part B)
	*******
	* Remove all issuers without a 1908 bond yield (since can't compute surprise)
	drop if mn_yield_1908==. | mn_yield_1908==0 | mn_yield_1908<0
	* 5,292 observations dropped
	sum last if  year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=., d
	sum coupon if  year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=., d
	sum perp_yield if  year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=., d
	sum salesXlast if  year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=., d
	sum rating_bond_1909_median if  year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=., d	
	sum price_impact if  year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=., d	
	preserve
		keep if year>=1908 & year<=1909 & rating_bond_1909_median<=5 & rating_bond_1909_median!=.
		duplicates drop date, force
		disp _N
		*180 dates with observations 
	restore
	
	*******
	* Compute summary statistics for 1908-1909 Non-RR Bonds (Not in slides)
	*******
	sum last if  year>=1908 & year<=1909 & rating_bond_1909_median==., d
	sum coupon if  year>=1908 & year<=1909 & rating_bond_1909_median==., d
	sum perp_yield if  year>=1908 & year<=1909 & rating_bond_1909_median==., d
	sum salesXlast if  year>=1908 & year<=1909 & rating_bond_1909_median==., d
	sum rating_bond_1909_median if year>=1908 & year<=1909 & rating_bond_1909_median==., d
	sum price_impact if year>=1908 & year<=1909 & rating_bond_1909_median==., d
	preserve
		keep if year>=1908 & year<=1909 & rating_bond_1909_median==.
		duplicates drop date, force
		disp _N
		*180 dates with observations 
	restore
	
	* Get stats on # of bonds traded per day w/ intra-day data
	preserve
		keep if year>=1908 & year<=1909 & rating_bond_1909_median==.
		keep if transaction_data_dum==1
		duplicates drop date issuer_id issue_id, force
		bys date: egen num_obs = count(last)
		duplicates drop date, force
		sum num_obs, d
	restore	
	* Get stats on # of bonds traded per day w/ intra-day & EOD data combined
	preserve
		keep if year>=1908 & year<=1909 & rating_bond_1909_median==.
		duplicates drop date issuer_id issue_id, force
		bys date: egen num_obs = count(last)
		duplicates drop date, force
		sum num_obs, d
	restore		
	
	*********************************
	* Compute Time Series of Average Yields
	*********************************
	* Unrated Firms (mostly Railroads) Indicator
	gen RR = 1
	replace RR = 0 if rating_bond_1909_median==. | rating_bond_1909_median==0
	bys date RR: egen mean_by_date_RR_yield = mean(perp_yield)
	tabdisp date RR, cell(mean_by_date_RR_yield)
	* Same plot but only for EOD data
	drop mean_by_date_RR_yield
	preserve
		drop if transaction_data_dum==1
		bys date RR: egen mean_by_date_RR_yield = mean(perp_yield)
		tabdisp date RR, cell(mean_by_date_RR_yield)	
	restore

	*********************************
	* Time Series of Mean Yield (Coupond/Price) by 1909 Bond Rating 1908-1910
	*********************************	
	preserve
		drop if transaction_data_dum==1
		drop if year<=1906 | year>=1911
		replace rating_bond_1909_median=4 if rating_bond_1909_median>=4 & rating_bond_1909_median!=.
		bys date rating_bond_1909_median: egen mean_by_date_rating_yield = mean(perp_yield)
		tabdisp date rating_bond_1909_median, cell(mean_by_date_rating_yield)	
	restore	
	preserve
		drop if year<=1907 | year>=1911
		replace rating_bond_1909_median=4 if rating_bond_1909_median>=4 & rating_bond_1909_median!=.
		bys date rating_bond_1909_median: egen mean_by_date_rating_yield = mean(perp_yield)
		tabdisp date rating_bond_1909_median, cell(mean_by_date_rating_yield)	
	restore	

	*********************************
	* Analyze Surprises in Ratings
	*********************************	
	
	* Compute quantiles of 1908 issuer bond yields (conditional on having a rating)
	preserve
		drop if transaction_data_dum==1
		drop yield_1908 mn_yield_1908
		gen yield_1908 = perp_yield if year == 1908
		bys issuer_id: egen mn_yield_1908 = mean(yield_1908)
		*
		keep if rating_bond_1909_median!=. & rating_bond_1909_median!=0
		collapse mn_yield_1908, by(issuer_id)
		disp _N
		pctile pct_md_yd_08 = mn_yield_1908, nq(4)
		list pct_md_yd_08 in 1/4			
	restore
	*  Table 2. Resulting quartiles
	/*
     +----------+
     | pct_m~08 |
     |----------|
  1. | .0432819 |
  2. | .0466675 |
  3. | .0500002 		|
  4. |        . |
     +----------+
	*/	
	
	* Assign quartiles for each issuer based on 1908 average yields
	gen mn_yield_1908_bkt = 1 if mn_yield_1908<=0.0432819 
	replace mn_yield_1908_bkt = 2 if mn_yield_1908 <= 0.0466675 & mn_yield_1908 > 0.0432819 
	replace mn_yield_1908_bkt = 3 if mn_yield_1908 <= 0.0500002  & mn_yield_1908 > 0.0466675 
	replace mn_yield_1908_bkt = 4 if  mn_yield_1908 > 0.0500002  			

	* Get rating distribution by yield bucket
	preserve
		drop yield_1908 mn_yield_1908
		gen yield_1908 = perp_yield if year == 1908
		bys issuer_id: egen mn_yield_1908 = mean(yield_1908)
		*
		collapse mn_yield_1908_bkt rating_bond_1909_median, by(issuer_id)
		bys mn_yield_1908_bkt rating_bond_1909_median: egen cnt_bonds = count(mn_yield_1908_bkt)
		tabdisp mn_yield_1908_bkt rating_bond_1909_median, cell(cnt_bonds)
		bys mn_yield_1908_bkt: egen mean_rating_bond_1909_median = mean(rating_bond_1909_median)
		bys mn_yield_1908_bkt: egen median_rating_bond_1909_median = median(rating_bond_1909_median)
		tabdisp mn_yield_1908_bkt, cell(mean_rating_bond_1909_median median_rating_bond_1909_median)
	restore	
	/* Rating Distribution
	----------------------------------------------------------------
	(mean)    |
	mn_yield_ |               (mean) rating_bond_1909q              
	1908_bkt  |    1     2     3     4     5     6     7     8     .
	----------+-----------------------------------------------------
			1 |   24    16     3     1     1                       7
			2 |   16    19     5     2     1     1                 8
			3 |   10    12    15     4     4     1                19
			4 |   13     8    11     2     6     2     1     1    66
	----------------------------------------------------------------	
	*/
	
	* Define "surprises" within each rating bucket
	bys mn_yield_1908_bkt: egen md_rating_bond_1909_median = median(rating_bond_1909_median)
	gen rtg_bkt = 1 if rating_bond_1909_median<md_rating_bond_1909_median
	replace rtg_bkt = 2 if rating_bond_1909_median == md_rating_bond_1909_median
	replace rtg_bkt = 3 if rating_bond_1909_median > md_rating_bond_1909_median
	
	***************************
	* Compute average time series mean perp yield by "high" or not which is
	* a measure of if the rating was "higher" than average for that bucket
	format date %td
	bys date rtg_bkt mn_yield_1908_bkt: egen mean_perp_yield = mean(perp_yield)
	tabdisp date rtg_bkt mn_yield_1908_bkt, cell(mean_perp_yield)
	
	* Save the ratings and yield buckets for each issuer
	preserve
		collapse rating_bond_1909_median mn_yield_1908 rtg_bkt mn_yield_1908_bkt, by(issuer_id company_name)
		*tabdisp issuer_id, cell(rating_bond_1909q mn_yield_1908 rtg_bkt mn_yield_1908_bkt)
		keep issuer_id company_name rating_bond_1909_median mn_yield_1908 rtg_bkt mn_yield_1908_bkt
		outsheet using "rating_1909_surprise_v5_test.csv", comma replace
	restore	
	***************************
	
	* Generate dummy for post 1909 ratings are introduced
	gen event_1909 = 0
	replace event_1909 = . if (year>1909) | (year==1909 & (month>4 | (month==4 & day>=23)))	
	replace event_1909 = 1 if (year==1909 & month>=5)
	
	* Look at median before vs. after by rating surprise bucket
	preserve
		keep if rating_bond_1909_median<=5 & year>=1908 & year<=1909
		bys event_1909 rtg_bkt: egen mean_perp_yield_tmp=mean(perp_yield) 
		tabdisp event_1909 rtg_bkt, cell(mean_perp_yield_tmp)
	restore
	/*
---------------------------------------
event_190 |           rtg_bkt           
9         |        1         2         3
----------+-----------------------------
        0 | .0508061  .0443451  .0448376
        1 | .0478127  .0430929   .043937
        . | .0493086  .0431352  .0435833
----------------------------------------
	*/
	
	* Plot above and below median rating time series for all rating buckets...
	preserve
		keep if rating_bond_1909_median<=5 & year>=1908 & year<=1909
		bys date rtg_bkt: egen mean_perp_yield_tmp=mean(perp_yield) 
		tabdisp date rtg_bkt, cell(mean_perp_yield_tmp)
	restore
		
	* Compute "Lowest Risk Quartile" slide by computing trading volume in all rating surprise buckets and yield buckets
	preserve
		drop if transaction_data_dum==1
		keep if rating_bond_1909_median<=5 & year>=1908 & year<=1909
		bys date rtg_bkt mn_yield_1908_bkt: egen sum_volume_byRR = sum(salesXlast)
		tabdisp date rtg_bkt mn_yield_1908_bkt, cell(sum_volume_byRR)
	restore
	
	* Create dummies for below and above "expected" ratings
	gen BelowAvg = 0
	replace BelowAvg = 1 if rtg_bkt==3
	gen BelowAvgXevent = event_1909 * BelowAvg
	gen AboveAvg = 0
	replace AboveAvg = 1 if rtg_bkt==1
	gen AboveAvgXevent = event_1909 * AboveAvg	
	
	* Dummies for specific levels of ratings interacted with being post ratings
	gen RatingAa = 0
	replace RatingAa = 1 if rating_bond_1909_median==2
	gen RatingA = 0
	replace RatingA = 1 if rating_bond_1909_median==3
	gen RatingBaaOrLower = 0
	replace RatingBaaOrLower = 1 if rating_bond_1909_median>=4
	gen RatingAaPost1909 = RatingAa * event_1909
	gen RatingAPost1909 = RatingA * event_1909
	gen RatingBaaOrLowerPost1909 = RatingBaaOrLower * event_1909
	
	* Take log of variables to estimate elasticity in regressions
	gen ln_perp_yield = log(perp_yield)
	gen ln_salesXlast = log(salesXlast)

	* Generate issuer-level fixed effects for regressions
	xi i.issuer_id
	
	*********************************
	* Regressions
	*********************************		
	* Column (1)
	areg ln_perp_yield  _Iissuer_id_* AboveAvgXevent if rating_bond_1909_median<=5 & year>=1908 & year<=1909, absorb(date) vce(cluster issuer_id)
	* Column (2)
	areg ln_perp_yield  _Iissuer_id_* BelowAvgXevent if rating_bond_1909_median<=5 & year>=1908 & year<=1909, absorb(date) vce(cluster issuer_id)
	* Column (3)
	areg ln_perp_yield  _Iissuer_id_* AboveAvgXevent BelowAvgXevent RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909, absorb(date) vce(cluster issuer_id)
	* Column (4)
	areg perp_yield  _Iissuer_id_* AboveAvgXevent BelowAvgXevent RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909, absorb(date) vce(cluster issuer_id)
	* Column (5)
	areg ln_salesXlast  _Iissuer_id_* AboveAvgXevent BelowAvgXevent RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909, absorb(date) vce(cluster issuer_id)
	* NEW Column (6)
	areg price_impact  _Iissuer_id_* AboveAvgXevent BelowAvgXevent RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909, absorb(date) vce(cluster issuer_id)
	
	* Save data file that is cleaned and ready to run above analysis
	save merged_intra_wkly_Presentation20150609, replace

*********************************
*********************************
* New Analysis Using Holdings Data
*********************************
*********************************

* I manually matched holdings IDs to ratings surprises in rating_1909_surprise_v5_test.csv
import delimited "C:\Users\asafb\Dropbox (MIT)\RatingAgenciesPersonal\Data_Programs\Data\rating_1909_surprise_v5_WithHoldingsIDMatches.csv", clear 
	save rating_1909_surprise_v5_WithHoldingsIDMatches, replace

* Load holdings data, clean up a few company names manually, then merge with ratings surprises
* (I double checked by hand all (but only) firms that appeared in the ratings surprises file
use HoldingsData_Final_wIndustry, clear
	replace firm_id_holdings=256 if cname_hold_clean=="denver and rlo grande"
	replace firm_id_holdings=582 if cname_hold_clean=="new yorknew ha ven and hartford"
	replace firm_id_holdings=34 if cname_hold_clean=="atlantic coast line rr"
	replace firm_id_holdings=88 if cname_hold_clean=="buffalo and susquehanna railroad"
	replace firm_id_holdings=124 if cname_hold_clean=="central railroad and banking co of georgia"
	replace firm_id_holdings=141 if cname_hold_clean=="chicago and alton"
	replace firm_id_holdings=141 if cname_hold_clean=="chicago and alton railroad (the"
	replace firm_id_holdings=175 if cname_hold_clean=="chicago st louis andnew obleans"
	replace firm_id_holdings=204 if cname_hold_clean=="cleveland and pittsburgh"
	replace firm_id_holdings=220 if cname_hold_clean=="columbus and hocking valey"
	replace firm_id_holdings=261 if cname_hold_clean=="detroit and mackinack"
	replace firm_id_holdings=296 if cname_hold_clean=="evansville and terre haut"
	replace firm_id_holdings=369 if cname_hold_clean=="illiniois central"
	replace firm_id_holdings=369 if cname_hold_clean=="illiinois central"
	replace firm_id_holdings=369 if cname_hold_clean=="illinois centre"
	replace firm_id_holdings=387 if cname_hold_clean=="jefferson"
	replace firm_id_holdings=394 if cname_hold_clean=="kanawha & michigan"
	replace firm_id_holdings=405 if cname_hold_clean=="kansas city foitt scott and memphis"
	replace firm_id_holdings=433 if cname_hold_clean=="lehigh valley railway"
	replace firm_id_holdings=502 if cname_hold_clean=="minneapolis st paul and saulte ste marie"
	replace firm_id_holdings=502 if cname_hold_clean=="minneapolis st paul & sault ste marie"
	replace firm_id_holdings=573 if cname_hold_clean=="new york central and hudson river and new york central lines"
	replace firm_id_holdings=577 if cname_hold_clean=="new york chicago axd st louis"
	replace firm_id_holdings=577 if cname_hold_clean=="new york chicago and st louis first"
	replace firm_id_holdings=587 if cname_hold_clean=="new york susqcehanna and western"
	replace firm_id_holdings=730 if cname_hold_clean=="richmond and mecklenburg"
	replace firm_id_holdings=760 if cname_hold_clean=="st louis and san fransisco"
	replace firm_id_holdings=770 if cname_hold_clean=="st louis southwestern equipment"	
	replace firm_id_holdings=855 if cname_hold_clean=="texas axd pacific"
	replace firm_id_holdings=855 if cname_hold_clean=="texas and pacific equipment"
	replace firm_id_holdings=863 if cname_hold_clean=="toledo st loiis and western"
	replace firm_id_holdings=864 if cname_hold_clean=="toledo walhondtng valley and ohio"	
	replace firm_id_holdings=881 if cname_hold_clean=="van dalia railroad"
	replace firm_id_holdings=891 if cname_hold_clean=="wabash r r"
	*
	merge m:m firm_id_holdings using rating_1909_surprise_v5_WithHoldingsIDMatches, force
	gen has_surprise = 1 if _merge==3
	drop _merge
	keep if has_surprise == 1
	* 
	save HoldingsData_Final_wIndustry_1909_Surprise, replace

* File contains investor-level holdings data as well as ratings surprises (based on 1908 mean issuer-level bond yields and 1909 rating)	
use HoldingsData_Final_wIndustry_1909_Surprise, clear
	* Compute investor-level concentration
	bys book_year_hold firm_id_holdings investor_id: egen investor_par_value_clean_hold = sum(par_value_clean_hold)
	duplicates drop book_year_hold firm_id_holdings investor_id, force	
	bys book_year_hold firm_id_holdings: egen sum_investor_hold = sum(investor_par_value_clean_hold)
	*
	gen investor_share = investor_par_value_clean_hold/sum_investor_hold	
	gen investor_share_2 = investor_share^2
	bys book_year_hold firm_id_holdings: egen concentration_v1 = sum(investor_share_2)
	bys book_year_hold firm_id_holdings: egen cnt_investors = count(investor_share_2)
	duplicates drop book_year_hold firm_id_holdings, force	
	*
	gen concentration_1908_tmp = concentration_v1 if book_year_hold==1908
	bys firm_id_holdings issue_id_holdings: egen concentration_1908 = max(concentration_1908_tmp)
	* Compute issuer-level concentrations
	preserve
		keep issuer_id concentration_1908
		duplicates drop issuer_id concentration_1908, force
		save concentration_1908_v3, replace
	restore	

* Load concentrations at an issuer-level, and remove those without any concentration information
use concentration_1908_v3, clear
	drop if concentration_1908==.
	sort issuer_id
	save concentration_1908_final_v3, replace		

* Merge concentration data w/ 1909 ratings surprise data from agove (at issuer-level)
use merged_intra_wkly_Presentation20150609, clear
	merge m:m issuer_id using concentration_1908_final_v3, force
	gen has_concentration = 1 if _merge==3
	drop _merge
	keep if has_concentration == 1
	* Compute concentration summary statistics (within an issuer concentration)
	preserve
		keep if rating_bond_1909_median<=5 & year>=1908 & year<=1909
		duplicates drop issuer_id, force
		sum concentration_1908, d
	restore
/*
                     concentration_1908
-------------------------------------------------------------
      Percentiles      Smallest
 1%     .0426781        .027502
 5%     .0564531       .0426781
10%     .0703082       .0463323       Obs                 164
25%     .0952376       .0471067       Sum of Wgt.         164

50%     .1554381                      Mean           .2286795
                        Largest       Std. Dev.      .2126011
75%     .2589928              1
90%     .5023375              1       Variance       .0451992
95%     .7923876              1       Skewness        2.15589
99%            1              1       Kurtosis       7.421875
*/
	preserve
		* Deonte "high" concentration if concentration is higher than median concentration in 1908
		gen Hi_concentration_1908=0
		replace Hi_concentration_1908=1 if concentration_1908>=0.1554381
		gen Hi_concentration_1908_PostEvent = event_1909*Hi_concentration_1908
		gen ConcentratedAboveAvg = Hi_concentration_1908 * AboveAvgXevent
		gen ConcentratedBelowAvg = Hi_concentration_1908 * BelowAvgXevent
		*************
		* Regressions w/ concentration variable
		*************
		* Table 3 Column (5)
		areg ln_perp_yield  _Iissuer_id_* Hi_concentration_1908_PostEvent ConcentratedAboveAvg AboveAvgXevent  BelowAvgXevent ConcentratedBelowAvg RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909  & has_concentration==1, absorb(date) vce(cluster issuer_id)
		* Table 4 Column (2)
		areg ln_salesXlast  _Iissuer_id_* Hi_concentration_1908_PostEvent ConcentratedAboveAvg AboveAvgXevent  BelowAvgXevent ConcentratedBelowAvg RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909  & has_concentration==1, absorb(date) vce(cluster issuer_id)
	restore
	
****************************************************************************
* Issue-level fixed effects instead of issuer-level fixed effects like before
* (NOT currently used in paper, but worth considering since probably makes
* more sense, or at least gives another interpetation and similar results).
****************************************************************************	
* Main Regression (not interaction with concentration variable)
use merged_intra_wkly_Presentation20150609, clear
	set matsize 5000
	* Issue-id fixed effects
	egen unique_issue_id = group(issuer_id issue_id)
	xi i.date
	areg ln_perp_yield  _Idate_* AboveAvgXevent BelowAvgXevent RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909, absorb(unique_issue_id) vce(cluster issuer_id)

* Interaction with concentration variable
use merged_intra_wkly_Presentation20150609, clear
	set matsize 5000
	* Issue-id fixed effects
	egen unique_issue_id = group(issuer_id issue_id)
	xi i.date
	merge m:m issuer_id using concentration_1908_final_v2, force
	gen has_concentration = 1 if _merge==3
	drop _merge
	keep if has_concentration == 1
	preserve
		gen Hi_concentration_1908=0
		replace Hi_concentration_1908=1 if concentration_1908>=0.4302188
		gen Hi_concentration_1908_PostEvent = event_1909*Hi_concentration_1908
		gen ConcentratedAboveAvg = Hi_concentration_1908 * AboveAvgXevent
		gen ConcentratedBelowAvg = Hi_concentration_1908 * BelowAvgXevent
		* Regression
		areg ln_perp_yield  _Idate_* Hi_concentration_1908_PostEvent ConcentratedAboveAvg AboveAvgXevent  BelowAvgXevent ConcentratedBelowAvg RatingAaPost1909 RatingAPost1909 RatingBaaOrLowerPost1909 if rating_bond_1909_median<=5 & year>=1908 & year<=1909  & has_concentration==1, absorb(unique_issue_id) vce(cluster issuer_id)
	restore		

* finish logging
log close	
	
	
	