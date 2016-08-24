*
* Main data files for intro RA analysis
* Last updated 5/27/2015 by Asaf Bernstein
*
*cd "C:\Users\asafb\Dropbox (MIT)\RatingAgenciesPersonal\Data_Programs\Data"
cd "\\tsclient\C\Users\asafb\Dropbox (MIT)\RatingAgencies\Data_Programs\Data"
clear

* Load weekly end-of-day NYSE Bond Data
use "weekly_data_cleaned_v1.dta", clear
* issuer_id = unique identifier given to each bond issuer (company)
* issue_id = unique identifier given to each bond issue
* trade_id = unique identifier given to each unique transaction type (ex. ex-div)
	keep if year>=1908
	disp _N
	drop if issuer_id==.
	preserve
		duplicates drop issuer_id, force
		disp _N
	restore
	preserve
		duplicates drop issue_id issuer_id, force
		disp _N
	restore
	
	merge m:m issuer_id using intraday_data_cleaned_v1, force
/*
    Result                           # of obs.
    -----------------------------------------
    not matched                           849
        from master                       586  (_merge==1)
        from using                        263  (_merge==2)

    matched                            77,885  (_merge==3)
    -----------------------------------------
*/
	keep if _merge==3
	disp _N
	preserve
		duplicates drop issuer_id, force
		disp _N
	restore
	preserve
		duplicates drop issue_id issuer_id, force
		disp _N
	restore

* Load weekly end-of-day NYSE Bond Data
use "weekly_data_cleaned_v1.dta", clear
* issuer_id = unique identifier given to each bond issuer (company)
* issue_id = unique identifier given to each bond issue
* trade_id = unique identifier given to each unique transaction type (ex. ex-div)
	keep if year>=1908
	disp _N
	drop if issuer_id==.
	preserve
		duplicates drop issuer_id, force
		disp _N
	restore
	preserve
		duplicates drop issue_id issuer_id, force
		disp _N
	restore
	
	merge m:m issuer_id issue_id using intraday_data_cleaned_v1, force
	keep if _merge==3
	disp _N
	preserve
		duplicates drop issuer_id, force
		disp _N
	restore
	preserve
		duplicates drop issue_id issuer_id, force
		disp _N
	restore	
	
* Load investor holdings data
use "HoldingsData_Final.dta", clear
* issuer_id = unique identifier given to each bond issuer (company)
	disp _N
	preserve
		duplicates drop firm_id_holdings, force
		disp _N
	restore
	preserve
		duplicates drop issue_id_holdings firm_id_holdings, force
		disp _N
	restore
	
	merge m:m issuer_id using weekly_data_cleaned_v1

/*
    Result                           # of obs.
    -----------------------------------------
    not matched                       162,001
        from master                   161,415  (_merge==1)
        from using                        586  (_merge==2)

    matched                            81,669  (_merge==3)
    -----------------------------------------
*/
	keep if _merge==3
	drop _merge
	
	disp _N
	preserve
		duplicates drop issuer_id, force
		disp _N
	restore
	preserve
		duplicates drop issue_id issuer_id, force
		disp _N
	restore
	

* Load weekly intraday NYSE Bond Data
use "intraday_data_cleaned_v1.dta", clear
* issuer_id = unique identifier given to each bond issuer (company)
* issue_id = unique identifier given to each bond issue
* trade_id = unique identifier given to each unique transaction type (ex. ex-div)
	disp _N
	drop if issuer_id==.
	preserve
		duplicates drop issuer_id, force
		disp _N
	restore
	preserve
		duplicates drop issue_id issuer_id, force
		disp _N
	restore	
	
* Load investor holdings data
use "HoldingsData_Final.dta", clear
	merge m:m issuer_id using intraday_data_cleaned_v1

/*
    Result                           # of obs.
    -----------------------------------------
    not matched                       162,001
        from master                   161,415  (_merge==1)
        from using                        586  (_merge==2)

    matched                            81,669  (_merge==3)
    -----------------------------------------
*/	drop if issuer_id==.
	keep if _merge==3
	drop _merge
	
	disp _N
	preserve
		duplicates drop issuer_id, force
		disp _N
	restore
	preserve
		duplicates drop issue_id issuer_id, force
		disp _N
	restore

	
* Holdings Data Geographic Analysis
use "HoldingsData_Final.dta", clear
	* Compute concentration of investors in each asset
	sum par_value_clean_hold, d
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_par_value_clean_hold = sum(par_value_clean_hold)
	gen investor_share = par_value_clean_hold/sum_par_value_clean_hold	
	gen investor_share_2 = investor_share^2
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_investor_share_2 = sum(investor_share_2)
	bys book_year_hold: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
	bys book_year_hold: egen median_sum_investor_share_2 = median(sum_investor_share_2)
	tabdisp book_year_hold, cell(mean_sum_investor_share_2 median_sum_investor_share_2)
