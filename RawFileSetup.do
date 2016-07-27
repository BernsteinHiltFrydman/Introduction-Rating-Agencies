*
* Main data files for intro RA analysis
* Last updated 10/31/2014 by Asaf Bernstein
*
*
cd "C:\Dropbox\RatingAgenciesPersonal\RA_Files"
clear

************************************************************************
**** Initial set-up
************************************************************************
* Bring in the raw data files, clean it up slightly, and then
* write it out into weekly data and intra-day data
foreach name in "Run once" {
* This is the final dataset of 119,121 market observations (after cleaning detailed in 6/8/2014 update)
use 20140427_AllCleanMktData_v5, clear
	
	* Fill-in all the previous RA alternatives for identifiers and names
	replace md_issue_id_2 = md_issue_id_2_am if md_issue_id_2_am!=.
	replace md_issue_id_2 = md_issue_id_2_hp if md_issue_id_2_hp!=.
	replace md_issue_id_2 = md_issue_id_hp_v2_20140424 if md_issue_id_hp_v2_20140424!=.
	replace trade_id = trade_id2 if trade_id!=trade_id2 & trade_id2!=""
	replace class_cleaned = class_cleaned_am if class_cleaned_am!=""
	
	* drop unnecessary variables
	drop uniqueid trans matched companyname_harrisonedit issue_id_2 classid cnt_obs3 cnt_obs2 duplicate cnt_obs date_prob md_issue_id_2_am
	drop uncertain class_cleaned_am _merge_v2 md_issue_id_hp_v2_20140424 md_issue_id_2_hp trade_id_final trade_id2 _merge big_dif_vals_same_date big_dif_vals_same_date2 replaced_to_blank_err same_bond_day_id 
	drop price
	
	* improve variable names
	rename md_issue_id_2 issue_id
	rename md_issue_id_2_alt issue_id_alt
	rename md_issue_id_2_am_alt issue_id_alt2

	* label all variables
	label var year "year of transaction"
	label var month "year of transaction"
	label var day "day of transaction"
	label var companyname "company name (raw)"
	label var class "bond description information listed (raw)"
	label var high "weekly high price (only non-intraday data)"
	label var low "weekly low price (only non-intraday data)"
	label var remarks "comments made by data transcriber"
	label var coupon "bond listed coupon in %. All strings (Ex. 4-5) were dropped."
	label var maturityyear "bond listed maturity year. Typically empty"
	label var issuer_id "unique numeric identifier given to each company"
	label var class_cleaned "bond description information listed (standardized)"
	label var issue_id "unique numeric identifier given to each bond issue"
	label var transaction_data_dum "a dummy which equals 1 if data is intra-day data"
	label var issue_id_alt "unique numeric identifier given to each bond issue (1st potential alternative)"
	label var issue_id_alt2 "unique numeric identifier given to each bond issue (2nd potential alternative)"
	label var trade_id "a unique identifier for each transaction type for a given bond. Ex. 'half paid' just means bond was partially paid for but it is still the same bond."
	label var first "weekly open price (only non-intraday data)"
	label var last "weekly close price (only non-intraday data)"
	label var price_trans "traded price (only intraday data)"
	label var sales_trans "amount sold/bought in 000s of shares (only intraday data)"
	label var sales "weekly amount sold/bought in 000s of shares (only non-intraday data)"
	label var trade_num "which trade of the day it was. Ex. 1st trade of the day would be the open and last would be the close. (only intraday data)"

	* Split sample into intra-day and weekly (non-intraday) data
	preserve
		keep if transaction_data_dum==1 
		drop high low first last sales
		save intraday_data, replace
	restore
	preserve
		keep if transaction_data_dum!=1 
		drop trade_num price_trans sales_trans
		save weekly_data, replace
	restore

}
	
	


