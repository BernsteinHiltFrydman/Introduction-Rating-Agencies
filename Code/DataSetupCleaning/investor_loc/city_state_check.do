global root_data="D:\Dropbox\Bond Rating\Code and Data\dta"
global root_do="D:\Dropbox\Bond Rating\Code and Data\do_investor_loc"

cd "$root_data"
use Holdings_Data_InvestorClean_dummy.dta,clear

cap drop _merge
drop if industry=="Government"
gen city_mst=cond(investor_city_2=="",investor_city_1,investor_city_2)
gen state_mst=cond(investor_state_2=="",investor_state_1,investor_state_2)
duplicates tag city_mst state_mst, gen(count)

bysort city_mst: gen x=_n
bysort city_mst: replace state_mst=cond(!strpos(state_mst[_n-1],state_mst),trim(state_mst[_n-1])+"\"+trim(state_mst),trim(state_mst[_n-1]))
replace state_mst=regexr(state_mst,"^\\","")
bysort city_mst: egen max=max(x)
bysort city_mst: replace state_mst=state_mst[_N]
bysort city_mst: egen maxco=max(count)

sort city_mst count state_mst

save temp1.dta, replace

cd "$root_data"
use temp1.dta, clear

duplicates drop city_mst state_mst investor_state_temp if strpos(state_mst,"\"), force

gen state_use=cond(investor_state_2=="",investor_state_1,investor_state_2)
rename city_mst city
sort city
cd "$root_do"
cap drop _merge
merge m:n city using city_state_list_whole.dta
drop if _merge==2
gen dum=cond(strpos(state,state_use),1,0) if _merge==3




browse industry book_year_hold city state_mst state investor_city_temp investor_state_temp count dum cname_hold_orig invname_hold_orig par_value_clean_hold coupon_hold if strpos(state_mst,"\") & maxco~=0




