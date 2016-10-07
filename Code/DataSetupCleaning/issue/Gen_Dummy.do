*This file creates group id for investor name, issuer name & issues
set more off
global root_dta "D:\Dropbox\Bond Rating\Code and Data\dta"
cd "$root_dta"

use Holdings_Data_Issue_temp.dta, clear
*Revise investor_type_temp
replace invname_hold_temp=invname_hold_temp+" indiana" if regexm(invname_hold_orig," Indiana$") & !regexm(invname_hold_temp,"indiana$")
gen investor_type_temp="other investors"
replace investor_type_temp="other banks" if strpos(invname_hold_temp,"bank")
replace investor_type_temp="insurance" if strpos(invname_hold_temp,"insurance")|strpos(invname_hold_temp,"indemnity")|strpos(invname_hold_temp,"assurance")
replace investor_type_temp="savings banks" if strpos(invname_hold_temp,"saving")
replace investor_type_temp="trust" if strpos(invname_hold_temp,"trust")

cap drop id
gen id=_n
sort id
save tempc_1.dta, replace

global root_do "D:\Dropbox\Bond Rating\Code and Data\do_investor_loc"
cd "$root_do"
global x="invname_hold_temp"
do Remove_Trailing_Geo.do
replace $x=subinword($x,"accid","accident",.)
replace $x=subinword($x,"acc","accident",.)
replace $x=subinword($x,"ft","and",.)
replace $x=subinword($x,"fc","and",.)
replace $x=subinword($x,"jc","and",.)
replace $x=subinword($x,"american samoa","association",.)
replace $x=subinword($x,"asso","association",.)
replace $x=subinword($x,"assn","association",.)
replace $x=subinword($x,"assoc","association",.)
replace $x=subinword($x,"assocn","association",.)
replace $x=subinword($x,"american samoa","assurance",.)
replace $x=subinword($x,"assur","assurance",.)
replace $x=subinword($x,"assn","assurance",.)
replace $x=subinword($x,"ass","assurance",.)
replace $x=subinword($x,"ave","avenue",.)
replace $x=subinword($x,"br","branch",.)
replace $x=subinword($x,"cann","canada",.)
replace $x=subinword($x,"california","canada",.)
replace $x=subinword($x,"canadian","canada",.)
replace $x=subinword($x,"cent","cents",.)
replace $x=subinword($x,"connecticut ty","county",.)
replace $x=subinword($x,"dep$","deposit",.)
replace $x=subinword($x,"l ire","fire",.)
replace $x=subinword($x,"erie insurance","fire insurance",.)
replace $x=subinword($x,"germania","german",.)
replace $x=subinword($x,"guar ","guaranty",.)
replace $x=subinword($x,"guar","guaranty",.)
replace $x=subinword($x,"illinois inois","illinois",.)
replace $x=subinword($x,"indiana the town","in the town",.)
replace $x=subinword($x,"inst","institution",.)
replace $x=subinword($x,"institute","institution",.)
replace $x=subinword($x,"titution","institution",.)
replace $x=subinword($x,"ins","insurance",.)
replace $x=subinword($x,"insur","insurance",.)
replace $x=subinword($x,"liab","liability",.)
replace $x=subinword($x,"ltd","limited",.)
replace $x=subinword($x,"manufacturing","manufacturers",.)
replace $x=subinword($x,"mfgrs","manufacturers",.)
replace $x=subinword($x,"mfgr","manufacturers",.)
replace $x=subinword($x,"mfrs","manufacturers",.)
replace $x=subinword($x,"manufacturer","manufacturers",.)
replace $x=subinword($x,"massachusetts r ine","marine",.)
replace $x=subinword($x,"mer","mercantile",.)
replace $x=subinword($x,"merchants","mercantiles",.)
replace $x=subinword($x,"mechanic","merchants",.)
replace $x=subinword($x,"mort","mortgage",.)
replace $x=subinword($x,"mut","mutual",.)
replace $x=subinword($x,"nat","national",.)
replace $x=subinword($x,"no","north",.)
replace $x=subinword($x,"pittsburg","pittsburgh",.)
replace $x=subinword($x,"provident","providence",.)
replace $x=subinword($x,"re insurance","reinsurance",.)
replace $x=subinword($x,"sav","savings",.)
replace $x=subinword($x,"savng","savings",.)
replace $x=subinword($x,"savngs","savings",.)
replace $x=subinword($x,"savins","savings",.)
replace $x=subinword($x,"savin","savings",.)
replace $x=subinword($x,"saving","savings",.)
replace $x=subinword($x,"securities","security",.)
replace $x=subinword($x,"soc","society",.)
replace $x=subinword($x,"sup court","supreme court",.)
replace $x=subinword($x,"trust title","title trust",.)
replace $x=subinword($x,"trading","traders",.)
replace $x=subinword($x,"tr","trust",.)
replace $x=subinword($x,"trut","trust",.)
replace $x=subinword($x,"trustees","trust",.)
replace $x=subinword($x,"trustee","trust",.)
replace $x=subinword($x,"us","united states",.)
replace $x=subinword($x,"u s a","us",.)
replace $x=subinword($x,"u s","us",.)
replace $x=subinword($x,"us a","us",.)
replace $x=subinword($x,"us","us",.)
replace $x=subinword($x,"usa","us",.)
replace $x=subinword($x,"and its vicinity","vicinity",.)
replace $x=subinword($x,"its vicinity","vicinity",.)
replace $x=subinword($x,"vicin","vicinity",.)
replace $x=subinword($x,"vic","vicinity",.)
replace $x=subinword($x,"assurance","insurance",.)
replace $x=subinword($x,"of the united states of america","",.)
replace $x=subinword($x,"indiana the county lycoming","",.)
replace $x=subinword($x,"indiana the town","",.)
replace $x=subinword($x,"indiana the towns","",.)
replace $x=subinword($x,"on the hudson","",.)
replace $x=subinword($x,"indiana town","",.)
replace $x=subinword($x,"united states","",.)
replace $x=subinword($x,"of us","",.)
replace $x=subinword($x,"savings ","",.)
replace $x=subinword($x,"supreme council","",.)
replace $x=subinword($x,"of city","",.)
replace $x=subinword($x,"the town","",.)
replace $x=subinword($x,"america","",.)
replace $x=subinword($x,"indiana","",.)
replace $x=subinword($x,"and","",.)
replace $x=subinword($x,"inc","",.)
replace $x=subinword($x,"the","",.)
replace $x=subinword($x,"the","",.)
replace $x=subinword($x,"company","",.)
replace $x=subinword($x,"branch","",.)
replace $x=subinword($x,"phila","",.)
replace $x=subinword($x,"at","",.)
replace $x=subinword($x,"of","",.)
replace $x=subinword($x,"for","",.)
replace $x=subinword($x,"","",.)
replace $x=subinword($x,"life","",.)
replace $x=subinword($x,"department","",.)
replace $x=subinword($x,"mutual","",.)
replace $x=subinword($x,"marine","",.)
replace $x=subinword($x,"indiana","",.)
replace $x=subinword($x,"vicinity","",.)
replace $x=subinword($x,"its","",.)
replace $x=subinword($x,"in","",.)
replace $x=subinword($x,"institution","",.)
replace $x=subinword($x,"institute","",.)
replace $x=subinword($x,"security","",.)
replace $x=subinword($x,"securities","",.)
replace $x=subinword($x,"insurance","",.)
replace $x=subinword($x,"trust","",.)
replace $x=subinword($x,"indemnity","",.)
replace $x=subinword($x,"accident","",.)
replace $x=subinword($x,"association","",.)
replace $x=subinword($x,"assurance","",.)
replace $x=subinword($x,"trustees","",.)
replace $x=subinword($x,"for","",.)
replace $x=subinword($x,"loss","",.)
replace $x=subinword($x,"by","",.)
replace $x=subinword($x,"society","",.)
replace $x=subinword($x,"fund","",.)
replace $x=subinword($x,"house","",.)
replace $x=subinword($x,"houses","",.)
replace $x=subinword($x,"location","",.)
replace $x=subinword($x,"title","",.)
replace $x=subinword($x,"deposit","",.)
replace $x=subinword($x,"discount","",.)
replace $x=subinword($x,"legion","",.)
replace $x=subinword($x,"union","",.)
replace $x=subinword($x,"surety","",.)
replace $x=subinword($x,"vounty","",.)
replace $x=subinword($x,"vicin","",.)
replace $x=subinword($x,"safe","",.)
replace $x=subinword($x,"savings","",.)
replace $x=subinword($x,"safe","",.)
replace $x=subinword($x,"deposit","",.)
replace $x=subinword($x,"liability","",.)
replace $x=subinword($x,"limited","",.)
replace $x=subinword($x,"home","",.)
replace $x=subinword($x,"commercial","",.)
replace $x=subinword($x,"state","",.)
replace $x=subinword($x,"america","",.)
replace $x=subinword($x,"annuity","",.)
replace $x=subinword($x,"league","",.)
replace $x=subinword($x,"the","",.)
replace $x=subinword($x,"on","",.)
replace $x=subinword($x,"fire","",.)
replace $x=subinword($x,"it","",.)
replace $x=subinword($x,"bank","",.)
replace $x=subinword($x,"national","",.)
replace $x=subinword($x,"us","",.)
replace $x=subinword($x,"county","",.)
replace $x=subinword($x,"city","",.)
replace $x=subinword($x,"st","",.)
replace $x=subinword($x,"us","",.)
replace $x=subinword($x,"guaranty","",.)
replace $x=subinword($x,"with","",.)
replace $x=subinword($x,"society","",.)
replace $x=subinword($x,"savings","",.)
replace $x=subinword($x,"loss","",.)
replace $x=subinword($x,"by","",.)
replace $x=subinword($x,"fund","",.)
replace $x=subinword($x,"trading","",.)
replace $x=subinword($x,"assurance","",.)
replace $x=subinword($x,"association","",.)
replace $x=subinword($x,"legion","",.)
replace $x=subinword($x,"league","",.)
replace $x=subinword($x,"insuring","",.)
replace $x=subinword($x,"house","",.)
replace $x=subinword($x,"houses","",.)
replace $x=subinword($x,"surety","",.)
replace $x=subinword($x,"casualty","",.)
replace $x=subinword($x,"from","",.)
replace $x=subinword($x,"the","",.)
replace $x=subinword($x,"insurance","",.)
replace $x=subinword($x,"loss","",.)
replace $x=subinword($x,"assurance","association",.)
replace $x=subinword($x,"canadian","canada",.)
replace $x=subinword($x,"california","canada",.)
replace $x=subinword($x,"commerce","commercial",.)
replace $x=subinword($x,"germania","german",.)
replace $x=subinword($x,"insurance","institution",.)
replace $x=subinword($x,"assurance","insurance",.)
replace $x=subinword($x,"merchant","mercantile",.)
replace $x=subinword($x,"mechanic","mercantile",.)
replace $x=subinword($x,"no","north",.)
replace $x=subinword($x,"provident","providence",.)
replace $x=subinword($x,"insurance","",.)
replace $x=subinword($x,"trust","",.)
replace $x=subinword($x,"fund","",.)
replace $x=subinword($x,"bank","",.)
replace $x=subinword($x,"savings ","",.)
replace $x=subinword($x,"life","",.)
replace $x=subinword($x,"indemnity","",.)
replace $x=subinword($x,"accident","",.)
replace $x=subinword($x,"loss","",.)
replace $x=subinword($x,"house","",.)
replace $x=subinword($x,"title","",.)
replace $x=subinword($x,"surety","",.)
replace $x=subinword($x,"liability","",.)
replace $x=subinword($x,"home","",.)
replace $x=subinword($x,"annuity","",.)
replace $x=subinword($x,"fire","",.)
replace $x=subinword($x,"guaranty","",.)
replace $x=subinword($x,"loss","",.)
replace $x=subinword($x,"casualty","",.)
replace $x=subinword($x,"mutual","",.)
replace $x=subinword($x,"marine","",.)
replace $x=subinword($x,"deposit","",.)
replace $x=subinword($x,"discount","",.)
replace $x=subinword($x,"safe","",.)
replace $x=subinword($x,"commercial","",.)
replace $x=subinword($x,"limited","",.)
replace $x=subinword($x,"security","",.)
replace $x=subinword($x,"indiana the county lycoming","",.)
replace $x=subinword($x,"of the united states of america","",.)
replace $x=subinword($x,"of united states","",.)
replace $x=subinword($x,"united states$","",.)
replace $x=subinword($x,"united states","",.)
replace $x=subinword($x,"america","",.)
replace $x=subinword($x,"the","",.)
replace $x=subinword($x,"in","",.)
replace $x=subinword($x,"city","",.)
replace $x=subinword($x,"and","",.)
replace $x=subinword($x,"at","",.)
replace $x=subinword($x,"of","",.)
replace $x=subinword($x,"for","",.)
replace $x=subinword($x,"indiana","",.)
replace $x=subinword($x,"its","",.)
replace $x=subinword($x,"institution","",.)
replace $x=subinword($x,"by","",.)
replace $x=subinword($x,"on","",.)
replace $x=subinword($x,"it","",.)
replace $x=subinword($x,"us","",.)
replace $x=subinword($x,"st","",.)
replace $x=subinword($x,"with","",.)
replace $x=subinword($x,"on","",.)
replace $x=subinword($x,"department","",.)
replace $x=subinword($x,"association","",.)
replace $x=subinword($x,"legion","",.)
replace $x=subinword($x,"union","",.)
replace $x=subinword($x,"league","",.)
replace $x=subinword($x,"national","",.)
replace $x=subinword($x,"county","",.)
replace $x=subinword($x,"city","",.)
replace $x=subinword($x,"town","",.)
replace $x=subinword($x,"supreme council","",.)
replace $x=subinword($x,"indiana","",.)
replace $x=subinword($x,"vicinity","",.)
replace $x=subinword($x,"society","",.)
replace $x=subinword($x,"location","",.)
replace $x=subinword($x,"county","",.)
replace $x=subinword($x,"vicin","",.)
replace $x=subinword($x,"state","",.)
replace $x=subinword($x,"township","",.)
replace $x=subinword($x,"union","",.)
replace $x=subinword($x,"exchange","",.)
replace $x=subinword($x,"secured","",.)
replace $x=subinword($x,"upper lower sancon","",.)
replace $x=subinword($x,"office","",.)
replace $x=strtrim($x)
replace $x=stritrim($x)