/****************************** Matt's section for finding false negatives****************************************************
 In this code, I take a set of "vague" class names, each with a list of potential "alternative" class names it could be
 For example, "con" could be "consolidated," "convertible," etc
 Then we apply a series of rules used to find instances of an issuer with both a "vague class" security and an "alternative class" security 
 which are very likely false negatives - i.e. we have assigned them as different securities (i.e. different issue IDs) but are actually the same security
 Then we merge in the set of false negatives into the main dataset, and save a new version accounting for the false negatives
********************************************************************************************************************************/
* Code works but changes sample so holding off on this for now.
foreach name in "Run once" {

	u weekly_data, clear
		replace class_cleaned = trim(class_cleaned)
		
		gen date = mdy(month, day, year)
		format date %td
***************************DEALING WITH FALSE NEGATIVES*********************

*First, identify "vague" classes with potential "alternative" class false negatives 
/*
*NOTE: This list was written by Harrison, but can easily be updated/expanded
For example, if you come up with a new vague class name ("x") 
with a corresponding list of "alternative" class names which could be false negatives ("alt1" and "alt2" for instance) ,
add a line to this list along the lines of 
local alts_x alt1 alt2
*/
local alts_con consolidated convertible   
local alts_g gold general guaranteed     
local alts_c consolidated convertible certificates collateralized company coal coke
local alts_r registered receipts refunding right   
local alts_t trust  terminal
local alts_in income installment interim 
local alts_p prior paid preferred 
local alts_ex extended extension 
local alts_cn consolidated convertible      
local alts_co consolidated convertible collateralized coal company  
local alts_f first full funding     
local alts_l lien land   
local alts_mon montana montgomery 
local alts_mo montana montgomery missouri mobile mortgage  
local alts_n notes north new     

*tempfile master
save master, replace

*Run a loop over all vague classes to identify likely false negatives
*NOTE: Make sure this local vague_cases includes all "vague" classes included in the above list
local vague_cases  con g c r t in p ex cn co f l mon mo n 

*Not all of the vague cases are going to generate flags of likely false negatives
	*Thus, we want to make a list of all the vague cases that DO generate flags, so that when we create
	*temp files for these cases, we can merge them all back in to the master file
	local vague_cases_with_negs
	*(this local will be filled in using the loop - no need to fill it in at all)
foreach case in `vague_cases' {
	
	*Find issuers with at least one security with class equal to the vague term
		gen class_`case' = class_cleaned=="`case'"
		lab var class_`case' "class_cleaned = `case'"
		egen issuer_id_`case' = max(class_`case'), by(issuer_id)
		lab var issuer_id_`case' "issuer_id has at least one security with class_cleaned=`case'"
		
	foreach alt in `alts_`case'' {
		preserve
		di "`case' `alt'"
		*Find issuers with at least one security with class equal to alternative of the vague term
			gen `case'_alt = class_cleaned=="`alt'"
			* COMMENTED THIS OUT OF MATT'S CODE SINCE CAUSED ERRORs
			*lab var "class_cleaned = `alt'"
			egen issuer_id_`case'_alt = max(`case'_alt), by(issuer_id)
			lab var issuer_id_`case'_alt "issuer_id has at least one security with class_cleaned=`alt'"
		*Only keep issuers with both a "vague" and "alternative to vague" security
			keep if issuer_id_`case'==1 & issuer_id_`case'_alt==1 & (class_`case'==1 | `case'_alt==1)
			count
			if `r(N)'!= 0 {
			*Only keep issuers where both the vague and alternative security have same coupon
				egen min_coupon = min(coupon), by(issuer_id)
				egen max_coupon = max(coupon), by(issuer_id)
				keep if min_coupon == max_coupon
				drop min_coupon max_coupon
			}
			*Only keep cases with NO duplicates dates (as duplicated dates are automatically different securities
			count
			if `r(N)'!= 0 {
				duplicates report issuer_id date
				duplicates tag issuer_id date, gen(dup_zz)
				egen issuer_dup = max(dup_zz), by(issuer_id)
				keep if issuer_dup==0
				drop dup_zz issuer_dup
			}
			*Those that remain are likely false negatives - flag them
			count
			if `r(N)'!= 0 {
				gen `case'_`alt'_flag = 1
				lab var `case'_`alt'_flag "at least 1 `alt' at same issuer"
				*Indicate what the md_issue_id_2 is of the alternative class potential false negative security
					gen z = issue_id if `case'_alt==1
					egen `case'_`alt'_md_issue_id_2 = max(z), by(issuer_id)
					drop z
					lab var `case'_`alt'_md_issue_id_2 "issue_id of potential FN with 
				*Create a count of how many observations of the alternatives there are for an issuer
				egen `case'_`alt'_num = sum(`case'_alt), by(issuer_id)
					lab var `case'_`alt'_num "# obs of `alt' security at same issuer"
				*Create a "distance metric" between the date range of the vague case and the range for the alternative
				*Calculate the distance between the median date of the "alternative" and the min, median, and max date of the "vague case" and get the minimum of these distances
					*Get min, 25th pctile, median, 75th pctile, and max data for the vague case
						egen m_date_`case' = min(date) if class_`case'==1, by(issuer_id)
						egen min_date_`case' = max(m_date_`case'), by(issuer_id)
						drop m_date_`case'

						egen p_date_`case' = pctile(date) if class_`case'==1, by(issuer_id) p(25)
						egen p25_date_`case' = max(p_date_`case'), by(issuer_id)
						drop p_date_`case'

						egen med_date_`case' = median(date) if class_`case'==1, by(issuer_id)
						egen median_date_`case' = max(med_date_`case'), by(issuer_id)
						drop med_date_`case'

						egen p_date_`case' = pctile(date) if class_`case'==1, by(issuer_id) p(75)
						egen p75_date_`case' = max(p_date_`case'), by(issuer_id)
						drop p_date_`case'

						egen m_date_`case' = max(date) if class_`case'==1, by(issuer_id)
						egen max_date_`case' = max(m_date_`case'), by(issuer_id)
						drop m_date_`case'
					
					*Median for the "alt" case
						egen m_date_`case'_`alt' = min(date) if `case'_alt==1, by(issuer_id)
						egen min_date_`case'_`alt' = max(m_date_`case'_`alt'), by(issuer_id)
						drop m_date_`case'_`alt'
						
						egen p_date_`case'_`alt' = pctile(date) if `case'_alt==1, by(issuer_id) p(25)
						egen p25_date_`case'_`alt' = max(p_date_`case'_`alt'), by(issuer_id)
						drop p_date_`case'_`alt'

						egen med_date_`case'_`alt' = median(date) if `case'_alt==1, by(issuer_id)
						egen median_date_`case'_`alt' = max(med_date_`case'_`alt'), by(issuer_id)
						drop med_date_`case'_`alt'

						egen p_date_`case'_`alt' = pctile(date) if `case'_alt==1, by(issuer_id) p(75)
						egen p75_date_`case'_`alt' = max(p_date_`case'_`alt'), by(issuer_id)
						drop p_date_`case'_`alt'

						egen m_date_`case'_`alt' = max(date) if `case'_alt==1, by(issuer_id)
						egen max_date_`case'_`alt' = max(m_date_`case'_`alt'), by(issuer_id)
						drop m_date_`case'_`alt'
					
					*Calculate distance for all (5x5=) 25 combos, and then take the minimum of these 
						foreach pctile of newlist min p25 median p75 max {
							gen `case'_`alt'_date_`pctile'_min = abs(`pctile'_date_`case'_`alt'-min_date_`case')
							gen `case'_`alt'_date_`pctile'_p25 = abs(`pctile'_date_`case'_`alt'-p25_date_`case')
							gen `case'_`alt'_date_`pctile'_med = abs(`pctile'_date_`case'_`alt'-median_date_`case')
							gen `case'_`alt'_date_`pctile'_p75 = abs(`pctile'_date_`case'_`alt'-p75_date_`case')
							gen `case'_`alt'_date_`pctile'_max = abs(`pctile'_date_`case'_`alt'-max_date_`case')
						}
						egen `case'_`alt'_date_min_dist = rowmin(`case'_`alt'_date*)
						lab var `case'_`alt'_date_min_dist "Minimum distance btwn min, p25, p50, p75, max date of `alt' and `case'"

				keep issuer_id issue_id class_cleaned class_`case' `case'_`alt'_flag `case'_`alt'_num `case'_`alt'_date_min_dist `case'_`alt'_md_issue_id_2 
				duplicates drop

			*The observations that remain are securities (an issuer_id-issue ID combo) that are false negatives
			*Only keep observations of the vague class ecurities
			keep if class_`case'==1
			*Create a temp file with all securities with this vague class name that have false negatives of the alternative in this loop
			tempfile `case'_`alt'
			save ``case'_`alt'', replace
			*update the local with the set of vague classes with false negs to include this case
			local vague_cases_with_negs `vague_cases_with_negs' `case'_`alt'
		} // r(N)!=0
		restore	
	} // alt
	
	drop class_`case' issuer_id_`case'

} // vague_cases

di "`vague_cases_with_negs'"
*This is the set of all vague class names with at least one false negative
local first_vague_case: word 1 of `vague_cases_with_negs'

*Combine all the tempfiles with the cases with false negatives for each vague term
foreach false_neg in `vague_cases_with_negs' {
	if "`false_neg'"=="`first_vague_case'" {
		u ``first_vague_case'', clear
	}
	else {
		merge m:1  issuer_id issue_id using ``false_neg'', nogen
	}
}

*Assign new issue IDs and class names to those vague cases we consider false negatives
*In the event there are more than one potential false negatives (i.e. same issuer has con-convertible AND con-consolidated),
*We will use a deceision rule that automaticlaly picks the most likely false negative
gen issue_id_2_fn_matt = .
	lab var issue_id_2_fn_matt "md_issue_id_2 but adjusted for false negatives"
gen class_cleaned_fn_matt  = ""
	lab var class_cleaned_fn_matt  "class_cleaned but adjusted for false negatives"

foreach case in `vague_cases' {
	*Not all vague cases have false negatives, so the following line ensures we only execute the code that follows for the vague cases with false negatives
	capture confirm variable class_`case', exact
	if _rc==0 {
		di "`case'"
		*This command spits out a variable with the number of alternative potential false negatives for a given "vague class" security
		egen z = rowtotal(`case'_*_flag)
		*This gives, among all the potential false negatives for a vague security, the minimum "distance metric" and the maximum "# observations" among them
		*Both of these criteria can be used in the decision rule to assign which alternative is the most likely false negative
		egen min_date = rowmin(`case'_*date_min_dist)
		egen max_obs = rowmax(`case'_*_num)
	
		*This loops through all the possible "alternative" class names we've identified for a given vague case, and assigns the correct issue and class ID based on a decision rule
		*NOTE: This decision rule can and should be changed to be more nuanced
			*Right now, the decision rule picks the alternative with the smallest "distance metric" 
			*but should also include "# observations" as a criteria, or include other nuances
		foreach v of varlist `case'_*_flag {
			*create a local that captures the alternative class of the potential false negative 
				local alt`v' `v'
				local alt`v' = subinstr("`alt`v''", "_flag","",.)
				local alt`v' = subinstr("`alt`v''", "`case'_","",.)
			*Replace the "adjusted" issue_id and class cleaned with that of the false negative that meets the decision rule
			*Right now, I'm making the decision rule picking the one that is closest in date range, but later might want a different decision rule
			replace issue_id_2_fn_matt = `case'_`alt`v''_md_issue_id_2 if `case'_`alt`v''_date_min_dist == min_date & class_`case'!=.
			replace class_cleaned_fn_matt  = "`alt`v''" if `case'_`alt`v''_date_min_dist == min_date & class_`case'!=.
		}
		drop z min_date max_obs
	}
}	// vague_cases

save potential_false_negative_flags_matt.dta, replace

******************
*Now that we've identified false negatives, merge them into the main data file, and replace the issue IDs and class names
******************
	*First, save a tempfile with only the necessary information to be merged into the main dataset
		u potential_false_negative_flags_matt.dta, clear
		keep issuer_id issue_id class_cleaned issue_id_2_fn_matt class_cleaned_fn_matt 
		replace class_cleaned = trim(class_cleaned)
		tempfile false_negs_file
		save `false_negs_file', replace

	*Bring in the main dataset
		u weekly_data.dta, clear
		replace class_cleaned = trim(class_cleaned)
	*Merge in the set of false negatives 
		merge m:m issuer_id issue_id class_cleaned using `false_negs_file', keep(master match) gen(merge_fn)
	*For those that do NOT merge in (which are the non-false negatives), replace the updated issue ID and class_cleaned to be the original ones
		replace issue_id_2_fn_matt = issue_id if merge_fn!=3
		replace class_cleaned_fn_matt = class_cleaned if merge_fn!=3

		gen false_negative_flag = merge_fn==3
		lab var false_negative_flag "identified and corrected through automated procedure as false negative"
		drop merge_fn

*		browse issuer_id md_issue_id_2 issue_id_2_fn_matt class_cleaned class_cleaned_fn_matt if false_negative_flag==1

	
*Save a new version of the data 
	save weekly_data_MattCleaned.dta, replace


}


************************************************************************
**** JUST WEEKLY DATA
************************************************************************
* First look at weekly data by itself which lets us look at
* bond yields, volumes, price impact, volatility (high-low and time series)
* serial correlations
foreach name in "Run once" {
use weekly_data_MattCleaned, clear	
*use weekly_data, clear
	* Fixing closing prices with decimal in wrong place
	replace last = 108.25 if last==10825
	replace last = 90.75 if last==9075
	replace last = 96.875 if last==968.75
	replace last = 87.475 if last==874.75
	
	gen date = mdy(month,day,year)
	format date %td
	egen unique_id = group(issuer_id issue_id trade_id)
	
	* Perpetuity yield
	* 61,787 observations
	gen perp_yield = coupon/last	
	sum perp_yield, d
	
	* sales (000s shares) 
	* 63,784 observations
	sum sales, d
	
	* sales ($ 000s) 
	* 62,329 observations
	gen salesXlast = sales * last
	sum salesXlast, d
	
	* price impact
	sort unique_id date
	gen ret = last/last[_n-1] - 1 if unique_id==unique_id[_n-1]
	gen abs_ret = abs(ret)
	gen price_impact = abs_ret/salesXlast
	sum ret, d
	sum abs_ret, d
	sum price_impact, d
	
	* 46,380 total high price observations
	sum high, d
	
	preserve
		duplicates drop year month day, force
		* 260 unqiue dates from 1905-1915
		* Means on average 237 per date
		disp _N
	restore
	preserve
		bys issuer_id issue_id trade_id: egen cnt_perp_yield = count(perp_yield)
		duplicates drop issuer_id issue_id trade_id, force
		* 2,112 unique bonds
		* obs
		* median: 4
		* mean: 29.25
		* stdev: 53
		* 25th: 1
		* 75th: 29
		sum cnt_perp_yield, d
		* 75 have 0 obs
		sum cnt_perp_yield if cnt_perp_yield==0
		* 562 have 1 ob
		sum cnt_perp_yield if cnt_perp_yield==1
		* 426 have 2-4 obs
		sum cnt_perp_yield if cnt_perp_yield>=2 & cnt_perp_yield<=4
		* 222 have 5-9 obs
		sum cnt_perp_yield if cnt_perp_yield>=5 & cnt_perp_yield<=9
		* 204 have 10-19 obs
		sum cnt_perp_yield if cnt_perp_yield>=10 & cnt_perp_yield<=19
		* 623 have at least 20 obs
		sum cnt_perp_yield if cnt_perp_yield>=20
	restore
	
	* Winsor perp_yield on high only since low doesn't appear to have issues
	local prod_vars `" perp_yield ret abs_ret price_impact"'
	foreach x of local prod_vars {		
		sum `x', d
		winsor `x', generate(`x'_tmp) p(0.01) highonly
		drop `x'
		rename `x'_tmp `x'
		sum `x', d
	}	
	
	save weekly_data_cleaned_v1, replace
}



************************************************************************
**** JUST Intra-day DATA
************************************************************************	
* Look at intra-day data by itself which lets us look at
* bond yields, volumes, price impact, volatility (high-low and time series)
* bid-ask, serial correlations
foreach name in "Run once" {
use intraday_data, clear		
	
	sum price_trans, d
	* Fixing prices with decimal in wrong place
	replace price_trans = 100.375 if price_trans==1003.75
	
	gen date = mdy(month,day,year)
	format date %td
	egen unique_id = group(issuer_id issue_id trade_id)
	
	* Perpetuity yield
	* 51,431 observations
	gen perp_yield = coupon/price_trans	
	sum perp_yield, d
	
	* sales (000s shares) 
	* 55,182 observations
	sum sales_trans, d
	
	* sales ($ 000s) 
	* 54,184 observations
	gen salesXprice_trans = sales_trans * price_trans
	sum salesXprice_trans, d	

	* price impact
	sort unique_id date
	gen ret = price_trans/price_trans[_n-1] - 1 if unique_id==unique_id[_n-1] & day==day[_n-1]
	gen abs_ret = abs(ret)
	gen price_impact = abs_ret/salesXprice_trans
	sum ret, d
	sum abs_ret, d
	sum price_impact, d

	preserve
		duplicates drop date, force
		* 190 unqiue dates from 1908-1915
		* Means on average 271 per date
		disp _N
		sum date, d
	restore
	preserve
		bys unique_id: egen cnt_perp_yield = count(perp_yield)
		duplicates drop unique_id, force
		* 320 unique bonds
		* obs
		* median: 1
		* mean: 161
		* stdev: 2,618
		* 25th: 0
		* 75th: 9
		sum cnt_perp_yield, d
		* 91 have 0 obs
		sum cnt_perp_yield if cnt_perp_yield==0
		* 79 have 1 ob
		sum cnt_perp_yield if cnt_perp_yield==1
		* 44 have 2-4 obs
		sum cnt_perp_yield if cnt_perp_yield>=2 & cnt_perp_yield<=4
		* 28 have 5-9 obs
		sum cnt_perp_yield if cnt_perp_yield>=5 & cnt_perp_yield<=9
		* 31 have 10-19 obs
		sum cnt_perp_yield if cnt_perp_yield>=10 & cnt_perp_yield<=19
		* 47 have at least 20 obs
		sum cnt_perp_yield if cnt_perp_yield>=20
	restore

	* Look at number of dates with at least one observation
	preserve
		duplicates drop unique_id date, force
		bys unique_id: egen cnt_perp_yield = count(perp_yield)
		duplicates drop unique_id, force
		* 320 unique bonds
		* obs
		* median: 1
		* mean: 6.5
		* stdev: 18
		* 25th: 0
		* 75th: 4
		sum cnt_perp_yield, d
		* 91 have 0 obs
		sum cnt_perp_yield if cnt_perp_yield==0
		* 102 have 1 ob
		sum cnt_perp_yield if cnt_perp_yield==1
		* 48 have 2-4 obs
		sum cnt_perp_yield if cnt_perp_yield>=2 & cnt_perp_yield<=4
		* 34 have 5-9 obs
		sum cnt_perp_yield if cnt_perp_yield>=5 & cnt_perp_yield<=9
		* 25 have 10-19 obs
		sum cnt_perp_yield if cnt_perp_yield>=10 & cnt_perp_yield<=19
		* 20 have at least 20 obs
		sum cnt_perp_yield if cnt_perp_yield>=20
	restore	
	
	* Winsor perp_yield on high only since low doesn't appear to have issues
	local prod_vars `" perp_yield ret abs_ret price_impact"'
	foreach x of local prod_vars {		
		sum `x', d
		winsor `x', generate(`x'_tmp) p(0.01) highonly
		drop `x'
		rename `x'_tmp `x'
		sum `x', d
	}	

	save intraday_data_cleaned_v1, replace	
}
	


************************************************************************
**** JUST Bond-Level Ratings and Characteristics
************************************************************************	
* First assign numeric values to ratings
foreach name in "Run once" {
insheet using "C:\Dropbox\RatingAgenciesPersonal\RA_Files\20140427\201404171636_BondRatingRecordInformation_cmb.csv", comma clear
	replace issue_id_2 = issue_id_2_cmb if issue_id_2_cmb!=.
	rename issue_id_2 md_issue_id_2
			
	rename bond_record_nun_1909 bond_record_num_1909
	rename bond_record_nun_1914 bond_record_num_1914

	rename rating_bc rating_stock_1909
	rename outstanding_bc out_stock_1909

	rename security_1909_bc rating_risk_bond_1909
	rename salability_1909_bc rating_sale_bond_1909	
	rename bond_rating_1909 rating_bond_1909
	rename oustanding_1909_bc out_bond_1909	
	
	rename security_1914_bc rating_risk_bond_1914
	rename salability_1914_bc rating_sale_bond_1914
	rename net_rating_1914_bc rating_bond_1914
	rename outstanding_1914 out_bond_1914
	
	rename equityrating1914_bc rating_risk_stock_1914
	rename salabilityrating1914_bc rating_sale_stock_1914
	rename v31_bc rating_stock_1914
	rename amountoutstanding1914_bc out_stock_1914
	
	* Convert ratings to numeric values
	local prod_vars `"rating_stock_1909 rating_bond_1909 rating_bond_1914 rating_stock_1914"'
	foreach x of local prod_vars {		
		
		replace `x' = lower(`x')
		
		* overall ratings
		gen `x'_tmp = 1 if `x'=="aaa"
		replace `x'_tmp = 2 if `x' == "aa"
		replace `x'_tmp = 3 if `x' == "a"
		replace `x'_tmp = 4 if `x' == "baa"
		replace `x'_tmp = 5 if `x' == "ba"
		replace `x'_tmp = 6 if `x' == "b"
		replace `x'_tmp = 7 if `x' == "caa"
		replace `x'_tmp = 8 if `x' == "ca"
		replace `x'_tmp = 9 if `x' == "c"
		replace `x'_tmp = 10 if `x' == "daa"
		replace `x'_tmp = 11 if `x' == "da"
		replace `x'_tmp = 12 if `x' == "d"
		replace `x'_tmp = 13 if `x' == "e"
		replace `x'_tmp = 14 if `x' == "f"
		drop `x'
		rename `x'_tmp `x'
	}
	
	local prod_vars `"rating_risk_bond_1909 rating_sale_bond_1909 rating_risk_bond_1914 rating_sale_bond_1914 rating_risk_stock_1914 rating_sale_stock_1914"'
	foreach x of local prod_vars {		
		
		replace `x' = lower(`x')
		
		* overall ratings
		gen `x'_tmp = 12
		replace `x'_tmp = 1 if `x'=="very high"
		replace `x'_tmp = 2 if `x' == "high"
		replace `x'_tmp = 3 if `x' == "strong"
		replace `x'_tmp = 4 if `x' == "large"
		replace `x'_tmp = 5 if `x' == "good"
		replace `x'_tmp = 6 if `x' == "moderate"
		replace `x'_tmp = 6 if `x' == "mod"
		replace `x'_tmp = 6 if `x' == "mod."
		replace `x'_tmp = 7 if `x' == "fair"
		replace `x'_tmp = 7 if `x' == "faair"
		replace `x'_tmp = 8 if `x' == "light"
		replace `x'_tmp = 9 if `x' == "small"
		replace `x'_tmp = 10 if `x' == "poor"
		replace `x'_tmp = 11 if `x' == "doubtful"
		replace `x'_tmp = . if `x' == ""
		drop `x'
		rename `x'_tmp `x'
	}
	
	/*
	* Compute a measure of ratings at a firm level
	local prod_vars `"rating_stock_1909 rating_bond_1909 rating_bond_1914 rating_stock_1914 rating_risk_bond_1909 rating_sale_bond_1909 rating_risk_bond_1914 rating_sale_bond_1914 rating_risk_stock_1914 rating_sale_stock_1914"'
	foreach x of local prod_vars {		
		bys issuer_id: egen `x'_max = max(`x')
		bys issuer_id: egen `x'_min = min(`x')
		bys issuer_id: egen `x'_mean = mean(`x')
		bys issuer_id: egen `x'_median = median(`x')
		bys issuer_id: egen `x'_mode = mode(`x')
	}	
	
	local prod_vars `"out_bond_1909 out_bond_1914 out_stock_1914"'
	foreach x of local prod_vars {		
		gen `x'_tmp = real(`x')
		drop `x'
		rename `x'_tmp `x'
	}
	*/
	
	rename md_issue_id_2 issue_id
	
	disp _N
	drop if rating_stock_1909!=.
	drop if rating_stock_1914!=.
	disp _N
	drop if rating_bond_1909==. & rating_bond_1914==.
	disp _N
	sum issuer_id
	sum issue_id
	* 645 out of 701 have issue ids... need to fix the last 56...
	
	* Shorten these names so can add things to the end
	rename  bond_moodys_company_name_1909  bond_moodys_name_1909
	rename  bond_moodys_parent_company_name_  bond_moodys_parent_name
	rename  moodys_company_name_1914_bc moodys_name_1914
	
	* Determine whichever company name from any of the years is the longest and return that and delete the others
	gen co_name1 = length(bond_moodys_name_1909)
	gen co_name2 = length(companyname_bc)
	gen co_name3 = length(poorscompanyname_bc)
	gen co_name4 = length(moodysname_bc)
	gen co_name5 = length(moodys_name_1914)
	gen co_name6 = length(name_bc)
	gen co_name7 = length(company_name_1909)
	gen company_name = bond_moodys_name_1909 if co_name1>=co_name2 & co_name1>=co_name3 & co_name1>=co_name4 & co_name1>=co_name5 & co_name1>=co_name6 & co_name1>=co_name7
	replace company_name = companyname_bc if co_name2>=co_name1 & co_name2>=co_name3 & co_name2>=co_name4 & co_name2>=co_name5 & co_name2>=co_name6 & co_name2>=co_name7
	replace company_name = poorscompanyname_bc if co_name3>=co_name1 & co_name3>=co_name2 & co_name3>=co_name4 & co_name3>=co_name5 & co_name3>=co_name6 & co_name3>=co_name7
	replace company_name = moodysname_bc if co_name4>=co_name1 & co_name4>=co_name3 & co_name4>=co_name2 & co_name4>=co_name5 & co_name4>=co_name6 & co_name4>=co_name7
	replace company_name = moodys_name_1914 if co_name5>=co_name1 & co_name5>=co_name3 & co_name5>=co_name4 & co_name5>=co_name2 & co_name5>=co_name6 & co_name5>=co_name7
	replace company_name = name_bc if co_name6>=co_name1 & co_name6>=co_name3 & co_name6>=co_name4 & co_name6>=co_name5 & co_name6>=co_name2 & co_name6>=co_name7
	replace company_name = company_name_1909 if co_name7>=co_name1 & co_name7>=co_name2 & co_name7>=co_name3 & co_name7>=co_name4 & co_name7>=co_name5 & co_name7>=co_name6
	drop co_name* bond_moodys_name_1909 companyname_bc poorscompanyname_bc moodysname_bc moodys_name_1914 name_bc company_name_1909
		
	order company_name, first
	drop issue_id_2_cmb 
	
	* Fix a mistake for "New York & Putnam Railroad"
	* since full name is "First Consolidated Mortgage 4s"
	replace coupon_1909=4 if issuer_id==368 & issue_id==1
	replace coupon_1909=4 if issuer_id==33 & issue_id==1
	* Consolidated coupons to one coupon for all years
	gen coupon = coupon_1909
	replace coupon = coupon_bc if coupon==. & coupon_bc!=.
	drop coupon_1909 coupon_bc
	order coupon, before(class_1909)
	
	* fix name
	rename fullname_bc fullname
	
	* Try to reduce maturity years
		replace maturity_bc = maturityyear_1909 if maturity_bc==.
		rename maturity_bc maturity_year
		drop maturityyear_1909
		replace bond_moodys_maturity_1909 = "1914" if bond_moodys_maturity_1909=="1910-1914"
		replace bond_moodys_maturity_1909 = "1935" if bond_moodys_maturity_1909=="11935"
		destring bond_moodys_maturity_1909, replace
		*gen dum=1 if bond_moodys_maturity_1909!=maturity_year & bond_moodys_maturity_1909!=. & maturity_year!=.
		*sum dum, d
		replace maturity_year=bond_moodys_maturity_1909 if maturity_year==.
		drop bond_moodys_maturity_1909
		*gen dum=1 if maturityyear_1909_bc!=maturity_year & maturityyear_1909_bc!=. & maturity_year!=.
		*sum dum, d
		replace maturity_year=maturityyear_1909_bc if maturity_year==.
		drop maturityyear_1909_bc	
		* Only 516 maturity years
		sum maturity_year
	
	
	save Bond_Ratings_v1, replace
	
	
}	

	
************************************************************************
**** JUST Firm-Level Ratings
************************************************************************
* These are stock/bond characteristics and ratings for 1909 and 1914
* for stocks and 1914 for bonds
foreach name in "Run once" {
*************************
insheet using "C:\Dropbox\RatingAgenciesPersonal\RA_Files\20140427\201404171636_BondRatingRecordInformation_cmb.csv", comma clear
	replace issue_id_2 = issue_id_2_cmb if issue_id_2_cmb!=.
	rename issue_id_2 md_issue_id_2
			
	rename bond_record_nun_1909 bond_record_num_1909
	rename bond_record_nun_1914 bond_record_num_1914

	rename rating_bc rating_stock_1909
	rename outstanding_bc out_stock_1909

	rename security_1909_bc rating_risk_bond_1909
	rename salability_1909_bc rating_sale_bond_1909	
	rename bond_rating_1909 rating_bond_1909
	rename oustanding_1909_bc out_bond_1909	
	
	rename security_1914_bc rating_risk_bond_1914
	rename salability_1914_bc rating_sale_bond_1914
	rename net_rating_1914_bc rating_bond_1914
	rename outstanding_1914 out_bond_1914
	
	rename equityrating1914_bc rating_risk_stock_1914
	rename salabilityrating1914_bc rating_sale_stock_1914
	rename v31_bc rating_stock_1914
	rename amountoutstanding1914_bc out_stock_1914
	
	* Convert ratings to numeric values
	local prod_vars `"rating_stock_1909 rating_bond_1909 rating_bond_1914 rating_stock_1914"'
	foreach x of local prod_vars {		
		
		replace `x' = lower(`x')
		
		* overall ratings
		gen `x'_tmp = 1 if `x'=="aaa"
		replace `x'_tmp = 2 if `x' == "aa"
		replace `x'_tmp = 3 if `x' == "a"
		replace `x'_tmp = 4 if `x' == "baa"
		replace `x'_tmp = 5 if `x' == "ba"
		replace `x'_tmp = 6 if `x' == "b"
		replace `x'_tmp = 7 if `x' == "caa"
		replace `x'_tmp = 8 if `x' == "ca"
		replace `x'_tmp = 9 if `x' == "c"
		replace `x'_tmp = 10 if `x' == "daa"
		replace `x'_tmp = 11 if `x' == "da"
		replace `x'_tmp = 12 if `x' == "d"
		replace `x'_tmp = 13 if `x' == "e"
		replace `x'_tmp = 14 if `x' == "f"
		drop `x'
		rename `x'_tmp `x'
	}
	
	local prod_vars `"rating_risk_bond_1909 rating_sale_bond_1909 rating_risk_bond_1914 rating_sale_bond_1914 rating_risk_stock_1914 rating_sale_stock_1914"'
	foreach x of local prod_vars {		
		
		replace `x' = lower(`x')
		
		* overall ratings
		gen `x'_tmp = 12
		replace `x'_tmp = 1 if `x'=="very high"
		replace `x'_tmp = 2 if `x' == "high"
		replace `x'_tmp = 3 if `x' == "strong"
		replace `x'_tmp = 4 if `x' == "large"
		replace `x'_tmp = 5 if `x' == "good"
		replace `x'_tmp = 6 if `x' == "moderate"
		replace `x'_tmp = 6 if `x' == "mod"
		replace `x'_tmp = 6 if `x' == "mod."
		replace `x'_tmp = 7 if `x' == "fair"
		replace `x'_tmp = 7 if `x' == "faair"
		replace `x'_tmp = 8 if `x' == "light"
		replace `x'_tmp = 9 if `x' == "small"
		replace `x'_tmp = 10 if `x' == "poor"
		replace `x'_tmp = 11 if `x' == "doubtful"
		replace `x'_tmp = . if `x' == ""
		drop `x'
		rename `x'_tmp `x'
	}
	
	* Compute a measure of ratings at a firm level
	local prod_vars `"rating_stock_1909 rating_bond_1909 rating_bond_1914 rating_stock_1914 rating_risk_bond_1909 rating_sale_bond_1909 rating_risk_bond_1914 rating_sale_bond_1914 rating_risk_stock_1914 rating_sale_stock_1914"'
	foreach x of local prod_vars {		
		bys issuer_id: egen `x'_max = max(`x')
		bys issuer_id: egen `x'_min = min(`x')
		bys issuer_id: egen `x'_mean = mean(`x')
		bys issuer_id: egen `x'_median = median(`x')
		bys issuer_id: egen `x'_mode = mode(`x')
	}	
	
	local prod_vars `"out_bond_1909 out_bond_1914 out_stock_1914"'
	foreach x of local prod_vars {		
		gen `x'_tmp = real(`x')
		drop `x'
		rename `x'_tmp `x'
	}
	
	* Weight ratings by amount outstanding
	bys issuer_id: egen out_stock_1909_sum = sum(out_stock_1909)
	bys issuer_id: egen out_bond_1909_sum = sum(out_bond_1909)
	bys issuer_id: egen out_bond_1914_sum = sum(out_bond_1914)
	bys issuer_id: egen out_stock_1914_sum = sum(out_stock_1914)
	
	local prod_vars `"rating_bond_1909 rating_risk_bond_1909 rating_sale_bond_1909"'
	foreach x of local prod_vars {		
		gen `x'_mnwtgout = rating_bond_1909*out_bond_1909/out_bond_1909_sum
	}	

	local prod_vars `"rating_stock_1909"'
	foreach x of local prod_vars {		
		gen `x'_mnwtgout = rating_stock_1909*out_stock_1909/out_stock_1909_sum
	}		
	
	local prod_vars `"rating_bond_1914 rating_risk_bond_1914 rating_sale_bond_1914"'
	foreach x of local prod_vars {		
		gen `x'_mnwtgout = rating_bond_1914*out_bond_1914/out_bond_1914_sum
	}	
	
	local prod_vars `"rating_stock_1914 rating_risk_stock_1914 rating_sale_stock_1914"'
	foreach x of local prod_vars {		
		gen `x'_mnwtgout = rating_stock_1914*out_stock_1914/out_stock_1914_sum
	}		
	
	drop out_bond_1909 out_bond_1914 out_stock_1914 out_stock_1909
	drop  isbond_bc newfirm_bc newsecurity_bc classaorb_bc coupon_bc maturity_bc moodyspgnum1914_bc bondobs_bc dividendrate1909_bc datespaid1909_bc priority_bc par1909_bc notes_bc stockrecordnumber1914_bc dividendrate1914_bc averageavailableincome1914_bc dividendrequirement1914_bc factorofsafety1914_bc listed_exchanges_1914_bc datespaid1914_bc v34_bc othernotes_bc maturityyear_1909_bc moodys_page_number_1909_bc moodys_year_1909_bc moodys_company_name_1909_bc maturity_year_1909_bc interestpayable_1909_bc lien_type_1909_bc lienmiles_1_1909_bc lienmiles_2_1909_bc lienmiles_3_1909_bc sum_other_lienmiles_1909_bc other_collateral_type_1909_bc other_coll_senior_1909_bc prior_or_joint_1909_bc avgincome_available_1909_bc interest_req_permile_1909_bc factor_safety_1909_bc _price_range_hi_1909_bc _price_range_lo_1909_bc industry_1909_bc poors_year_1909_bc poors_pgnum_1909_bc poors_company_name_1909_bc poors_bond_name_1909_bc poors_bond_num_1909_bc dated_1909_bc issuance_details_1909_bc due_1909_bc paymentdates_1909_bc callable_1909_bc call_price_1909_bc call_notice_period_1909_bc call_exercise_start_date_1909_bc call_exercise_end_date_1909_bc convertible_1909_bc conv_period_start_1909_bc conv_period_end_1909_bc conv_security_type_1909_bc conv_price_1909_bc conv_ratio_1909_bc conv_whose_option_1909_bc sinking_fund_1909_bc sinkingfundschedule_1909_bc  covenant_1909_bc secured_by_collateral_1909_bc collateral_type_1909_bc interest_skipped_1909_bc restruc_dt_det_1909_bc date_of_default_1909_bc listed_exchanges_1909_bc legal_sb_states_1909_bc interestpayable_1914_bc authorized_1914_bc avgincome_available_1914_bc interest_req_perannum_1914_bc factor_safety_1914_bc dated_1914_bc issuance_details_1914_bc due_1914_bc callable_1914_bc call_price_1914_bc call_notice_period_1914_bc call_exercise_start_date_1914_bc call_exercise_end_date_1914_bc convertible_1914_bc conv_period_start_1914_bc conv_period_end_1914_bc conv_security_type_1914_bc conv_price_1914_bc conv_ratio_1914_bc conv_whose_option_1914_bc sinking_fund_1914_bc sinkingfundschedule_1914_bc covenant_1914_bc secured_by_collateral_1914_bc collateral_type_1914_bc interest_skipped_1914_bc restruc_dt_det_1914_bc date_of_default_1914_bc v133_bc legal_sb_states_1914_bc rating_bond_1909 rating_bond_1914 rating_stock_1914 rating_risk_bond_1909 rating_sale_bond_1909 rating_risk_bond_1914 rating_sale_bond_1914 rating_risk_stock_1914 rating_sale_stock_1914
	drop bond_record_num_1909 bond_record_num_1914
	drop  md_issue_id_2 issue_id_2_cmb class_1909 coupon_1909 maturityyear_1909 bond_moodys_manual_missing_1909 bond_missingfrom1909butmaybeinot bond_moodys_manual_year_1909 bond_moodys_page_number_1909 bond_moodys_ambiguous_match_1909 bond_bond_record_number_selected bond_accuracy_best_guess_1909 bond_alt1_bond_record_number_190 bond_alt2_bond_record_number_190 bond_more_than_2_alts_1909 bond_moodys_maturity_1909 bond_moodys_class_misc_1909 bond_rating_alt1_1909 bond_rating_alt2_1909 bond_misc_notes_1909 issue_id_old_bc v35 v37
	
	duplicates drop issuer_id, force

	save Firm_Ratings_v1, replace

	
}	
*
foreach name in "Run once" {
use Firm_Ratings_v1, clear
	
	* Shorten these names so can add things to the end
	rename  bond_moodys_company_name_1909  bond_moodys_name_1909
	rename  bond_moodys_parent_company_name_  bond_moodys_parent_name
	rename  moodys_company_name_1914_bc moodys_name_1914
	
	* rename all variables so that they have a "q"
	* at the end so can distinguish it from the 
	* bond-level rating info. Chose "q" cause short and
	* unlikely to otherwise be at the end.
	foreach x of varlist _all {
		rename `x' `x'q
	}
	rename issuer_idq issuer_id
	
	* Determine whichever company name from any of the years is the longest and return that and delete the others
	gen co_name1 = length(bond_moodys_name_1909q)
	gen co_name2 = length(companyname_bcq)
	gen co_name3 = length(poorscompanyname_bcq)
	gen co_name4 = length(moodysname_bcq)
	gen co_name5 = length(moodys_name_1914q)
	gen co_name6 = length(name_bcq)
	gen co_name7 = length(company_name_1909q)
	gen company_name = bond_moodys_name_1909q if co_name1>=co_name2 & co_name1>=co_name3 & co_name1>=co_name4 & co_name1>=co_name5 & co_name1>=co_name6 & co_name1>=co_name7
	replace company_name = companyname_bcq if co_name2>=co_name1 & co_name2>=co_name3 & co_name2>=co_name4 & co_name2>=co_name5 & co_name2>=co_name6 & co_name2>=co_name7
	replace company_name = poorscompanyname_bcq if co_name3>=co_name1 & co_name3>=co_name2 & co_name3>=co_name4 & co_name3>=co_name5 & co_name3>=co_name6 & co_name3>=co_name7
	replace company_name = moodysname_bcq if co_name4>=co_name1 & co_name4>=co_name3 & co_name4>=co_name2 & co_name4>=co_name5 & co_name4>=co_name6 & co_name4>=co_name7
	replace company_name = moodys_name_1914q if co_name5>=co_name1 & co_name5>=co_name3 & co_name5>=co_name4 & co_name5>=co_name2 & co_name5>=co_name6 & co_name5>=co_name7
	replace company_name = name_bcq if co_name6>=co_name1 & co_name6>=co_name3 & co_name6>=co_name4 & co_name6>=co_name5 & co_name6>=co_name2 & co_name6>=co_name7
	replace company_name = company_name_1909q if co_name7>=co_name1 & co_name7>=co_name2 & co_name7>=co_name3 & co_name7>=co_name4 & co_name7>=co_name5 & co_name7>=co_name6
	drop co_name* bond_moodys_name_1909q companyname_bcq poorscompanyname_bcq moodysname_bcq moodys_name_1914q name_bcq company_name_1909q
	
	* label all variables
	label var issuer_id "unique numeric identifier given to each company"
	label var company_name "Longest firm name from any of the manuals"	
	label var fullname_bcq "Full bond name including company name and coupon"
	label var full_name_1914_bcq "Class info assocaited with the bond (Ex. col. tr. g)"
	rename bond_moodys_parent_nameq parent_name_1909q
	label var parent_name_1909q "Parent company's name as written in 1909 Moody's manual."
	label var parent_issuer_id_1909_bcq "Parent company's 1909 issuer_id"
	label var parent_issuer_id2_1909_bcq "Parent company's 1909 issuer_id (alternative)"
	label var parent_issuer_id_1914_bcq "Parent company's 1914 issuer_id"
	label var parent_issuer_id2_1914_bcq "Parent company's 1914 issuer_id (alternative)"
	label var joint_parent_id_1909_bcq "Joint parent company's 1909 issuer_id"
	label var joint_parent_id_1914_bcq "Joint parent company's 1914 issuer_id"
	label var industry_1914_bcq "Industrial or Utility or blank based on 1914 manuals"
	drop rating_stock_1909q
	label var rating_stock_1909_maxq "Maximum firm-level 1909 stock rating"
	label var rating_stock_1909_minq "Mininum firm-level 1909 stock rating"
	label var rating_stock_1909_meanq "Mean firm-level 1909 stock rating"
	label var rating_stock_1909_medianq "Median firm-level 1909 stock rating"
	label var rating_stock_1909_modeq "Mode firm-level 1909 stock rating"

	label var rating_stock_1914_maxq "Maximum firm-level 1914 stock rating"
	label var rating_stock_1914_minq "Mininum firm-level 1914 stock rating"
	label var rating_stock_1914_meanq "Mean firm-level 1914 stock rating"
	label var rating_stock_1914_medianq "Median firm-level 1914 stock rating"
	label var rating_stock_1914_modeq "Mode firm-level 1914 stock rating"
	
	label var rating_bond_1909_maxq "Maximum firm-level 1909 bond rating"
	label var rating_bond_1909_minq "Mininum firm-level 1909 bond rating"
	label var rating_bond_1909_meanq "Mean firm-level 1909 bond rating"
	label var rating_bond_1909_medianq "Median firm-level 1909 bond rating"
	label var rating_bond_1909_modeq "Mode firm-level 1909 bond rating"	
	
	label var rating_bond_1914_maxq "Maximum firm-level 1914 bond rating"
	label var rating_bond_1914_minq "Mininum firm-level 1914 bond rating"
	label var rating_bond_1914_meanq "Mean firm-level 1914 bond rating"
	label var rating_bond_1914_medianq "Median firm-level 1914 bond rating"
	label var rating_bond_1914_modeq "Mode firm-level 1914 bond rating"		

	label var rating_risk_bond_1909_maxq "Maximum firm-level 1909 bond risk rating"
	label var rating_risk_bond_1909_minq "Mininum firm-level 1909 bond risk rating"
	label var rating_risk_bond_1909_meanq "Mean firm-level 1909 bond risk rating"
	label var rating_risk_bond_1909_medianq "Median firm-level 1909 bond risk rating"
	label var rating_risk_bond_1909_modeq "Mode firm-level 1909 bond risk rating"	
	
	label var rating_risk_bond_1914_maxq "Maximum firm-level 1914 bond risk rating"
	label var rating_risk_bond_1914_minq "Mininum firm-level 1914 bond risk rating"
	label var rating_risk_bond_1914_meanq "Mean firm-level 1914 bond risk rating"
	label var rating_risk_bond_1914_medianq "Median firm-level 1914 bond risk rating"
	label var rating_risk_bond_1914_modeq "Mode firm-level 1914 bond risk rating"		

	label var rating_sale_bond_1909_maxq "Maximum firm-level 1909 bond saleability rating"
	label var rating_sale_bond_1909_minq "Mininum firm-level 1909 bond saleability rating"
	label var rating_sale_bond_1909_meanq "Mean firm-level 1909 bond saleability rating"
	label var rating_sale_bond_1909_medianq "Median firm-level 1909 bond saleability rating"
	label var rating_sale_bond_1909_modeq "Mode firm-level 1909 bond saleability rating"	
	
	label var rating_sale_bond_1914_maxq "Maximum firm-level 1914 bond saleability rating"
	label var rating_sale_bond_1914_minq "Mininum firm-level 1914 bond saleability rating"
	label var rating_sale_bond_1914_meanq "Mean firm-level 1914 bond saleability rating"
	label var rating_sale_bond_1914_medianq "Median firm-level 1914 bond saleability rating"
	label var rating_sale_bond_1914_modeq "Mode firm-level 1914 bond saleability rating"	
	
	label var rating_risk_stock_1914_maxq "Maximum firm-level 1914 stock risk rating"
	label var rating_risk_stock_1914_minq "Mininum firm-level 1914 stock risk rating"
	label var rating_risk_stock_1914_meanq "Mean firm-level 1914 stock risk rating"
	label var rating_risk_stock_1914_medianq "Median firm-level 1914 stock risk rating"
	label var rating_risk_stock_1914_modeq "Mode firm-level 1914 stock risk rating"			
	
	label var rating_sale_stock_1914_maxq "Maximum firm-level 1914 stock saleability rating"
	label var rating_sale_stock_1914_minq "Mininum firm-level 1914 stock saleability rating"
	label var rating_sale_stock_1914_meanq "Mean firm-level 1914 stock saleability rating"
	label var rating_sale_stock_1914_medianq "Median firm-level 1914 stock saleability rating"
	label var rating_sale_stock_1914_modeq "Mode firm-level 1914 stock saleability rating"	
	
	label var out_stock_1909_sumq "$ amount of stock outstanding in 1909"
	label var out_bond_1909_sumq "$ amount of bond outstanding in 1909"
	label var out_stock_1914_sumq "$ amount of stock outstanding in 1914"
	label var out_bond_1914_sumq "$ amount of bond outstanding in 1914"
	
	label var rating_bond_1909_mnwtgoutq "average 1909 bond rating weighted by amount outstanding"
	label var rating_risk_bond_1909_mnwtgoutq "average 1909 bond risk rating weighted by amount outstanding"
	label var rating_sale_bond_1909_mnwtgoutq "average 1909 bond saleability rating weighted by amount outstanding"
	label var rating_stock_1909_mnwtgoutq "average 1909 stock rating weighted by amount outstanding"
	label var rating_bond_1914_mnwtgoutq "average 1914 bond rating weighted by amount outstanding"
	label var rating_risk_bond_1914_mnwtgoutq "average 1914 bond risk rating weighted by amount outstanding"
	label var rating_sale_bond_1914_mnwtgoutq "average 1914 bond saleability rating weighted by amount outstanding"
	label var rating_stock_1914_mnwtgoutq "average 1914 stock rating weighted by amount outstanding"
	label var rating_risk_stock_1914_mnwtgoutq "average 1914 stock risk rating weighted by amount outstanding"
	label var rating_sale_stock_1914_mnwtgoutq "average 1914 stock saleability rating weighted by amount outstanding"

	save Firm_Ratings_v2, replace
}
	
