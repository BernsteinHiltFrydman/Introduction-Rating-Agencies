**001
*This file cleans the original issuer name string variable (cname_id_orig)
*To make this do file reuseable, I need to replace cname_hold_orig by some locals, which will make the program less readable. I might do that in the future.
global root_data "$root_dropbox\Bond Rating\Code and Data\dta"
global root_do "$root_dropbox\Bond Rating\Code and Data\do"
set more off
 
cd "$root_data"
use HoldingsData_Final_wIndustry.dta, clear

cd "$root_do"

ssc install strgroup
ssc install egenmore
/*
*1.Check for total number of issuers
capture drop tag issuer_num
egen tag=tag(cname_hold_orig industry)
egen issuer_num=total(tag)
tab issuer_num 
*/

*1.Tranfer the upper case into lower case
gen cname_hold_temp=strlower(cname_hold_orig)
label var cname_hold_temp "temporary variable constructed to clean issuer name variable"

*2. Fix un-readable characters
replace cname_hold_temp= ustrfix(cname_hold_temp, "")

*3.Remove "company"
replace cname_hold_temp=cname_hold_temp+";"
foreach y in " company" " co." " co;"{
	replace cname_hold_temp=subinstr(cname_hold_temp,"`y'","",.)
	}
*check for " co;":
*list cname_hold_temp if strpos(cname_hold_temp, " co;")

*4.Remove "corporation"
foreach y in " corporation" " corp." " corp;"{
	replace cname_hold_temp=subinstr(cname_hold_temp,"`y'","",.)
	}


/*5.Parentheses: normalize the parentheses and move them all into the back

egen parentheses_count=noccur(cname_hold_temp),s("(")
*step 1: elliminate (the)?
replace cname_hold_temp=subinstr(cname_hold_temp," (the)","",.)
*step 2: split & move
cap drop subname1*
split cname_hold_temp, gen(subname1) p("(")
split subname12, gen(subname2) p(")")

rename subname11 front 
rename subname21 within
rename subname22 rear
replace cname_hold_temp=strtrim(front)+" "+strtrim(rear)+"("+strtrim(within)+")" if parentheses_count==1


**When look at multiple parentheses
split subname13, gen(subname3) p(")")
rename subname31 within2
rename subname32 rear2
replace cname_hold_temp=strtrim(front)+" "+strtrim(rear)+" "+strtrim(rear2)+"("+strtrim(within)+")" +" ("+strtrim(within2)+")" if parentheses_count==2
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=subinstr(cname_hold_temp," )",")",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"( ","(",.)

*replace cname_hold_temp = regexr(cname_hold_temp, "\((.)+\)", "")
*/

*check for parentheses characteristics
/*use holding_temp.dta, clear
duplicates drop cname_hold_temp industry, force
tempfile t
tempfile x
sort cname_hold_temp
save "`t'"
replace cname_hold_temp = regexr(cname_hold_temp, "\((.)+\)", "")
save "`x'"
merge m:n cname_hold_temp using "`t'"
drop if _merge==3
save holding_parantheses.dta
*/
*6.Remove unnecessary punctuations
replace cname_hold_temp=subinstr(cname_hold_temp,"'"," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,", "," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,","," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"; "," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,";"," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"!"," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"*"," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"&","and",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"- "," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"-"," ",.)
replace cname_hold_temp=subinstr(cname_hold_temp," -"," ",.)


*7.Common typos: Replace “5” w/ “S”, “8” w/ “S”, “1” w/ “t”, “axd” w/ “and”, " ryand" w/ " ry and", " oas " w/ " gas ", then leading numbers with blank
replace cname_hold_temp=subinstr(cname_hold_temp,"5","s",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"8","s",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"1","t",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"axd","and",.)
replace cname_hold_temp=subinstr(cname_hold_temp," ryand"," ry and",.)
replace cname_hold_temp=subinstr(cname_hold_temp," oas "," gas ",.)

forvalues i=0/9 {
	replace cname_hold_temp=substr(cname_hold_temp,2,.) if substr(cname_hold_temp,1,1)=="`i'"
	}

*8.Replace multiple blanks
replace cname_hold_temp=stritrim(cname_hold_temp)

*9.Remove trailing and leading spaces
replace cname_hold_temp=strtrim(cname_hold_temp)

*10. Replace ry & rr, ryand by "ry and"
replace cname_hold_temp=subinstr(cname_hold_temp," ry"," railway",.)
replace cname_hold_temp=subinstr(cname_hold_temp," rr"," railroad",.)

do ReplaceList_Issuer_1typo_02.do 
do ReplaceList_Issuer_Parentheses_03.do
do Abundunt_BondInfo_04.do
do State_Abbreviation_05.do
do ReplaceList_Issuer_1typo_02.do
do ReplaceList_Issuer_2typo_07.do
do Replace_08.do
cap drop parentheses_count front subname12 subname13 within rear within2 rear2
cd "$root_data"
saveold Holdings_Data_IssuerClean.dta, replace
cd "$root_do"
do Gen_Dumm_09.do

cd "$root_do"
erase temp.dta
erase tempc.dta
erase tempc_1.dta
erase tempc_2.dta
erase tempc_temp.dta

cd "$root_data"
saveold Holdings_Data_IssuerClean.dta, replace