gen investor_city_use=cond(investor_city_2!="",investor_city_2,investor_city_1)
gen investor_state_use=cond(investor_state_2!="",investor_state_2,investor_state_1)
cap drop group_dummy
egen group_dummy=group(investor_city_use investor_type_temp $x)
egen group_inv_state=group(investor_state_use investor_type_temp $x)
egen group_inv_nontype=group(investor_city_use $x)
*bysort investor_city_use investor_type_temp: strgroup $x, gen(group_dummy) thresh(1) norm(none) force
*drop investor_city_use
rename invname_hold_temp inv
cd "$root_dta"
save tempc_2,replace

*use tempc_1, clear
merge 1:1 id using tempc_1, gen(merge_dummy)
cap drop _merge
sort investor_city_temp group_dummy
cap drop inv

erase tempc_1.dta
erase tempc_2.dta
label var group_dummy "Group id for investor name"
cap drop group_investor
rename group_dummy group_investor
cap drop id
cap drop merge_dummy

cap drop id_investor
cap gen investor_city_use=cond(investor_city_2!="",investor_city_2,investor_city_1)
replace group_investor=0 if group_investor==.
cap drop invuse id_investor
gen invuse=cond(group_investor==0,invname_hold_temp,"0")
egen id_investor_temp=group(group_investor invuse)
egen id_investor_city=group(group_investor invuse investor_city_use investor_type_temp)
egen id_investor_state=group(group_inv_state invuse investor_state_use investor_type_temp)

