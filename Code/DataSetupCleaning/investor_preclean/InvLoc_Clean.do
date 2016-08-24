**001
*This file cleans the inv_state variable
*global t "D:\Bond Rating Projects\Investor_NameLoc"
*cd "$t"
*use temp_invname.dta, replace

cap drop parentheses_count issuer_num front subname12 subname13 within rear within2 rear2 tag

*preclean state name
cap drop investor_state_temp investor_state_1 investor_state_2 investor_state_3 investor_city_1 investor_city_2 investor_city_3
cap drop investor_state_temp

gen investor_state_temp=lower(investor_state_hold)
replace investor_state_temp=lower(investor_state_hold)
replace investor_state_temp=subinstr(investor_state_temp,"'s","",.)
replace investor_state_temp=subinstr(investor_state_temp,"'","",.)
replace investor_state_temp=subinstr(investor_state_temp,".","",.)
replace investor_state_temp=subinstr(investor_state_temp,","," ",.)
replace investor_state_temp=subinstr(investor_state_temp,"-"," ",.)
replace investor_state_temp=subinword(investor_state_temp,"0","o",.)
*remove no., date & coupon info is cleaned in manuallyClean_Requested.xlsx
replace investor_state_temp= ustrfix(investor_state_temp, "")
egen investor_state_temp2=sieve(investor_state_temp), keep(a s o)
replace investor_state_temp=investor_state_temp2
drop investor_state_temp2
replace investor_state_temp=subinword(investor_state_temp,"br","",.)
replace investor_state_temp=subinword(investor_state_temp,"(u sbranch","",.)
replace investor_state_temp=subinword(investor_state_temp,"(u s","",.)
replace investor_state_temp=subinword(investor_state_temp,"(us","",.)
replace investor_state_temp=subinword(investor_state_temp,"(canadian","",.)
replace investor_state_temp=subinword(investor_state_temp,"branch","",.)
replace investor_state_temp = regexr(investor_state_temp, "\((.)+\)", "")
replace investor_state_temp=subinstr(investor_state_temp,"(","",.)
replace investor_state_temp=subinstr(investor_state_temp,")","",.)
replace investor_state_temp=subinstr(investor_state_temp,"*","",.)
replace investor_state_temp=subinstr(investor_state_temp,"#","",.)
replace investor_state_temp=subinstr(investor_state_temp,"^","",.)
replace investor_state_temp=subinstr(investor_state_temp,"!","l",.)
replace investor_state_temp=subinstr(investor_state_temp,";","",.)
replace investor_state_temp=subinstr(investor_state_temp,"$","",.)
replace investor_state_temp=subinstr(investor_state_temp,":","",.)
replace investor_city_hold="boston" if strpos(investor_state_temp,"bost")&!strpos(investor_state_temp,"eng") &!strpos(investor_state_temp,"mass")
replace investor_state_temp="new york" if strpos(investor_state_temp,"bost")&!strpos(investor_state_temp,"eng") &!strpos(investor_state_temp,"mass")

replace investor_state_temp=strtrim(investor_state_temp)
*browse investor_city_hold investor_state_temp book_year_hold cname_hold_orig invname_hold_temp industry if strpos(investor_state_temp,"(")

split investor_state_temp, p("/") gen(investor_state_)
foreach i in "temp" "1" "2" "3"{
global x="investor_state_`i'"
do StateList.do
}

/*
cap drop temp*
split investor_state_1, gen(temp)

cap log close
cap drop _merge*
cap drop lent
cap drop len*
gen lent=0
log using temp, replace
forvalue i=1/6{
sort temp`i'
merge m:1 temp`i' using states.dta
rename _merge _merge`i'
tab temp`i' if _merge`i'==3
gen len`i'=strlen(temp`i')
replace lent=lent+len`i'
}
log close

cap drop _merge
sort investor_state_1
save temp_merge.dta, replace
merge m:1 investor_state_1 using states.dta
drop if _merge==2

preserve
keep if _merge==1
save 1st_unmatch.dta, replace
duplicates drop investor_city_hold investor_state_temp, force
restore
*/

*save temp_state.dta, replace

