use "D:\Dropbox\Bond Rating\Code and Data\dta\Holdings_Data_Issue_temp.dta", clear
cap drop investor_city_1 investor_city_2
drop if industry=="Government"
split investor_city_temp, gen(investor_city_)
gen city=cond(investor_city_2=="",investor_city_1,investor_city_2)
cap drop state
gen state_use=cond(investor_state_2=="",investor_state_1,investor_state_2)

keep if industry~="Government"
duplicates drop city state_use, force

sort city
cd "D:\Dropbox\Bond Rating\Code and Data\do_investor_loc"
merge m:n city using city_state_list_whole.dta
drop if _merge==2
gen dum=cond(strpos(state,state_use),1,0) if _merge==3
