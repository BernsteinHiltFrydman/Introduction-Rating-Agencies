global root_dta "D:\Dropbox\Bond Rating\Code and Data\dta"
global root_do "D:\Dropbox\Bond Rating\Code and Data\do_issue"

cd "$root_dta"
use Holdings_Data_Dummy.dta, clear

drop if industry=="Government"
save trial.dta, replace
***** Analysis_Summary Statistics
rename group_investor id_investor
rename group_issuer id_issuer
egen id_issue=group(id_issuer coupon_hold_temp maturity_hold_temp class_type collateral_temp)

codebook id_investor if book_year_hold==1908
codebook id_investor if book_year_hold==1911
codebook id_investor if book_year_hold==1913

gen investor_city_use=cond(investor_city_2!="",investor_city_2,investor_city_1)
gen investor_state_use=cond(investor_state_2!="",investor_state_2,investor_state_1)

*Average holding
bysort id_investor_city book_year_hold: egen tot=total(par_value_temp)
bysort book_year_hold: egen totl=mean(tot)

bysort id_issuer book_year_hold: egen tot=total(par_value_temp)
bysort book_year_hold: egen totl=mean(tot)

use Holdings_Data_Dummy.dta, clear
cap drop tot totl
duplicates drop id_issuer id_issue_d book_year_hold, force
bysort id_issuer book_year_hold: egen tot=count(id_issue_d)
bysort book_year_hold: egen totl=mean(tot)
tab totl book_year_hold

use Holdings_Data_Dummy.dta, clear
cap drop tot totl
duplicates drop id_issuer id_investor_city book_year_hold, force
bysort id_investor_city book_year_hold: egen tot=count(id_issuer)
bysort book_year_hold: egen totl=mean(tot)
tab totl book_year_hold


use Holdings_Data_Dummy.dta, clear
cap drop tot totl
duplicates drop id_issue_d id_investor_city book_year_hold, force
bysort id_investor_city book_year_hold: egen tot=count(id_issue_d)
bysort book_year_hold: egen totl=mean(tot)
tab totl book_year_hold
