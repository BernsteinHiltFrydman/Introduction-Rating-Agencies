
* VERY CLOSE TO POWERPOINT RESULTS
* in IntroRA_Presentation_20140520.pptx
* 
* Last checked on 5/15/2015

cd "C:\Users\asafb\Dropbox (MIT)\RatingAgencies\Data_Programs\Data"
* Load the NYSE Bond secondary market data (combined intra-day and EOD)
use merged_intra_wkly, clear
	drop _merge
	* Merge with firm-level ratings
	merge m:m issuer_id using Firm_Ratings_v2, force 
	* 3,349 observations don't match
	keep if _merge==3
	drop _merge	
	
	disp _N
	* Start with 85,466 observations
	
	* Compute the mean yield in 1908 (for surprises)
	gen yield_1908 = perp_yield if year == 1908
	bys issuer_id: egen mn_yield_1908 = mean(yield_1908)

	* Force the unit of observation to be 1 issue per date
	egen unique_id = group(issuer_id issue_id)
	duplicates drop unique_id date, force
	* 3,046 observations dropped (need to look at this more)
	xtset unique_id date
	
	* Define the numeric (1=Aaa) rating of the firm across all bonds
	rename rating_bond_1909_medianq rating_bond_1909_median	
	replace rating_bond_1909_median = ceil(rating_bond_1909_median)
	
	* Remove all issuers without a 1908 bond yield (since can't compute surprise)
	drop if mn_yield_1908==. | mn_yield_1908==0 | mn_yield_1908<0
	* 5,594 observations dropped
	
	* Define "surprises" within each rating bucket
	gen mn_yield_1908_bkt = 1 if mn_yield_1908<=0.0429647 
	replace mn_yield_1908_bkt = 2 if mn_yield_1908 <= 0.0465089 & mn_yield_1908 > 0.0429647 
	replace mn_yield_1908_bkt = 3 if mn_yield_1908 <= 0.0497087 & mn_yield_1908 > 0.0465089 
	replace mn_yield_1908_bkt = 4 if  mn_yield_1908 > 0.0497087 	
	bys mn_yield_1908_bkt: egen md_rating_bond_1909_median = median(rating_bond_1909_median)
	gen rtg_bkt = 1 if rating_bond_1909_median<md_rating_bond_1909_median
	replace rtg_bkt = 2 if rating_bond_1909_median == md_rating_bond_1909_median
	replace rtg_bkt = 3 if rating_bond_1909_median > md_rating_bond_1909_median
	
	* Generate dummy for post 1909 ratings are introduced
	gen event_1909 = 0
	replace event_1909 = . if (year>1909) | (year==1909 & (month>4 | (month==4 & day>=23)))	
	replace event_1909 = 1 if (year==1909 & month>=5)
	
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
	
	* Regression from Slide 31 of IntroRA_Presentation_20140520.pptx
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
	