cap drop investor_city_use
cd "$root_dta"
save temp_dummy1.dta, replace

*Issuer
gen id=_n
sort id
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
replace cname_hold_temp=regexr(cname_hold_temp,"extension","")
replace cname_hold_temp=regexr(cname_hold_temp,"division","")
replace cname_hold_temp=regexr(cname_hold_temp,"omaha[ ]?$","")

global x="cname_hold_temp"
cd "D:\Dropbox\Bond Rating\Code and Data\do"
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
replace cname_hold_temp=regexr(cname_hold_temp," and$","")
replace cname_hold_temp=regexr(cname_hold_temp,"bank of$","")
*drop if cname_hold_temp==""
cap drop group_str
egen group_str=group(cname_hold_temp issuer_loc_temp)
sort id
cd "$root_dta"
rename cname_hold_temp cop
*save tempc_2.dta,replace
merge 1:1 id using tempc_1.dta, gen(merge_str) 
cap drop _merge
cap drop cop
cap drop merge_str id
/*duplicates drop cname_hold_temp,force
*cap drop count_str
*duplicates tag group_str, gen(count_str)
*replace count_str=0 if count_str>300
*gsort -count_str group_str
*browse cname_hold_temp count_str group_str if count_str==0 & count_par==0 & count_par2==0 & count_geo==0 & count_geo2==0
//browse cname_hold_temp if strpos(cname_hold_temp,"rail") & !strpos(cname_hold_temp,"railroad") & !strpos(cname_hold_temp,"railway") //if wordc==1


sort cname_hold_temp
cap drop temp 
cap drop id
cap drop first_word
save temp.dta, replace

use temp_dummy1.dta, clear
merge m:n cname_hold_temp using temp.dta
drop merge* _merge
cap drop *_1st
cap drop countt_str
*/