use "HoldingsData_Final.dta", clear
	* Compute concentration of holdings of each investor
	sum par_value_clean_hold, d
	bys book_year_hold investor_id: egen sum_par_value_clean_hold = sum(par_value_clean_hold)
	gen investor_share = par_value_clean_hold/sum_par_value_clean_hold	
	gen investor_share_2 = investor_share^2
	bys book_year_hold investor_id: egen sum_investor_share_2 = sum(investor_share_2)
	bys book_year_hold: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
	bys book_year_hold: egen median_sum_investor_share_2 = median(sum_investor_share_2)
	tabdisp book_year_hold, cell(mean_sum_investor_share_2 median_sum_investor_share_2)	

use "HoldingsData_Final.dta", clear
	* Compute geographic concentration of investors in each asset
	sum par_value_clean_hold, d
	bys book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold: egen state_par_value_clean_hold = sum(par_value_clean_hold)
	duplicates drop book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold, force
	
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_par_value_clean_hold = sum(state_par_value_clean_hold)
	gen investor_share = state_par_value_clean_hold/sum_par_value_clean_hold	
	gen investor_share_2 = investor_share^2
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_investor_share_2 = sum(investor_share_2)
	bys book_year_hold: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
	bys book_year_hold: egen median_sum_investor_share_2 = median(sum_investor_share_2)
	tabdisp book_year_hold, cell(mean_sum_investor_share_2 median_sum_investor_share_2)	
	
	bys book_year_hold: egen p1_sum_investor_share_2 = pctile(sum_investor_share_2), p(1)
	bys book_year_hold: egen p5_sum_investor_share_2 = pctile(sum_investor_share_2), p(5)
	bys book_year_hold: egen p10_sum_investor_share_2 = pctile(sum_investor_share_2), p(10)
	bys book_year_hold: egen p25_sum_investor_share_2 = pctile(sum_investor_share_2), p(25)
	bys book_year_hold: egen p50_sum_investor_share_2 = pctile(sum_investor_share_2), p(50)
	bys book_year_hold: egen p75_sum_investor_share_2 = pctile(sum_investor_share_2), p(75)
	bys book_year_hold: egen p90_sum_investor_share_2 = pctile(sum_investor_share_2), p(90)
	bys book_year_hold: egen p95_sum_investor_share_2 = pctile(sum_investor_share_2), p(95)
	bys book_year_hold: egen p99_sum_investor_share_2 = pctile(sum_investor_share_2), p(99)
	tabdisp book_year_hold, cell(p50_sum_investor_share_2 p75_sum_investor_share_2 p90_sum_investor_share_2 p95_sum_investor_share_2 p99_sum_investor_share_2)
	tabdisp book_year_hold, cell(p1_sum_investor_share_2 p5_sum_investor_share_2 p10_sum_investor_share_2 p25_sum_investor_share_2 p50_sum_investor_share_2)

* Redo herfindhal via count rather than $...
use "HoldingsData_Final.dta", clear
	* Compute geographic concentration of investors in each asset
	sum par_value_clean_hold, d
	bys book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold: egen state_par_value_clean_hold = sum(par_value_clean_hold)
	duplicates drop book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold, force
	
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_par_value_clean_hold = sum(state_par_value_clean_hold)
	gen investor_share = par_value_clean_hold/sum_par_value_clean_hold	
	gen investor_share_2 = investor_share^2
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_investor_share_2 = sum(investor_share_2)
	bys book_year_hold: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
	bys book_year_hold: egen median_sum_investor_share_2 = median(sum_investor_share_2)
	tabdisp book_year_hold, cell(mean_sum_investor_share_2 median_sum_investor_share_2)	
	
	bys book_year_hold: egen p1_sum_investor_share_2 = pctile(sum_investor_share_2), p(1)
	bys book_year_hold: egen p5_sum_investor_share_2 = pctile(sum_investor_share_2), p(5)
	bys book_year_hold: egen p10_sum_investor_share_2 = pctile(sum_investor_share_2), p(10)
	bys book_year_hold: egen p25_sum_investor_share_2 = pctile(sum_investor_share_2), p(25)
	bys book_year_hold: egen p50_sum_investor_share_2 = pctile(sum_investor_share_2), p(50)
	bys book_year_hold: egen p75_sum_investor_share_2 = pctile(sum_investor_share_2), p(75)
	bys book_year_hold: egen p90_sum_investor_share_2 = pctile(sum_investor_share_2), p(90)
	bys book_year_hold: egen p95_sum_investor_share_2 = pctile(sum_investor_share_2), p(95)
	bys book_year_hold: egen p99_sum_investor_share_2 = pctile(sum_investor_share_2), p(99)
	tabdisp book_year_hold, cell(p50_sum_investor_share_2 p75_sum_investor_share_2 p90_sum_investor_share_2 p95_sum_investor_share_2 p99_sum_investor_share_2)
	tabdisp book_year_hold, cell(p1_sum_investor_share_2 p5_sum_investor_share_2 p10_sum_investor_share_2 p25_sum_investor_share_2 p50_sum_investor_share_2)
	