*preclean city name
gen investor_city_temp=lower(investor_city_hold)
replace investor_city_temp=lower(investor_city_hold)
replace investor_city_temp=subinstr(investor_city_temp,"'s","",.)
replace investor_city_temp=subinstr(investor_city_temp,"'","",.)
replace investor_city_temp=subinstr(investor_city_temp,".","",.)
replace investor_city_temp=subinstr(investor_city_temp,",","/",.)
replace investor_city_temp=subinstr(investor_city_temp,"-","",.)
replace investor_city_temp=subinword(investor_city_temp,"0","o",.)
replace investor_city_temp= ustrfix(investor_city_temp, "")
*remove no., date & coupon info is cleaned in manuallyClean_Requested.xlsx
egen investor_city_temp2=sieve(investor_city_temp), keep(a s o)
replace investor_city_temp=investor_city_temp2
drop investor_city_temp2
replace investor_city_temp=subinword(investor_city_temp,"br","",.)
replace investor_city_temp=subinword(investor_city_temp,"(u sbranch","",.)
replace investor_city_temp=subinword(investor_city_temp,"(u s","",.)
replace investor_city_temp=subinword(investor_city_temp,"(us","",.)
replace investor_city_temp=subinword(investor_city_temp,"(canadian","",.)
replace investor_city_temp=subinword(investor_city_temp,"branch","",.)
replace investor_city_temp = regexr(investor_city_temp, "\((.)+\)", "")
replace investor_city_temp=subinstr(investor_city_temp,"(","",.)
replace investor_city_temp=subinstr(investor_city_temp,")","",.)
replace investor_city_temp=subinstr(investor_city_temp,"*","",.)
replace investor_city_temp=subinstr(investor_city_temp,"#","",.)
replace investor_city_temp=subinstr(investor_city_temp,"^","",.)
replace investor_city_temp=subinstr(investor_city_temp,"!","l",.)
replace investor_city_temp=subinstr(investor_city_temp,";","",.)
replace investor_city_temp=subinstr(investor_city_temp,"$","",.)
replace investor_city_temp=subinstr(investor_city_temp,":","",.)
replace investor_city_hold="boston" if strpos(investor_city_temp,"bost")&!strpos(investor_city_temp,"eng") &!strpos(investor_city_temp,"mass")
replace investor_city_temp="new york" if strpos(investor_city_temp,"bost")&!strpos(investor_city_temp,"eng") &!strpos(investor_city_temp,"mass")

replace investor_city_temp=strtrim(investor_city_temp)
*browse investor_city_hold investor_city_temp book_year_hold cname_hold_orig invname_hold_temp industry if strpos(investor_city_temp,"(")

split investor_city_temp, p("/") gen(investor_city_)

save temp_bfmerge.dta, replace

*use temp_bfmerge.dta, clear

sort investor_city_1
merge m:n investor_city_1 using citystate_2010.dta
drop if _merge==2
/*
duplicates drop investor_state_temp investor_city_temp, force
sort investor_state_temp investor_city_temp
*gen lent=length(state)
*bysort investor_state_temp: egen max=max(lent)
*keep if lent==max
duplicates drop investor_state_1, force


browse investor_state_temp state investor_city_temp cname_hold_temp invname_hold_temp book_year_hold coupon_hold 
/****************Merge City Dataset*******************************
duplicates drop investor_city_hold investor_state_temp, force
tab temp1

sort investor_city_1
merge m:n investor_city_1 using citystate.dta
rename _merge merge_city_state

sort investor_state_1
merge m:n investor_state_1 using states.dta
label var _merge "1 for not match, 3 for match"
rename _merge state_in_us

save temp_merge.dta, replace

tab investor_state_1 if merge_city_state==3 & state_in_us==1
* Dubious for city with multiple states!!!
* Didn't work! Find other ways to clean the original dataset!
*replace investor_state_1=state if merge_city_state==3 & state_in_us==1
**********************************************************


tab city 


/***
global x="investor_state_1"
global x="investor_state_2"
global x="investor_state_3"

codebook $x

cap log close
cap drop _merge*
cap drop lent
cap drop len*
gen lent=0
log using temp, replace
forvalue i=1/6{
sort temp`i'
merge m:1 temp`i' using states.dta
rename _merge _merge`i'
tab temp`i' if _merge`i'==3
gen len`i'=strlen(temp`i')
replace lent=lent+len`i'
}
log close

browse investor_state_*



split investor_state_1, gen(temp)
