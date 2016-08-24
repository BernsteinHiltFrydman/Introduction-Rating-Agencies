*This file creates the dummies that notes similar firms
*use Holdings_Data_IssuerClean.dta, clear
cd "$root_do"
cap drop group_* count_*
keep if industry~="Government"
duplicates drop cname_hold_temp, force
save tempc.dta, replace
use tempc.dta, clear

/**0. With & w/ rr & ry
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
replace cname_hold_temp=subinstr(cname_hold_temp,")","",.) if strpos(cname_hold_temp,")") & !strpos(cname_hold_temp,"(")
replace cname_hold_temp=subinstr(cname_hold_temp,"(","",.) if strpos(cname_hold_temp,"(") & !strpos(cname_hold_temp,")")

duplicates drop cname_hold_temp, force
strgroup cname_hold_temp, gen(group_basic) thresh(1) norm(none) force
duplicates tag group_basic, gen(count_basic)
*/

gen id=_n
sort id

*rr & ry & securities & 's & electric & station & street & "and" & prepositions & tel-things
cap drop temp
gen temp=1 if strpos(cname_hold_temp,"railroad")|strpos(cname_hold_temp,"railway")
save tempc_1.dta, replace
replace cname_hold_temp=regexr(cname_hold_temp,"railroad$","")
replace cname_hold_temp=regexr(cname_hold_temp,"railway$","")
replace cname_hold_temp=regexr(cname_hold_temp,"securities$","")
replace cname_hold_temp=subinword(cname_hold_temp,"s","",.)
replace cname_hold_temp=regexr(cname_hold_temp,"electric$","")
replace cname_hold_temp=regexr(cname_hold_temp,"scrip$","")
replace cname_hold_temp=regexr(cname_hold_temp,"station$","")
replace cname_hold_temp=regexr(cname_hold_temp,"street$","")
replace cname_hold_temp=regexr(cname_hold_temp,"and","")
replace cname_hold_temp=regexr(cname_hold_temp,"for","")
replace cname_hold_temp=regexr(cname_hold_temp,"of","")
replace cname_hold_temp=regexr(cname_hold_temp,"at","")
replace cname_hold_temp=regexr(cname_hold_temp,"valley$","")
replace cname_hold_temp=regexr(cname_hold_temp,"bridge$","")
replace cname_hold_temp=regexr(cname_hold_temp,"telegraph$","")
replace cname_hold_temp=regexr(cname_hold_temp,"telephone$","")
replace cname_hold_temp=regexr(cname_hold_temp,"county","")
replace cname_hold_temp=regexr(cname_hold_temp,"st","")

replace cname_hold_temp=regexr(cname_hold_temp,"railroad$","")
replace cname_hold_temp=regexr(cname_hold_temp,"railway$","")
replace cname_hold_temp=regexr(cname_hold_temp,"securities$","")
replace cname_hold_temp=subinword(cname_hold_temp,"s","",.)
replace cname_hold_temp=regexr(cname_hold_temp,"electric$","")
replace cname_hold_temp=regexr(cname_hold_temp,"scrip$","")
replace cname_hold_temp=regexr(cname_hold_temp,"station$","")
replace cname_hold_temp=regexr(cname_hold_temp,"street$","")
replace cname_hold_temp=regexr(cname_hold_temp,"and","")
replace cname_hold_temp=regexr(cname_hold_temp,"for","")
replace cname_hold_temp=regexr(cname_hold_temp,"of","")
replace cname_hold_temp=regexr(cname_hold_temp,"at","")
replace cname_hold_temp=regexr(cname_hold_temp,"valley$","")
replace cname_hold_temp=regexr(cname_hold_temp,"bridge$","")
replace cname_hold_temp=regexr(cname_hold_temp,"telegraph$","")
replace cname_hold_temp=regexr(cname_hold_temp,"telephone$","")
replace cname_hold_temp=regexr(cname_hold_temp,"county","")
replace cname_hold_temp=regexr(cname_hold_temp,"st","")

replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
strgroup cname_hold_temp, gen(group_rrry) thresh(1) norm(none) force
sort id
save tempc_2.dta,replace

use tempc_1.dta, clear
merge m:n id using tempc_2.dta, gen(merge_rrry)
duplicates drop cname_hold_temp,force
duplicates tag group_rrry, gen(count_rrry)
replace count_rrry=0 if count_rrry>300
gsort -count_rrry group_rrry
*browse

*with & w/ "("
cap drop temp
gen temp=1 if strpos(cname_hold_temp,"(")|strpos(cname_hold_temp,")")
save tempc_1, replace
replace cname_hold_temp=subinstr(cname_hold_temp,"(","",.)
replace cname_hold_temp=subinstr(cname_hold_temp,")","",.)
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
strgroup cname_hold_temp, gen(group_par) thresh(1) norm(none) force
sort id
save tempc_2,replace

use tempc_1, clear
merge m:n id using tempc_2, gen(merge_par)
duplicates drop cname_hold_temp,force
duplicates tag group_par, gen(count_par)
replace count_par=0 if count_par>1000
gsort -count_par group_par
*browse

*with & w/ anything within parentheses
cap drop temp
gen temp=1 if strpos(cname_hold_temp,"(")|strpos(cname_hold_temp,")")
save tempc_1, replace
replace cname_hold_temp = regexr(cname_hold_temp, "\((.)+\)", "")
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
strgroup cname_hold_temp, gen(group_par2) thresh(1) norm(none) force
sort id
save tempc_2,replace

use tempc_1, clear
merge m:n id using tempc_2, gen(merge_par2)
duplicates drop cname_hold_temp,force
duplicates tag group_par2, gen(count_par2)
replace count_par2=0 if count_par2>1000
gsort -count_par2 group_par2
count if count_par2>0
*browse

save tempc_temp.dta, replace

use tempc_temp.dta, clear

*Remove trailing states & cities
*remove last o, remove the cases as "(place a) and (place b)" & "bank of (place)", keeps the cases as "central railroad of (some place)"
cap drop temp
gen temp=1 if strpos(cname_hold_temp,"(")|strpos(cname_hold_temp,")")
save tempc_1, replace
global x="cname_hold_temp"
replace cname_hold_temp=subinstr(cname_hold_temp,"(","",.)
replace cname_hold_temp=subinstr(cname_hold_temp,")","",.)
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
drop if regexm(cname_hold_temp," and$")
drop if regexm(cname_hold_temp,"bank of$") 
drop if cname_hold_temp==""
strgroup cname_hold_temp, gen(group_geo) thresh(1) norm(none) force
sort id
save tempc_2,replace

use tempc_1, clear
merge m:n id using tempc_2, gen(merge_geo)
duplicates drop cname_hold_temp,force
duplicates tag group_geo, gen(count_geo)
replace count_geo=0 if count_geo>1000
replace count_geo=0 if group_geo==.
gsort -count_geo group_geo
count if count_geo>0 & count_par==0 & count_par2==0
*browse cname_hold_temp count_geo group_geo //if count_par==0 & count_par2==0

*Remove trailing states & cities & parentheses
cap drop temp
gen temp=1 if strpos(cname_hold_temp,"(")|strpos(cname_hold_temp,")")
save tempc_1, replace
global x="cname_hold_temp"
replace cname_hold_temp = regexr(cname_hold_temp, "\((.)+\)", "")
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
drop if regexm(cname_hold_temp," and$")
drop if regexm(cname_hold_temp,"bank of$") 
drop if cname_hold_temp==""
strgroup cname_hold_temp, gen(group_geo2) thresh(1) norm(none) force
sort id
save tempc_2,replace