use "HoldingsData_Final.dta", clear
	* Compute geographic concentration of investors in each asset
	gen is_stock = 0
	replace is_stock = 1 if stock_type_hold!="N/A" & stock_type_hold!=""
	
	sum par_value_clean_hold, d
	bys book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold: egen state_par_value_clean_hold = sum(par_value_clean_hold)
	duplicates drop book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold, force
	
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_par_value_clean_hold = sum(state_par_value_clean_hold)
	gen investor_share = par_value_clean_hold/sum_par_value_clean_hold	
	gen investor_share_2 = investor_share^2
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_investor_share_2 = sum(investor_share_2)
	bys book_year_hold is_stock: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
	bys book_year_hold is_stock: egen median_sum_investor_share_2 = median(sum_investor_share_2)
	tabdisp book_year_hold is_stock, cell(mean_sum_investor_share_2)		
	tabdisp book_year_hold is_stock, cell(median_sum_investor_share_2)

* Start 4/8/2015
* Try to merge in industry info for holdings data
import delimited "C:\Users\asafb\Dropbox (MIT)\RatingAgenciesPersonal\Data_Programs\Data\20150408\Poors_HandbookofInvestors1908_1911_1913_Industries.csv", clear 
	save Poors_HandbookofInvestors1908_1911_1913_Industries, replace
	
use "HoldingsData_Final.dta", clear
	merge m:m cname_hold_orig book_year_hold using Poors_HandbookofInvestors1908_1911_1913_Industries, force
	
use "HoldingsData_Final.dta", clear
	merge m:m cname_hold_orig using Poors_HandbookofInvestors1908_1911_1913_Industries, force
	drop if _merge==2
	keep if _merge==1

import delimited "C:\Users\asafb\Dropbox (MIT)\RatingAgenciesPersonal\Data_Programs\Data\20150408\Poors_HandbookofInvestors1908_1911_1913_Industries_Trimmed.csv", clear 
	save Poors_HandbookofInvestors1908_1911_1913_Industries_Trimmed, replace	

use "HoldingsData_Final.dta", clear
	merge m:m cname_hold_orig using Poors_HandbookofInvestors1908_1911_1913_Industries_Trimmed, force	
	drop if _merge==2
	drop _merge
	merge m:m cname_hold_orig using Poors_HandbookofInvestors1908_1911_1913_Industries, force
	drop if _merge==2
	drop _merge	
	
import delimited "C:\Users\asafb\Dropbox (MIT)\RatingAgenciesPersonal\Data_Programs\Data\20150408\Poors_HandbookofInvestors1908_1911_1913_Industries_Final.csv", clear 
	save Poors_HandbookofInvestors1908_1911_1913_Industries_Final, replace	

use "HoldingsData_Final.dta", clear
	merge m:m cname_hold_orig using Poors_HandbookofInvestors1908_1911_1913_Industries_Final, force
	drop if _merge==2
	preserve
		duplicates drop cname_hold_orig, force
		keep if _merge==1
		disp _N
	restore
	preserve
		duplicates drop cname_hold_orig, force
		keep if _merge==3
		disp _N
	restore	
* End 4/8/2015	
	
* Start 4/21/2015
use "HoldingsData_Final.dta", clear
	merge m:m cname_hold_orig using Poors_HandbookofInvestors1908_1911_1913_Industries_Final, force
	keep if _merge!=3
	
	duplicates drop cname_hold_orig, force
	disp _N
	* 7609

use "Poors_HandbookofInvestors1908_1911_1913_Industries_Final.dta", clear

	replace cname_hold_orig = itrim(cname_hold_orig)
	replace cname_hold_orig = trim(cname_hold_orig)
	merge m:m cname_hold_orig using HoldingsData_Final, force
	keep if _merge!=3
	
	duplicates drop cname_hold_orig, force
	disp _N
	* 3,828

use "HoldingsData_Final.dta", clear
	replace cname_hold_orig = itrim(cname_hold_orig)
	replace cname_hold_orig = trim(cname_hold_orig)
	save HoldingsData_Final_trimmed, replace
	
use "Poors_HandbookofInvestors1908_1911_1913_Industries_Final.dta", clear

	replace cname_hold_orig = itrim(cname_hold_orig)
	replace cname_hold_orig = trim(cname_hold_orig)
	merge m:m cname_hold_orig using HoldingsData_Final_trimmed, force
	keep if _merge!=3
	
	duplicates drop cname_hold_orig, force
	disp _N
	* 117	