************************************************************************
**** JUST Bond Characteristics
************************************************************************

************************************************************************
**** JUST Accounting Data
************************************************************************
* To be completed by Eric (or me but don't have the data now)

************************************************************************
**** Just NYSE Stock Price Data
************************************************************************	

************************************************************************
**** Just Security Holdings Data from 1908, 1911, and 1913
************************************************************************	
insheet using "C:\Dropbox\RatingAgenciesPersonal\RA_Files\20141031_HoldingsData.csv", comma clear
	save HoldingsData, replace
insheet using "C:\Dropbox\RatingAgenciesPersonal\RA_Files\20141031_HoldingsData_ID_Map.csv", comma clear
	save HoldingsData_ID_Map, replace

use HoldingsData, clear

	keep if book_year_hold==1911
	
	egen new_id = group(cname_hold_clean)
	
	bys firm_id_holdings: egen mx_similarity_1908 = max(similarity_1908)
	
	replace firm_id_holdings = new_id + 100000 if book_year_hold==1911 & (similarity_1908<0.90 | similarity_1908<mx_similarity_1908)
	replace issue_id_holdings = new_id + 100000 if book_year_hold==1911 & (similarity_1908<0.90 | similarity_1908<mx_similarity_1908)
	
	duplicates drop cname_hold_clean, force
	disp _N
	
	duplicates drop issue_id_holdings, force
	disp _N
	* 23,002
	
	duplicates drop firm_id_holdings, force
	disp _N
	* 6,978
	
use HoldingsData, clear
	keep if book_year_hold==1908
	
	disp _N
	* 68,640
	
	duplicates drop issue_id_holdings, force
	
	disp _N
	* 25,620
	
	duplicates drop firm_id_holdings, force
	
	disp _N
	* 11,059	
	
	gen ny = 0
	replace ny = 1 if  investor_region1_final_hold=="ny" | investor_region2_final_hold=="ny"
	
	sum ny, d
	gen ny_val = ny * par_value_clean_hold
	sum par_value_clean_hold, d
	sum ny_val, d
	* ny investors are 17% by #
	bys ny: egen sum_par_value_clean_hold = sum(par_value_clean_hold)
	format sum_par_value_clean_hold %16.0f
	tabdisp ny, cell(sum_par_value_clean_hold)
	* Investors are 47% of invested capital (by par value)
	bys investor_region1_final_hold: egen cnt_investors = count(par_value_clean_hold)
	bys investor_region1_final_hold: egen sum_investors = sum(par_value_clean_hold)
	format sum_investors %16.0f
	tabdisp investor_region1_final_hold, cell(cnt_investors sum_investors)
	
	bys firm_id_holdings: egen cnt_inv = count(par_value_clean_hold)
	bys firm_id_holdings: egen sum_inv = sum(par_value_clean_hold)
	bys firm_id_holdings: egen mn_inv = mean(par_value_clean_hold)
	
	bys firm_id_holdings: egen mn_min_coupon_hold = mean(min_coupon_hold)
	bys firm_id_holdings: egen mn_max_coupon_hold = mean(max_coupon_hold)
	bys firm_id_holdings: egen mn_min_mat_year_hold = mean(min_mat_year_hold)
	bys firm_id_holdings: egen mn_max_mat_year_hold = mean(max_mat_year_hold)	
	
	duplicates drop firm_id_holdings, force
	
	disp _N
	* 11,059
	
	sum mn_min_coupon_hold, d
	sum mn_max_coupon_hold, d
	sum mn_min_mat_year_hold, d
	sum mn_max_mat_year_hold, d
	
	sum cnt_inv, d
	sum sum_inv, d
	sum mn_inv, d
	
	gen perc_inv = mn_inv/sum_inv
	sum perc_inv, d

use HoldingsData, clear
	keep if book_year_hold==1911
	
	disp _N
	* 70,270
	
	bys investor_region1_final_hold: egen cnt_investors = count(par_value_clean_hold)
	bys investor_region1_final_hold: egen sum_investors = sum(par_value_clean_hold)
	format sum_investors %16.0f
	tabdisp investor_region1_final_hold, cell(cnt_investors sum_investors)	

	duplicates drop issue_id_holdings, force
	
	disp _N
	* 23,002
	
	duplicates drop firm_id_holdings, force
	
	disp _N
	* 6,978
	
use HoldingsData, clear
	keep if book_year_hold==1913
	
	disp _N
	* 75,368
	
	bys investor_region1_final_hold: egen cnt_investors = count(par_value_clean_hold)
	bys investor_region1_final_hold: egen sum_investors = sum(par_value_clean_hold)
	format sum_investors %16.0f
	tabdisp investor_region1_final_hold, cell(cnt_investors sum_investors)

	duplicates drop issue_id_holdings, force
	
	disp _N
	* 23,316
	
	duplicates drop firm_id_holdings, force
	
	disp _N
	* 6,734	
	
************************************************************************
**** Merge weekly and intraday data
************************************************************************	
foreach name in "Run once" {
	* Load intraday data
	use intraday_data_cleaned_v1, clear
		
		* Compute closing price for each date
		sort issuer_id issue_id trade_id trade_num date
		gen last = price_trans if issuer_id==issuer_id[_n-1] & issue_id==issue_id[_n-1] & trade_id==trade_id[_n-1] & date>date[_n-1]
		
		* Collapse daily to one observation (not every trade)
		bys issuer_id issue_id trade_id date: egen sum_salesXprice_trans = sum(salesXprice_trans)
		collapse (mean) coupon  sales_trans transaction_data_dum last sum_salesXprice_trans abs_ret price_impact, by(issuer_id issue_id trade_id date)
		gen perp_yield = coupon/last	
		rename sum_salesXprice_trans salesXprice_trans
		
	merge m:m issuer_id issue_id trade_id date using weekly_data_cleaned_v1, force
	* 88,793 total observations
	
		* Don't need this (can always generate it again later)
		drop unique_id
		
	save merged_intra_wkly, replace
	
}
	
log close



	
}