label var group_str "Index for matches removing(), words, and geographic and match"
replace cname_hold_temp=cname_hold_temp+" stock" if regexm(cname_hold_orig,"STOCK COMPANY$") & !regexm(cname_hold_temp,"stock$")

rename group_str group_issuer
label var group_issuer "Index for matches removing(), words, and geographic and match"
replace group_issuer=0 if group_issuer==.
gen cuse=cond(group_issuer==0,cname_hold_temp,"0")
egen id_issuer=group(group_issuer cuse issuer_loc_temp)

cd "$root_dta"

save temp_coupon.dta, replace
cap drop id

* Coupon
cd "$root_dta"
use temp_coupon.dta, clear
drop if industry=="Government"
duplicates drop cname_hold_temp coupon_hold_temp, force
rename coupon_hold_temp coupon1
keep cname_hold_temp coupon1
save temp1.dta, replace

rename coupon1 coupon_std
joinby cname_hold_temp using temp1.dta

replace coupon_std=";"+coupon_std+";"
replace coupon_std=subinstr(coupon_std,"&",";&;",.)
replace coupon_std=subinstr(coupon_std,"/",";/;",.)
replace coupon_std="" if coupon_std==";n;/;a;"

replace coupon1=";"+coupon1+";"
replace coupon1=subinstr(coupon1,"&",";&;",.)
replace coupon1=subinstr(coupon1,"/",";/;",.)
replace coupon1="" if coupon1==";n;/;a;"