* Takes care of making sure trimming is consistent and deals with
* names which were originally altered by placement of " inside of text	
use "HoldingsData_Final.dta", clear
	replace cname_hold_orig = subinstr(cname_hold_orig, "?", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "„", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "—", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "•", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, `"""', " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, ".", " ", .)
	replace cname_hold_orig = itrim(cname_hold_orig)
	replace cname_hold_orig = trim(cname_hold_orig)	
	replace cname_hold_orig = "WESTERN AMERICAN REALTY COMPANY" if cname_hold_orig=="AMERICAN REALTY COMPANY"
	replace cname_hold_orig = "PRESBYTERIAN HOSPITAL OF PITTSBURGH" if cname_hold_orig=="HOSPITAL OF PITTSBURGH"
	replace cname_hold_orig = "PITTSBURGH MALLEABLE IRON COMPANY" if cname_hold_orig=="COMPANY" & investor_name_hold=="Imperial Assurance Company"
	replace cname_hold_orig = "HUDSON NAVIGATION COMPANY" if cname_hold_orig=="COMPANY" & investor_name_hold=="Pennsylvania Trust Company of Reading."
	replace cname_hold_orig = "HUDSON NAVIGATION COMPANY" if cname_hold_orig=="COMPANY" & investor_name_hold=="Troy Trust Company"
	replace cname_hold_orig = "HUDSON NAVIGATION COMPANY" if cname_hold_orig=="COMPANY" & investor_name_hold=="Sharon Savings & Trust Company"
	replace cname_hold_orig = "YORK TELEPHONE COMPANY" if cname_hold_orig=="COMPANY" & investor_name_hold=="Security Title A Trust Company"
	replace cname_hold_orig = "OLD COLONY INSURANCE (Boston, Mass.) " if cname_hold_orig=="INSURANCE (Boston, Mass )"
	replace cname_hold_orig = "FOREST  A  5's, 1910." if cname_hold_orig=="5's, 1910"
	replace cname_hold_orig = subinstr(cname_hold_orig, "?", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "„", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "—", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "•", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, `"""', " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, ".", " ", .)
	replace cname_hold_orig = itrim(cname_hold_orig)
	replace cname_hold_orig = trim(cname_hold_orig)	
	save HoldingsData_Final_trimmed_v2, replace
	
use "Poors_HandbookofInvestors1908_1911_1913_Industries_Final.dta", clear
	replace cname_hold_orig = subinstr(cname_hold_orig, "?", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "„", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "—", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, "•", " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, `"""', " ", .)
	replace cname_hold_orig = subinstr(cname_hold_orig, ".", " ", .)
	replace cname_hold_orig = itrim(cname_hold_orig)
	replace cname_hold_orig = trim(cname_hold_orig)	
	save Poors_HandbookofInvestors1908_1911_1913_Industries_Final_v2, replace
	merge m:m cname_hold_orig using HoldingsData_Final_trimmed_v2, force
	keep if _merge==2
	
	duplicates drop cname_hold_orig, force
	disp _N
	* No companies from HoldingsData_Final_trimmed_v2 are missing industries now

* Add-in indsturies and re-save holdings data final file
use HoldingsData_Final_trimmed_v2, clear
	merge m:m cname_hold_orig using Poors_HandbookofInvestors1908_1911_1913_Industries_Final_v2, force
	keep if _merge==3
	drop _merge
	drop if cname_hold_orig==""
	save HoldingsData_Final_wIndustry_tmp, replace

* Clean-up a few common mistakes for issuer id
use HoldingsData_Final_wIndustry_tmp, clear	
	preserve
		duplicates drop firm_id_holdings, force
		disp _N
		* 18,218
	restore
	replace cname_hold_clean = trim(cname_hold_clean)
	replace cname_hold_clean = cname_hold_orig if cname_hold_clean==""
	replace cname_hold_clean = lower(cname_hold_clean)
	replace cname_hold_clean = subinstr(cname_hold_clean, "company","",.)
	replace cname_hold_clean = subinstr(cname_hold_clean, "corporation","",.)
	replace cname_hold_clean = cname_hold_orig if cname_hold_clean==""
	replace cname_hold_clean = trim(cname_hold_clean)
	replace cname_hold_clean = lower(cname_hold_clean)
	replace cname_hold_clean = subinstr(cname_hold_clean, "company","",.)
	replace cname_hold_clean = subinstr(cname_hold_clean, "corporation","",.)	
	replace cname_hold_clean = subinstr(cname_hold_clean, "5","s",.)
	replace cname_hold_clean = subinstr(cname_hold_clean, "8","s",.)
	replace cname_hold_clean = subinstr(cname_hold_clean, "1","t",.)
	replace cname_hold_clean = subinstr(cname_hold_clean, "'","",.)
	replace cname_hold_clean = regexr(cname_hold_clean, "\(.*\)","")
	replace cname_hold_clean = trim(cname_hold_clean)
	replace cname_hold_clean = regexr(cname_hold_clean, "^[0-9]","")
	replace cname_hold_clean = trim(cname_hold_clean)
	bys cname_hold_clean industry: egen min_firm_id_holdings = min(firm_id_holdings)
	bys cname_hold_clean industry: egen min_issuer_id = min(issuer_id)
	replace firm_id_holdings = min_firm_id_holdings
	replace issuer_id = min_issuer_id
	drop min_firm_id_holdings min_issuer_id
	preserve
		duplicates drop firm_id_holdings, force
		disp _N
		* 15,182
	restore
	rename issuer_id nyse_bond_issuer_id
	save HoldingsData_Final_wIndustry, replace
	
******************************************
* Look at geographic breakdown by industry
******************************************

* First just get amount in each industry over time
use HoldingsData_Final_wIndustry, clear
	bys book_year_hold industry: egen amt_issues = sum(par_value_clean_hold)
	format amt_issues %12.0g
	
	duplicates drop book_year_hold industry issuer_id firm_id_holdings issue_id_holdings, force
	bys book_year_hold industry: egen cnt_issues = count(par_value_clean_hold)
	
	duplicates drop book_year_hold industry firm_id_holdings, force
	bys book_year_hold industry: egen cnt_issuers = count(par_value_clean_hold)
	tabdisp book_year_hold industry, cell(amt_issues)	
	tabdisp book_year_hold industry, cell(cnt_issues)	
	tabdisp book_year_hold industry, cell(cnt_issuers)	

use HoldingsData_Final_wIndustry, clear
	* Compute geographic concentration of investors in each asset
	sum par_value_clean_hold, d
	bys book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold: egen state_par_value_clean_hold = sum(par_value_clean_hold)
	duplicates drop book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold, force
	
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_par_value_clean_hold = sum(state_par_value_clean_hold)
	gen investor_share = par_value_clean_hold/sum_par_value_clean_hold	
	gen investor_share_2 = investor_share^2
	bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_investor_share_2 = sum(investor_share_2)
	bys book_year_hold industry: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
	bys book_year_hold industry: egen median_sum_investor_share_2 = median(sum_investor_share_2)
	tabdisp book_year_hold industry, cell(mean_sum_investor_share_2)		
	tabdisp book_year_hold industry, cell(median_sum_investor_share_2)	
	
* Print out just the company names so can see if they appear in 1909 RR Moody's TOC	
use HoldingsData_Final_wIndustry, clear
	duplicates drop firm_id_holdings, force
	keep firm_id_holdings cname_hold_orig cname_hold_clean
	
import delimited "C:\Users\asafb\Dropbox (MIT)\RatingAgenciesPersonal\Data_Programs\Data\20150422\1909_RR_Manual_TOC_HoldingsMatches.csv", clear 
	save 1909_RR_Manual_TOC_HoldingsMatches, replace	

* Merge a dummy for parent company appears in 1909 TOC. Still need to deal with subsidiaries
use HoldingsData_Final_wIndustry, clear	
	merge m:m cname_hold_orig cname_hold_clean using 1909_RR_Manual_TOC_HoldingsMatches, force
	drop _merge
	bys firm_id_holdings: egen RR_TOC_1909 = max(_rr_manual_toc)
	drop _rr_manual_toc
	save HoldingsData_Final_wIndustry_w1909TOC, replace
	
use HoldingsData_Final_wIndustry_w1909TOC, clear
	keep if RR_TOC_1909==1
	bys book_year_hold industry: egen amt_issues = sum(par_value_clean_hold)
	format amt_issues %12.0g
	
	duplicates drop book_year_hold industry issuer_id firm_id_holdings issue_id_holdings, force
	bys book_year_hold industry: egen cnt_issues = count(par_value_clean_hold)
	
	duplicates drop book_year_hold industry firm_id_holdings, force
	bys book_year_hold industry: egen cnt_issuers = count(par_value_clean_hold)
	tabdisp book_year_hold industry, cell(amt_issues)	
	tabdisp book_year_hold industry, cell(cnt_issues)	
	tabdisp book_year_hold industry, cell(cnt_issuers)	
	
* End 4/21/2015
	
* Start 4/25/2015	

* Print out just the company names for non-governments so can match to the 
* NYSE stock data
use HoldingsData_Final_wIndustry, clear
	keep if industry=="Industrial and Misc" | industry=="Steam Railroad" | industry=="Bank and Trust" | industry=="Street Railway"
	keep if stock_type_hold=="Stock"
	duplicates drop firm_id_holdings, force
	keep firm_id_holdings cname_hold_orig cname_hold_clean nyse_bond_issuer_id industry
	format %12.0g firm_id_holdings
	
* Print out just the company names for non-governments so can match to the 
* NYSE bond data
use HoldingsData_Final_wIndustry, clear
	keep if industry=="Industrial and Misc" | industry=="Steam Railroad" | industry=="Bank and Trust" | industry=="Street Railway"
	keep if stock_type_hold!="Stock"
	duplicates drop firm_id_holdings, force
	keep firm_id_holdings cname_hold_orig cname_hold_clean nyse_bond_issuer_id industry
	format %12.0g firm_id_holdings

* Print out just the company names for all so can check consistency of holdings company IDs
* Across years
use HoldingsData_Final_wIndustry, clear
	duplicates drop firm_id_holdings industry book_year_hold, force
	keep firm_id_holdings cname_hold_orig cname_hold_clean industry book_year_hold
	format %12.0g firm_id_holdings	
	

* End 4/25/2015

* Start 5/4/2015
use HoldingsData_Final_wIndustry, clear
	
	keep firm_id_holdings cname_hold_orig cname_hold_clean book_year_hold industry
	duplicates drop firm_id_holdings cname_hold_orig, force
	
	* Get number of cases where issuer_id is assigned
	* to more than one original company name
	bys firm_id_holdings: egen cnt_1 = count(firm_id_holdings)
	keep if cnt_1>=2
	disp _N
	* 13,994
	
	* Make company name lower case and look at duplicates again
	gen cname_hold_clean_code = cname_hold_orig
	replace cname_hold_clean_code = lower(cname_hold_clean_code)
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_2 = count(firm_id_holdings)
	keep if cnt_2>=2
	disp _N	
	* 13,933
	
	* Replace company with blank
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "company","",.)
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_3 = count(firm_id_holdings)
	keep if cnt_3>=2
	disp _N	
	* 13,707
	
	* Replace corporation with blank
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "corporation","",.)
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_4 = count(firm_id_holdings)
	keep if cnt_4>=2
	disp _N	
	* 13,698

	* Get rid of things in parantheses
	replace cname_hold_clean_code = regexr(cname_hold_clean_code, "\(.*\)","")
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_5 = count(firm_id_holdings)
	keep if cnt_5>=2
	disp _N	
	* 13,326
	
	* Replace apostrophe with blanks
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "'","",.)
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_6 = count(firm_id_holdings)
	keep if cnt_6>=2
	disp _N
	* 13,291

	* Fix numbers, replace 5 with S and 1 with t and initial numbers
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "5","s",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "8","s",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "1","t",.)
	replace cname_hold_clean_code = regexr(cname_hold_clean_code, "^[0-9]","")	
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_7 = count(firm_id_holdings)
	keep if cnt_7>=2
	disp _N
	* 13,286	

	* Remove trailing and leading spaces
	replace cname_hold_clean_code = trim(cname_hold_clean_code)	
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_8 = count(firm_id_holdings)
	keep if cnt_8>=2
	disp _N
	* 10,263		

	* Remove commas
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, ",","",.)
	replace cname_hold_clean_code = trim(cname_hold_clean_code)
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_9 = count(firm_id_holdings)
	keep if cnt_9>=2
	disp _N
	* 4,798	
	drop cnt*
	drop cname_hold_clean
	
	* Only count those in same industries
	bys firm_id_holdings industry: egen cnt_10 = count(firm_id_holdings)
	keep if cnt_10>=2
	disp _N
	* 4,133	
	
	* Replace & with and double blanks and - with space
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "&","and",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "-"," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = trim(cname_hold_clean_code)
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_11 = count(firm_id_holdings)
	keep if cnt_11>=2
	disp _N
	* 3,848

	* Replace ry and rr
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "ry","railway",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "rr","railroad",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = subinstr(cname_hold_clean_code, "  "," ",.)
	replace cname_hold_clean_code = trim(cname_hold_clean_code)
	duplicates drop firm_id_holdings cname_hold_clean_code, force
	bys firm_id_holdings: egen cnt_12 = count(firm_id_holdings)
	keep if cnt_12>=2
	disp _N
	* 3,824
	
	* Try built-in fuzzy logic
	ssc install strgroup 
	duplicates drop cname_hold_clean_code, force
	* Only 2 observations deleted
	* See how many lose if remove any who only differ by 1 letter
	bys industry: strgroup cname_hold_clean_code, gen(fuzzy_group) threshold(1) normalize(none)
	sort industry firm_id_holdings cname_hold_clean_code
	bys fuzzy_group: egen cnt_13 = count(firm_id_holdings)
	drop if cnt_13>=2
	bys firm_id_holdings: egen cnt_13_pt2 = count(firm_id_holdings)
	keep if cnt_13_pt2>=2
	disp _N	
	* 2,579
	
	* See how many lose if remove any who only differ by 2 letters
	bys industry: strgroup cname_hold_clean_code, gen(fuzzy_group2) threshold(2) normalize(none)
	sort industry firm_id_holdings cname_hold_clean_code
	bys fuzzy_group2: egen cnt_14 = count(firm_id_holdings)
	drop if cnt_14>=2
	bys firm_id_holdings: egen cnt_14_pt2 = count(firm_id_holdings)
	keep if cnt_14_pt2>=2
	disp _N
	* 2,168
	sort industry firm_id_holdings cname_hold_clean_code
	save HoldingsData_Final_wIndustry_CleanedMethod1, replace
	
	tab industry
	
	
	* See how many lose if remove any who only differ by 3 letters
	/*
	bys industry: strgroup cname_hold_clean_code, gen(fuzzy_group3) threshold(3) normalize(none)
	sort industry firm_id_holdings cname_hold_clean_code
	bys fuzzy_group3: egen cnt_15 = count(firm_id_holdings)
	drop if cnt_15>=2
	bys firm_id_holdings: egen cnt_15_pt2 = count(firm_id_holdings)
	keep if cnt_15_pt2>=2
	disp _N
	* 1,658
	sort industry firm_id_holdings cname_hold_clean_code	
	*/
	