use tempc_1, clear
merge m:n id using tempc_2, gen(merge_geo2)
duplicates drop cname_hold_temp,force
duplicates tag group_geo2, gen(count_geo2)
replace count_geo2=0 if count_geo2>1000
replace count_geo2=0 if group_geo2==.
gsort -count_geo2 group_geo2
count if count_geo2>0 & count_par==0 & count_par2==0
*browse cname_hold_temp count_geo2 group_geo2 //if count_par==0 & count_par2==0



*9-typo strgroup that help to find a lot of stuffs
save tempc_1, replace
replace cname_hold_temp=regexr(cname_hold_temp,"railroad$","")
replace cname_hold_temp=regexr(cname_hold_temp,"railway$","")
replace cname_hold_temp=regexr(cname_hold_temp,"securities$","")
replace cname_hold_temp=subinword(cname_hold_temp,"s","",.)
replace cname_hold_temp=regexr(cname_hold_temp,"electric$","")
replace cname_hold_temp=regexr(cname_hold_temp,"scrip$","")
replace cname_hold_temp=regexr(cname_hold_temp,"station$","")
replace cname_hold_temp=regexr(cname_hold_temp,"street$","")
replace cname_hold_temp=regexr(cname_hold_temp,"and","")
replace cname_hold_temp=regexr(cname_hold_temp,"for","")
replace cname_hold_temp=regexr(cname_hold_temp,"of","")
replace cname_hold_temp=regexr(cname_hold_temp,"at","")
replace cname_hold_temp=regexr(cname_hold_temp,"valley$","")
replace cname_hold_temp=regexr(cname_hold_temp,"bridge$","")
replace cname_hold_temp=regexr(cname_hold_temp,"telegraph$","")
replace cname_hold_temp=regexr(cname_hold_temp,"telephone$","")
replace cname_hold_temp=regexr(cname_hold_temp,"county","")
replace cname_hold_temp=regexr(cname_hold_temp,"st","")
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
global x="cname_hold_temp"
replace cname_hold_temp = regexr(cname_hold_temp, "\((.)+\)", "")
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
do remove_geo.do
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
drop if regexm(cname_hold_temp," and$")
drop if regexm(cname_hold_temp,"bank of$") 
drop if cname_hold_temp==""
strgroup cname_hold_temp, gen(group_str) force norm(none) threshold(9)
sort id
save tempc_2,replace

use tempc_1, clear
merge m:n id using tempc_2, gen(merge_str)
duplicates drop cname_hold_temp,force
duplicates tag group_str, gen(count_str)
replace count_str=0 if count_str>300
gsort -count_str group_str
*browse cname_hold_temp count_str group_str if count_str==0 & count_par==0 & count_par2==0 & count_geo==0 & count_geo2==0
//browse cname_hold_temp if strpos(cname_hold_temp,"rail") & !strpos(cname_hold_temp,"railroad") & !strpos(cname_hold_temp,"railway") //if wordc==1


sort cname_hold_temp
cap drop temp 
cap drop id
cap drop first_word
save temp.dta, replace

use "$root_data\Holdings_Data_IssuerClean.dta", clear
merge m:n cname_hold_temp using temp.dta
drop merge* _merge
cap drop *_1st
cap drop countt_str

label var group_rrry "Group index for matches removing non-essential words"
label var group_par "Group index for matches removing parentheses marks"
label var group_par2 "Group index for matches removing eberything within the parentheses"
label var group_geo "Group index for matches removing trailing geographic information and pare. marks"
label var group_geo2 "Index for matches removing trailing geographic information and anything within the parentheses "
label var group_str "Index for matches removing(), words, and geographic and fuzzy match with 9 typos"
replace cname_hold_temp=cname_hold_temp+" stock" if regexm(cname_hold_orig,"STOCK COMPANY$") & !regexm(cname_hold_temp,"stock$")

cd "$root_data"
saveold Holdings_Data_IssuerClean.dta, replace

/*
keep if industry~="Government"
duplicates drop cname_hold_temp, force
save temp.dta, replace
use temp.dta, replace
*browse cname_hold_temp if count_rrry+count_par+count_par2+count_1st+count_geo+count_geo2+count_str==0