split coupon1, parse("&" "/" "-") gen(cop)

gen cop_min=cop1 if strpos(coupon_std,"-")
gen cop_max=cop1 if strpos(coupon_std,"-")

forv i=2/5{
	replace cop_max=cop`i' if strpos(coupon_std,"-") & cop_max!=""
}


cap drop group_coupon
gen group_coupon=1

forv i=1/5{
	replace cop`i'=coupon_std if cop`i'==""
	replace group_coupon=0 if !strpos(coupon_std,cop`i')
	replace group_coupon=1 if cop`i'<=cop_max & cop`i'>=cop_min & strpos(coupon_std,"-")
}

*Notice that we have to recheck the cases like "3 & 5-6", then min_max will be 3 & 6 which is not correct
replace coupon_std=subinstr(coupon_std,";","",.)
replace coupon1=subinstr(coupon1,";","",.)
replace group_coupon=0 if coupon1==""
*replace group_coupon=0 if coupon1==coupon_std
*rename coupon_std coupon_hold_temp
cap drop cop*

sort cname_hold_temp coupon_std
keep if group_coupon==1 
by cname_hold_temp: gen x=_n
rename coupon1 coupon
reshape wide coupon, i(cname_hold_temp coupon_std) j(x)
by cname_hold_temp: gen x=_n
save temp1.dta, replace

use temp_coupon.dta, clear
keep if industry~="Government"
keep cname_hold_temp coupon_hold_temp
duplicates drop cname_hold_temp coupon_hold_temp, force
egen id_coupon=group(cname_hold_temp coupon_hold_temp)
cap drop _merge
joinby cname_hold_temp using temp1.dta, unmatched(master)
egen id_coupon_std=group(cname_hold_temp coupon_std)

cap drop group_coupon_mst
gen group_coupon_mst=.
forv i=1/19{
	replace group_coupon_mst=id_coupon_std if coupon_hold_temp==coupon`i'
}
keep cname_hold_temp coupon_hold_temp group_coupon_mst
drop if group_coupon_mst==.
duplicates tag cname_hold_temp coupon_hold_temp, gen(temp2)
gsort -temp2 cname_hold_temp coupon_hold_temp
tostring group_coupon_mst, replace
cap drop group_cop
duplicates tag group_coupon_mst, gen(co)
drop if co==0
gen group_cop=group_coupon_mst
bysort cname_hold_temp coupon_hold_temp: replace group_cop=group_cop[_n-1]+"/"+group_coupon_mst
replace group_cop=regexr(group_cop,"^(/)","")
keep cname_hold_temp coupon_hold_temp group_cop
rename group_cop group_coupon
gsort cname_hold_temp coupon_hold_temp -group_coupon
duplicates drop cname_hold_temp coupon_hold_temp, force

save temp2.dta,replace

use temp_coupon.dta, clear
sort cname_hold_temp coupon_hold_temp
cap drop _merge
merge m:1 cname_hold_temp coupon_hold_temp using temp2.dta
cap drop _merge
egen id_coupon_temp=group(cname_hold_temp coupon_hold_temp) if group_coupon==""
replace id_coupon_temp=cond(id_coupon_temp==.,0,id_coupon_temp)
replace group_coupon=cond(group_coupon=="","0",group_coupon)
replace group_coupon="9999"+group_coupon if group_coupon!="0"
replace group_coupon=subinstr(group_coupon,"/","/9999",.)
egen id_coupon=group(id_coupon_temp group_coupon)
tostring id_coupon, replace
replace id_coupon=group_coupon if group_coupon!="0"
cap drop group_coupon id_coupon_temp co

save temp_dummy.dta, replace


*Maturity
cd "$root_dta"
use temp_dummy.dta, clear
drop if industry=="Government"
replace maturity_hold_temp=regexr(maturity_hold_temp,"opt [0-9][0-9][0-9][0-9]([\-][0-9][0-9][0-9][0-9])*","")
duplicates drop cname_hold_temp maturity_hold_temp, force
rename maturity_hold_temp maturity1
keep cname_hold_temp maturity1
save temp1.dta, replace

rename maturity1 maturity_std
joinby cname_hold_temp using temp1.dta
/*
replace maturity_std=";"+maturity_std+";"
replace maturity_std=subinstr(maturity_std,"&",";&;",.)
replace maturity_std=subinstr(maturity_std,"/",";/;",.)
replace maturity_std="" if maturity_std==";n;/;a;"

replace maturity1=";"+maturity1+";"
replace maturity1=subinstr(maturity1,"&",";&;",.)
replace maturity1=subinstr(maturity1,"/",";/;",.)
replace maturity1="" if maturity1==";n;/;a;"
*/
replace maturity_std="" if maturity_std=="n/a"
replace maturity1="" if maturity1=="n/a"
split maturity1, parse("&" "/" "-") gen(matr)

split maturity_std,gen(may) parse("&" "/" "-")

gen matr_min=may1 if strpos(maturity_std,"-")
gen matr_max=may1 if strpos(maturity_std,"-")
destring matr_min,replace
destring matr_max,replace

forv i=2/6{
	destring may`i', replace
	replace matr_max=may`i' if strpos(maturity_std,"-") & may`i'>matr_max & may`i'!=.
	replace matr_min=may`i' if strpos(maturity_std,"-") & may`i'<matr_min & may`i'!=.
}

cap drop group_maturity
gen group_maturity=1

forv i=1/6{
	replace group_maturity=0 if !strpos(maturity_std,matr`i') & matr`i'!=""
	destring matr`i', replace
	replace group_maturity=1 if matr`i'<=matr_max & matr`i'>=matr_min & strpos(maturity_std,"-") & matr`i'!=.
}

/*forv i=1/6{
	destring matr`i', replace
	replace group_maturity=1 if matr`i'<=matr_max & matr`i'>=matr_min & strpos(maturity_std,"-") & matr`i'==.
}

replace maturity_std=subinstr(maturity_std,";","",.)
replace maturity1=subinstr(maturity1,";","",.)
*/
replace group_maturity=0 if maturity1==""
*replace group_maturity=0 if maturity1==maturity_std
*rename maturity_std maturity_hold_temp
cap drop matr*
cap drop may*

sort cname_hold_temp maturity_std
keep if group_maturity==1
cap drop x 
by cname_hold_temp maturity_std: gen x=_n
rename maturity1 maturity
reshape wide maturity, i(cname_hold_temp maturity_std) j(x)
by cname_hold_temp: gen x=_n
save temp1.dta, replace

use temp_dummy.dta, clear
keep if industry~="Government"
keep cname_hold_temp maturity_hold_temp
duplicates drop cname_hold_temp maturity_hold_temp, force
egen id_maturity=group(cname_hold_temp maturity_hold_temp)
cap drop _merge
joinby cname_hold_temp using temp1.dta, unmatched(master)
egen id_maturity_std=group(cname_hold_temp maturity_std)

cap drop group_maturity_mst
gen group_maturity_mst=.
forv i=1/51{
	replace group_maturity_mst=id_maturity_std if maturity_hold_temp==maturity`i'
}
keep cname_hold_temp maturity_hold_temp group_maturity_mst
drop if group_maturity_mst==.
duplicates tag cname_hold_temp maturity_hold_temp, gen(temp2)
gsort -temp2 cname_hold_temp maturity_hold_temp
tostring group_maturity_mst, replace
cap drop group_matr
duplicates tag group_maturity_mst, gen(co)
drop if co==0
gen group_matr=group_maturity_mst
bysort cname_hold_temp maturity_hold_temp: replace group_matr=group_matr[_n-1]+"/"+group_maturity_mst
replace group_matr=regexr(group_matr,"^(/)","")
keep cname_hold_temp maturity_hold_temp group_matr
rename group_matr group_maturity
gsort cname_hold_temp maturity_hold_temp -group_maturity
duplicates drop cname_hold_temp maturity_hold_temp, force

save temp2.dta,replace

use temp_dummy.dta, clear
sort cname_hold_temp maturity_hold_temp
cap drop _merge
merge m:1 cname_hold_temp maturity_hold_temp using temp2.dta
cap drop _merge
egen id_maturity_temp=group(cname_hold_temp maturity_hold_temp) if group_maturity==""
replace id_maturity_temp=cond(id_maturity_temp==.,0,id_maturity_temp)
replace group_maturity=cond(group_maturity=="","0",group_maturity)
replace group_maturity="9999"+group_maturity if group_maturity!="0"
replace group_maturity=subinstr(group_maturity,"/","/9999",.)
egen id_maturity=group(id_maturity_temp group_maturity)
tostring id_maturity, replace
replace id_maturity=group_maturity if group_maturity!="0"
cap drop group_maturity 
cap drop id_maturity_temp 
cap drop co
save temp3.dta, replace
keep id_maturity 
keep if strpos(id_maturity,"/")
duplicates drop id_maturity,force
split id_maturity, gen(mtr) parse("/")
reshape long mtr, i(id_maturity) j(x)
destring mtr,replace
sort id_maturity mtr
tostring mtr,replace
cap drop x
bysort id_maturity: gen x=_n
reshape wide mtr, i(id_maturity) j(x)
gen id_mtr=mtr1
cap drop mtr1
forv i=2/31{
replace id_mtr=id_mtr+"/"+mtr`i' if mtr`i'!="."
drop mtr`i'
}
cap drop _merge
merge 1:m id_maturity using temp3.dta
cap drop _merge
replace id_maturity=id_mtr if id_mtr!="" & strpos(id_maturity,"/")


*Issue
cap drop id_issue id_issue_d
egen id_issue=group(cname_hold_temp coupon_hold_temp maturity_hold_temp issuer_loc_temp collateral_temp class_type stock_type_temp)
egen id_issue_d=group(id_issuer id_coupon id_maturity issuer_loc_temp collateral_temp class_type stock_type_temp)
saveold Holdings_Data_Dummy.dta, replace


use Holdings_Data_Dummy.dta, clear
cd "$root_dta"
//gen id2=id_issue
//sort id2
save temp2.dta,replace

set more off
use temp2.dta,clear
duplicates drop id_issue, force
egen id=group(id_issuer id_coupon issuer_loc_temp collateral_temp class_type stock_type_temp)

duplicates tag id_issue_d, gen(dup_0)
split id_coupon, parse("/") gen(cop)
split id_maturity, parse("/") gen(matr)
gen id_cop_use=id_coupon
gen id_matr_use=id_maturity
forv i=1/3{
	replace id_cop_use=cop`i' if cop`i'!=""
	forv j=1/10{
		replace id_matr_use=matr`j' if matr`j'!=""
		egen id_issue`i'`j'=group(id_issuer id_cop_use id_matr_use issuer_loc_temp collateral_temp class_type stock_type_temp)
		duplicates tag id_issue`i'`j', gen(dup_`i'`j')
	}
}

gen pos = . 
gen max = dup_0
gen min = dup_0 
tokenize "11 12 13 14 15 16 17 18 19 110 21 22 23 24 25 26 27 28 29 210 31 32 33 34 35 36 37 38 39 310" 

forval j = 1/30 { 
	replace pos = ``j'' if dup_``j'' > max & dup_``j'' < .
	replace max = dup_``j'' if dup_``j'' > max & dup_``j'' < . 
}

gen id_issue_std=id_issue_d
forval j = 1/30{
	replace id_issue_std=10000000+id_issue``j'' if pos==``j''
}

format id_issue_std %10.0f
//browse cname_hold_temp maturity_hold_temp coupon_hold_temp id_issue_std book_year_hold id_maturity if pos!=.
sort id_issue
/*
save temps.dta, replace
use temp2.dta, clear
sort id_issue
merge m:n id_issue using temps.dta
*/

keep id_issue id_issue_std
cap drop _merge
merge 1:m id_issue using temp2.dta
cap drop _merge //id2

rename id_issue id1
rename id_issue_d id2
rename id_issue_std id3
rename id_issuer id4

cap drop cop* matr* dup_* id_issue* pos max min _merge 
cap drop id id_cop_use id_matr_use

rename id1 id_issue 
rename id2 id_issue_d 
rename id3 id_issue_std
rename id4 id_issuer
/*
//duplicates drop id_issuer id_coupon issuer_loc_temp collateral_temp class_type stock_type_temp, force

reshape long dup_, i(id) j(y)
bysort id_issuer id_coupon issuer_loc_temp collateral_temp class_type stock_type_temp: egen max=max(dup_)
bysort id_issuer id_coupon issuer_loc_temp collateral_temp class_type stock_type_temp: egen min=min(dup_)

duplicates drop id dup_, force
save temp1.dta, replace
use temp1.dta,clear
gen n=cond(max==dup_,y,0)
bysort id: egen nn=max(n)
gen id_issue_std=id_issue_d

foreach i of numlist 11/18 21/26 31{
	replace id_issue_std=10000000+id_issue`i' if nn==`i'
}

cap drop _merge	
merge m:n id_issuer id_coupon issuer_loc_temp collateral_temp class_type stock_type_temp using temp2.dta
*/
label var id_investor_city "group id for investor on city investor type"
label var id_investor_state "group id for investor on city investor type"
label var id_issuer "group id for issuer on issuer location"
label var id_coupon "group id for coupon on issuer name"
label var id_maturity "group id for maturity on issuer name"
label var id_issue "group id for issue on original variable"
label var id_issue_d "group id for issue on group id (ex.id_issuer not cname)"

//save temp_dummy.dta, replace

foreach i in "investor_state_use" "group_issuer" "group_inv_state" "invuse" "cuse" "group_coupon" "group_maturity" "investor_city_use" "id_investor_temp" "group_inv_nontype" "id_inv_nontype" "group_investor"{
cap drop `i'
}

cap drop tag_value
cap gen tag_value=""
replace tag_value="book value" if strpos(book_value_hold, "Y")|strpos(book_value_hold, "y")
replace tag_value="par value" if (strpos(book_value_hold, "N")|book_value_hold=="") & mod(par_value_temp,1000)==0
replace tag_value="market value" if (strpos(book_value_hold, "N")|book_value_hold=="") & !mod(par_value_temp,1000)==0

order invname_hold_orig investor_id investor_name_master_match3 firm_id_holdings issue_id_holdings cname_hold_orig cname_hold_clean book_year_hold stock_type_hold coupon_hold min_coupon_hold max_coupon_hold /*
*/maturity_year_hold min_mat_year_hold max_mat_year_hold class_hold investor_city_hold investor_state_hold investor_region1_final_hold investor_region2_final_hold par_value_clean_hold book_value_hold comments_hold/*
*/ investor_type nyse_bond_issuer_id industry cname_hold_temp group_rrry count_rrry group_par count_par group_par2 count_par2 group_geo count_geo group_geo2 count_geo2 invname_hold_temp investor_state_temp /*
*/investor_state_1 investor_state_2 dummy_investor_state_1 dummy_investor_state_2 investor_city_temp investor_city_1 investor_city_2 dummy_investor_city_1 dummy_investor_city_2 coupon_hold_temp maturity_hold_temp/*
*/ class_hold_temp par_value_temp stock_type_temp tag_class issuer_loc_temp collateral_temp class_type is_bond is_stock

cap drop industry_temp
cap gen industry_temp=industry
replace industry_temp="Railway Railroad" if industry=="Street Railway"|industry=="Steam Railroad"
cap gen investor_city_use=cond(investor_city_2!="",investor_city_2,investor_city_1)
cap gen investor_state_use=cond(investor_state_2!="",investor_state_2,investor_state_1)
cap gen dummy_investor_city_use=cond(dummy_investor_city_2!=.,dummy_investor_city_2,dummy_investor_city_1)
cap gen dummy_investor_state_use=cond(dummy_investor_state_2!=.,dummy_investor_state_2,dummy_investor_state_1)


replace industry="Steam Railroad" if industry=="Bank and Trust" & book_year_hold==1913
replace industry="Industrial and Misc" if industry=="Bank and Trust" & book_year_hold==1911

/*
use trial.dta, clear
*/
gen x=_n
tempfile t
save "`t'"
drop if industry=="Government"

gen maturity_std=maturity_hold_temp
replace maturity_std="" if maturity_std=="n/a"
split maturity_std,gen(may) parse("&" "/" "-")
replace may1=subinword(may1,"opt","",.)
replace may1=strtrim(may1)
replace may1=stritrim(may1)
gen matr_min=may1
gen matr_max=may1
destring matr_min,replace
destring matr_max,replace


forv i=2/6{
	replace may`i'=subinword(may`i',"opt","",.)
	replace may`i'=strtrim(may`i')
	replace may`i'=stritrim(may`i')
	destring may`i', replace
	replace matr_max=may`i' if may`i'>matr_max & may`i'!=.
	replace matr_min=may`i' if may`i'<matr_min & may`i'!=. 
}
cap drop maturity_std
cap drop _merge
merge 1:1 x using "`t'"
cap drop may*
cap drop _merge x
cap drop maturity_max maturity_min
rename matr_max maturity_max
rename matr_min maturity_min

saveold Holdings_Data_Dummy.dta, replace