* End 5/4/2015

* Start 5/27/2015

	* Load company name cleaned holdings data
	use HoldingsData_Final_wIndustry, clear
		* Look only at unique investor_name_hold
		duplicates drop firm_id_holdings, force
		keep firm_id_holdings cname_hold_orig cname_hold_clean book_year_hold industry 
		format firm_id_holdings %16.0f
		
	* Redo some analysis of holdings composition...
	use HoldingsData_Final_wIndustry, clear
		* Compute geographic concentration of investors in each asset
		sum par_value_clean_hold, d
		bys book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold: egen state_par_value_clean_hold = sum(par_value_clean_hold)
		duplicates drop book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold, force
		
		bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_par_value_clean_hold = sum(state_par_value_clean_hold)
		gen investor_share = par_value_clean_hold/sum_par_value_clean_hold	
		gen investor_share_2 = investor_share^2
		bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_investor_share_2 = sum(investor_share_2)
		*
		sum sum_investor_share_2 if industry=="Government", d
		sum sum_investor_share_2 if industry=="Industrial and Misc", d
		sum sum_investor_share_2 if industry=="Steam Railroad", d
		sum sum_investor_share_2 if industry=="Street Railway", d
		*
		bys book_year_hold industry: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
		bys book_year_hold industry: egen median_sum_investor_share_2 = median(sum_investor_share_2)
		tabdisp book_year_hold industry, cell(mean_sum_investor_share_2)		
		tabdisp book_year_hold industry, cell(median_sum_investor_share_2)	
		*
		* Now compute buckets based on year, industry, and 1908 concentration
		gen concentration_1908_tmp = sum_investor_share_2 if book_year_hold==1908
		bys firm_id_holdings issue_id_holdings: egen concentration_1908 = max(concentration_1908_tmp)
		gen concentration_1908_bkt = 1 if concentration_1908>=0 & concentration_1908<=0.10
		replace concentration_1908_bkt = 2 if concentration_1908>=0.10 & concentration_1908<=0.25
		replace concentration_1908_bkt = 3 if concentration_1908>=0.25 & concentration_1908<=0.5
		replace concentration_1908_bkt = 4 if concentration_1908>=0.5 & concentration_1908<=0.75
		replace concentration_1908_bkt = 5 if concentration_1908>=0.75
		bys book_year_hold industry concentration_1908_bkt: egen mean_sum_investor_share_3 = mean(sum_investor_share_2)
		bys book_year_hold industry concentration_1908_bkt: egen median_sum_investor_share_3 = median(sum_investor_share_2)
		tabdisp book_year_hold industry concentration_1908_bkt, cell(mean_sum_investor_share_3)		
		tabdisp book_year_hold industry concentration_1908_bkt, cell(median_sum_investor_share_3)		
		*
		format sum_par_value_clean_hold %16.0f
		sum sum_par_value_clean_hold if industry=="Government", d
		sum sum_par_value_clean_hold if industry=="Industrial and Misc", d
		sum sum_par_value_clean_hold if industry=="Steam Railroad", d
		sum sum_par_value_clean_hold if industry=="Street Railway", d
		*
		gen issue_size_1908_tmp = sum_par_value_clean_hold if book_year_hold==1908
		bys firm_id_holdings issue_id_holdings: egen issue_size_1908 = max(issue_size_1908_tmp)
		gen issue_size_1908_bkt = 1 if issue_size_1908>0 & issue_size_1908<=10000
		replace issue_size_1908_bkt = 2 if issue_size_1908>10000 & issue_size_1908<=100000
		replace issue_size_1908_bkt = 3 if issue_size_1908>100000 & issue_size_1908<=500000
		replace issue_size_1908_bkt = 4 if issue_size_1908>500000 & issue_size_1908<=1000000
		replace issue_size_1908_bkt = 5 if issue_size_1908>=1000000
		bys book_year_hold industry issue_size_1908_bkt: egen mean_sum_investor_share_4 = mean(sum_investor_share_2)
		bys book_year_hold industry issue_size_1908_bkt: egen median_sum_investor_share_4 = median(sum_investor_share_2)
		tabdisp book_year_hold industry issue_size_1908_bkt, cell(mean_sum_investor_share_4)		
		tabdisp book_year_hold industry issue_size_1908_bkt, cell(median_sum_investor_share_4)		
		*
		* Run regression
		*
		preserve
			duplicates drop book_year_hold firm_id_holdings issue_id_holdings, force
			drop if industry=="Bank and Trust"
			drop if book_year_hold==1913		
			egen uniq_id = group(firm_id_holdings issue_id_holdings)
			gen sum_investor_share_2_1908 = sum_investor_share_2 if book_year_hold==1908
			gen sum_investor_share_2_1911 = sum_investor_share_2 if book_year_hold==1911
			bys uniq_id: egen concentraiton_1908 = mean(sum_investor_share_2_1908)
			bys uniq_id: egen concentraiton_1911 = mean(sum_investor_share_2_1911)
			gen chg_concentration_1911_1908 = concentraiton_1911 - concentraiton_1908 if concentraiton_1908!=. & concentraiton_1911!=.
			keep if book_year_hold==1911
			gen SteamRR = 0
			replace SteamRR = 1 if industry=="Steam Railroad"
			xi: reg chg_concentration_1911_1908 i.concentration_1908_bkt i.issue_size_1908_bkt SteamRR
		restore
		*
		use HoldingsData_Final_wIndustry, clear
		* Compute geographic concentration of investors in each asset
		sum par_value_clean_hold, d
		bys book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold: egen state_par_value_clean_hold = sum(par_value_clean_hold)
		duplicates drop book_year_hold firm_id_holdings issue_id_holdings investor_region1_final_hold, force
		
		bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_par_value_clean_hold = sum(state_par_value_clean_hold)
		gen investor_share = par_value_clean_hold/sum_par_value_clean_hold	
		gen investor_share_2 = investor_share^2
		bys book_year_hold firm_id_holdings issue_id_holdings: egen sum_investor_share_2 = sum(investor_share_2)
		*
		bys book_year_hold industry: egen mean_sum_investor_share_2 = mean(sum_investor_share_2)
		bys book_year_hold industry: egen median_sum_investor_share_2 = median(sum_investor_share_2)
		tabdisp book_year_hold industry, cell(mean_sum_investor_share_2)		
		tabdisp book_year_hold industry, cell(median_sum_investor_share_2)
			* Now compute buckets based on year, industry, and 1911 concentration
			gen concentration_1911_tmp = sum_investor_share_2 if book_year_hold==1911
			bys firm_id_holdings issue_id_holdings: egen concentration_1911 = max(concentration_1911_tmp)
			gen concentration_1911_bkt = 1 if concentration_1911>=0 & concentration_1911<=0.10
			replace concentration_1911_bkt = 2 if concentration_1911>=0.10 & concentration_1911<=0.25
			replace concentration_1911_bkt = 3 if concentration_1911>=0.25 & concentration_1911<=0.5
			replace concentration_1911_bkt = 4 if concentration_1911>=0.5 & concentration_1911<=0.75
			replace concentration_1911_bkt = 5 if concentration_1911>=0.75
			bys book_year_hold industry concentration_1911_bkt: egen mean_sum_investor_share_3 = mean(sum_investor_share_2)
			bys book_year_hold industry concentration_1911_bkt: egen median_sum_investor_share_3 = median(sum_investor_share_2)
			tabdisp book_year_hold industry concentration_1911_bkt, cell(mean_sum_investor_share_3)		
			tabdisp book_year_hold industry concentration_1911_bkt, cell(median_sum_investor_share_3)		
			*
			gen issue_size_1911_tmp = sum_par_value_clean_hold if book_year_hold==1911
			bys firm_id_holdings issue_id_holdings: egen issue_size_1911 = max(issue_size_1911_tmp)
			gen issue_size_1911_bkt = 1 if issue_size_1911>0 & issue_size_1911<=10000
			replace issue_size_1911_bkt = 2 if issue_size_1911>10000 & issue_size_1911<=100000
			replace issue_size_1911_bkt = 3 if issue_size_1911>100000 & issue_size_1911<=500000
			replace issue_size_1911_bkt = 4 if issue_size_1911>500000 & issue_size_1911<=1000000
			replace issue_size_1911_bkt = 5 if issue_size_1911>=1000000
			bys book_year_hold industry issue_size_1911_bkt: egen mean_sum_investor_share_4 = mean(sum_investor_share_2)
			bys book_year_hold industry issue_size_1911_bkt: egen median_sum_investor_share_4 = median(sum_investor_share_2)
			tabdisp book_year_hold industry issue_size_1911_bkt, cell(mean_sum_investor_share_4)		
			tabdisp book_year_hold industry issue_size_1911_bkt, cell(median_sum_investor_share_4)
			*
			duplicates drop book_year_hold firm_id_holdings issue_id_holdings, force
			drop if industry=="Bank and Trust"
			drop if book_year_hold==1908		
			egen uniq_id = group(firm_id_holdings issue_id_holdings)
			gen sum_investor_share_2_1913 = sum_investor_share_2 if book_year_hold==1913
			gen sum_investor_share_2_1911 = sum_investor_share_2 if book_year_hold==1911
			bys uniq_id: egen concentraiton_1911 = mean(sum_investor_share_2_1911)
			bys uniq_id: egen concentraiton_1913 = mean(sum_investor_share_2_1913)
			gen chg_concentration_1911_1913 = concentraiton_1913 - concentraiton_1911 if concentraiton_1913!=. & concentraiton_1911!=.
			keep if book_year_hold==1913
			gen SteamRR = 0
			replace SteamRR = 1 if industry=="Steam Railroad"
			xi: reg chg_concentration_1911_1913 i.concentration_1911_bkt i.issue_size_1911_bkt SteamRR
		*
* End 5/27/2015



	