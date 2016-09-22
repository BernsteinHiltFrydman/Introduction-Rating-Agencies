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
merge m:n id using tempc_1, gen(merge_dummy)
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
merge m:n id using tempc_1.dta, gen(merge_str) 
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
merge m:n cname_hold_temp coupon_hold_temp using temp2.dta
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
duplicates drop cname_hold_temp maturity_hold_temp, force
rename maturity_hold_temp maturity1
keep cname_hold_temp maturity1
save temp1.dta, replace

rename maturity1 maturity_std
joinby cname_hold_temp using temp1.dta

replace maturity_std=";"+maturity_std+";"
replace maturity_std=subinstr(maturity_std,"&",";&;",.)
replace maturity_std=subinstr(maturity_std,"/",";/;",.)
replace maturity_std="" if maturity_std==";n;/;a;"

replace maturity1=";"+maturity1+";"
replace maturity1=subinstr(maturity1,"&",";&;",.)
replace maturity1=subinstr(maturity1,"/",";/;",.)
replace maturity1="" if maturity1==";n;/;a;"

split maturity1, parse("&" "/" "-") gen(matr)

gen matr_min=matr1 if strpos(maturity_std,"-")
gen matr_max=matr1 if strpos(maturity_std,"-")

forv i=2/6{
	replace matr_max=matr`i' if strpos(maturity_std,"-") & matr_max!=""
}


cap drop group_maturity
gen group_maturity=1

forv i=1/6{
	replace matr`i'=maturity_std if matr`i'==""
	replace group_maturity=0 if !strpos(maturity_std,matr`i')
	replace group_maturity=1 if matr`i'<=matr_max & matr`i'>=matr_min & strpos(maturity_std,"-")
}

*Notice that we have to recheck the cases like "3 & 5-6", then min_max will be 3 & 6 which is not correct
replace maturity_std=subinstr(maturity_std,";","",.)
replace maturity1=subinstr(maturity1,";","",.)
replace group_maturity=0 if maturity1==""
*replace group_maturity=0 if maturity1==maturity_std
*rename maturity_std maturity_hold_temp
cap drop matr*

sort cname_hold_temp maturity_std
keep if group_maturity==1 
by cname_hold_temp: gen x=_n
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
forv i=1/102{
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
merge m:n cname_hold_temp maturity_hold_temp using temp2.dta
cap drop _merge
egen id_maturity_temp=group(cname_hold_temp maturity_hold_temp) if group_maturity==""
replace id_maturity_temp=cond(id_maturity_temp==.,0,id_maturity_temp)
replace group_maturity=cond(group_maturity=="","0",group_maturity)
replace group_maturity="9999"+group_maturity if group_maturity!="0"
replace group_maturity=subinstr(group_maturity,"/","/9999",.)
egen id_maturity=group(id_maturity_temp group_maturity)
tostring id_maturity, replace
replace id_maturity=group_maturity if group_maturity!="0"
cap drop group_maturity id_maturity_temp co


*Issue
egen id_issue=group(cname_hold_temp coupon_hold_temp maturity_hold_temp issuer_loc_temp collateral_temp class_type)
egen id_issue_d=group(id_issuer id_coupon id_maturity issuer_loc_temp collateral_temp class_type)



label var id_investor_city "group id for investor on city investor type"
label var id_investor_state "group id for investor on city investor type"
label var id_issuer "group id for issuer on issuer location"
label var id_coupon "group id for coupon on issuer name"
label var id_maturity "group id for maturity on issuer name"
label var id_issue "group id for issue on original variable"
label var id_issue_d "group id for issue on group id (ex.id_issuer not cname)"

*save temp_dummy.dta, replace

foreach i in "invuse" "cuse" "group_coupon" "group_maturity" "investor_city_use" "id_investor_temp" "group_inv_nontype" "id_inv_nontype" "group_investor"{
cap drop `i'
}

saveold Holdings_Data_Dummy.dta, replace

/*This part turns out to be very trivial (less than 30 observations) and easy to make mistake
*Issue revise id_coupon id_maturity
gen id_c=id_coupon
gen id_m=id_maturity
replace id_coupon=regexr(id_c,"(/)[0-9]+","")
replace id_maturity=regexr(id_m,"(/)[0-9]+","")
egen id_issue_d1=group(id_issuer id_coupon id_maturity issuer_loc_temp collateral_temp class_type)

replace id_coupon=regexr(id_c,"[0-9]+(/)","")
replace id_maturity=regexr(id_m,"[0-9]+(/)","")
egen id_issue_d2=group(id_issuer id_coupon id_maturity issuer_loc_temp collateral_temp class_type)

cap drop id_coupon id_maturity
rename id_c id_coupon
rename id_m id_maturity

duplicates tag id_issue_d, gen(c1)
duplicates tag id_issue_d1, gen(c2)
duplicates tag id_issue_d2, gen(c3)
gen k=cond((c1==c2 & c2==c3),1,0)
browse id_issue_* cname_hold_temp coupon_hold_temp maturity_hold_temp group_coupon if k==0
bysort cname_hold_temp coupon_hold_temp: gen x2=_n
reshape wide group_coupon_mst, i(cname_hold_temp coupon_hold_temp) j(x2)

gen group_coupon=""
forv i=1/9{
	tostring group_coupon_mst`i',replace
	replace group_coupon=group_coupon+"/"+group_coupon_mst`i' if group_coupon_mst`i'!=""
}

replace group_coupon=subinstr(group_coupon,"/.","",.)
replace group_coupon=subinstr(group_coupon,".","",.)
replace group_coupon=regexr(group_coupon,"^(/)","")

/*Coupon & Maturity & Industry
cd "$root_data"
use temp_coupon.dta, clear
cap gen industry_temp=industry
replace industry_temp="RRRY" if industry=="Steam Railroad" & industry=="Street Railway"

save temp_coupon.dta, replace

cd "$root_data"
use temp_coupon.dta, clear
drop if industry=="Government"
gen maturity=regexr(maturity_hold_temp,"opt [0-9][0-9][0-9][0-9]","")
replace maturity="" if maturity=="n/a"
replace maturity=strtrim(maturity)
replace maturity=stritrim(maturity)
split maturity, gen(mat) parse("-" "&" "/")
destring mat*, replace

gen maturity_min=mat1
gen maturity_max=mat1

forv i=2/6{
replace maturity_max=mat`i' if mat`i'!=.
}

gen coupon=cond(coupon_hold_temp=="n/a","",coupon_hold_temp)

split coupon, gen(cop) parse("-" "&" "/")
destring cop*,replace

gen coupon_min=cop1
gen coupon_max=cop1

forv i=2/5{
replace coupon_max=cop`i' if cop`i'!=.
}

drop mat1 mat2 mat3 mat4 mat5 mat6 cop1 cop2 cop3 cop4 cop5 


*******
duplicates drop cname_hold_temp coupon_hold_temp, force
replace coupon_hold_temp=";"+coupon_hold_temp+";"
replace coupon_hold_temp=subinstr(coupon_hold_temp,"&",";&;",.)
replace coupon_hold_temp=subinstr(coupon_hold_temp,"/",";/;",.)
drop if coupon_hold_temp==";n;/;a;"
*ssc install egenmore
egen leng_temp=noccur(coupon_hold_temp), string(";")
gsort cname_hold_temp -leng_temp coupon_min
by cname_hold_temp: gen x=_n
bysort cname_hold_temp: egen max_temp=max(x)
gsort -max_temp cname_hold_temp -leng_temp
browse cname_hold_temp coupon_hold_temp x
gen group_c=0
forv i=1/x{
replace group_c=x if 
}


forv i=1/
*******

gen maturity_maxmin=maturity_max-maturity_min
gen coupon_maxmin=coupon_max-coupon_min
gsort cname_hold_temp -maturity_maxmin maturity
duplicates drop cname_hold_temp coupon_hold_temp, force 
bysort cname_hold_temp: egen co=count(coupon_hold_temp) if strpos(coupon_hold_temp,"&")|strpos(coupon_hold_temp,"/")|strpos(coupon_hold_temp,"-")

gsort -co cname_hold_temp -coupon_maxmin
browse co cname_hold_temp coupon_maxmin coupon_hold_temp if coupon_maxmin<0
