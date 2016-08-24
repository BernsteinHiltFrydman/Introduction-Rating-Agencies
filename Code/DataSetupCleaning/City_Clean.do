cd "D:\Dropbox\Bond Rating\Investor_Name_Loc\temp"

use Holdings_Investor_StateClean.dta, clear
replace investor_city_temp=ustrfix(investor_city_temp,"")
replace investor_city_1=subinstr(investor_city_1,"�","",.)

cap drop investor_city_1 investor_city_2 investor_city_3
split investor_city_temp, parse("/") gen(investor_city_)
sort investor_city_1

replace investor_city_1="" if investor_city_1=="can"
replace investor_city_1="" if investor_city_1=="canada"
replace investor_city_1="white river junction" if investor_city_1=="junction" & strpos(invname_hold_orig,"White River")
replace investor_city_1="" if investor_city_1=="scotland"
replace investor_city_1="" if investor_city_1=="sweden"
replace investor_city_1="" if investor_city_1=="trust"
replace investor_city_1="" if investor_city_1=="union"
replace investor_city_1="" if investor_city_1=="worker"




*Replace City List
forv i=1/3{
global x="investor_city_`i'"
do Replace_City_List.do
}
save temp_city.dta, replace
use temp_city.dta, clear

*drop meaning-less observations
forv i=1/3{
replace $x="" if $x=="safe deposit & title ins"
replace $x="" if $x=="conn"
replace $x="" if $x=="new"
replace $x="" if $x=="delaware"
replace $x="" if $x=="eng"
replace $x="" if $x=="germany"
replace $x="" if $x=="me"
replace $x="" if $x=="mass"
replace $x="" if $x=="savings bank"
replace $x="" if $x=="st"
replace $x="" if $x=="bank"
replace $x="" if $x=="england"
replace $x="" if $x=="ger"
replace $x="" if $x=="o"
replace $x="" if $x=="pa"
replace $x="" if $x=="pennsylvania"
replace $x="" if $x=="title & savings company"
replace $x="" if $x=="title a s"
replace $x="" if $x=="industrial trust company"
replace $x="" if $x=="fire & life assurance corporation"
replace $x="" if $x=="inc"
}

*Recreate split variable
replace investor_city_temp=investor_city_1
replace investor_city_temp=investor_city_temp+"/"+investor_city_2 if investor_city_2~=""
replace investor_city_temp=investor_city_temp+"/"+investor_city_3 if investor_city_3~=""

cap drop investor_city_1 investor_city_2 investor_city_3
split investor_city_temp, parse("/") gen(investor_city_)

*Gen Dummy
forv i=1/3{
global x="investor_city_`i'"
do City_State_Dummy.do
}

cap drop _merge 
cap drop state
merge m:n investor_city_1 using citystate_2010
drop if _merge==2

browse investor_city_1 investor_state_temp state investor_city_temp book_year_hold invname_hold_orig cname_hold_temp industry if dummy_investor_city_1==0 & industry~="Government"


/*
*strgroup (5)
drop if industry=="Government"
cap drop count_city* count_group
duplicates tag investor_city_1, gen(count_city1)
duplicates drop investor_city_1, force

forv i=1/3{
global x="investor_city_`i'"
do City_State_Dummy.do
}
*strgroup investor_city_1, gen(group_city1) norm(none) threshold(3) force
*duplicates tag group_city1, gen(count_group1)
save temp_city2.dta, replace


use temp_city2.dta, clear

/*
rename investor_city_1 std_name
cap drop _merge
sort std_name
tempfile x
save "`x'" 
/*
merge m:n std_name using city_state_list.dta
drop if _merge==2
drop if _merge==3
*/
gen idm=_n
cap drop _merge
reclink2 std_name using city_state_list.dta, idm(idm) idu(idu) gen(score) mins(.8) _merge(merge)
drop if score==1
cap drop merge
cap drop Ustd_name idu score var3 tag 
reclink2 std_name using city_state_list.dta, idm(idm) idu(idu) gen(score) mins(.9) _merge(merge)

merge m:n std_name using "`x'"
cap drop merge
cap drop _merge
/*
cap drop idu score var3 tag
merge m:n std_name using city_state_list.dta
*/
rename std_name investor_city_1
*drop if _merge==2

gsort -score

gsort -count_group1 group_city1 investor_city_temp investor_state_temp cname_hold_temp
browse tag investor_city_1 Ustd_name count_city1 investor_state_temp state Ustd_name invname_hold_orig book_year_hold cname_hold_temp investor_city_temp industry if dummy_investor_city_1==0//group_city1//count_group1 if count_group1>0

*browse investor_city_1 Ustd_name investor_state_temp state count_city1 investor_city_temp group_city1 count_group1 book_year_hold invname_hold_orig cname_hold_temp industry score  if score>0 & score~=.

/*Fuzzy-merge with state_city link
save temp_city2.dta, replace
use city_state_list.dta, clear
cap drop idu
sort std_name
gen idu=_n
save city_state_list.dta, replace

use temp_city2.dta, clear
gen idm=_n
rename investor_city_1 std_name
reclink2
*/
