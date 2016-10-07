clear
set more off
global root_dta="D:\Dropbox\Bond Rating\Code and Data\dta"
cd "$root_dta"
import excel using Moodys_1909_Bond_Ratings.xlsx, sheet("Sheet1") first

cap rename Division division
gen parent_use=lower(parent)
replace parent_use=subinstr(parent_use,".","",.)
gen issuer_temp=lower(issuer_name)

*abbreviations
replace issuer_temp=subinword(issuer_temp,"cent.","central",.)
replace issuer_temp=subinword(issuer_temp,"chic.","chicago",.)

*extract division info
gen division_2=regexs(0) if regexm(issuer_temp," [a-z]+(\.)? div\.( \& term[.])?")


split parent_use,gen(prt)
split issuer_temp, gen(iss)
gen prt=""
gen iss=""
forv i=1/8{
replace prt`i'=substr(prt`i',1,1)
replace prt=prt+prt`i'
cap drop prt`i'
}
replace prt=regexr(prt,"r$","") if regexm(parent,"RAILROAD|RAILWAY")
replace prt=regexr(prt,"c$","") if regexm(parent,"COMPANY")
replace prt=subinstr(prt,"&","",.)
forv i=1/11{
replace iss`i'=substr(iss`i',1,1)
replace iss=iss+iss`i'
cap drop iss`i'
}
replace iss=subinstr(iss,"&","",.)
replace issuer_temp=parent_use if strpos(prt,iss)|strpos(iss,prt)
/*
browse parent issuer_name issuer_temp if strpos(prt,iss)|strpos(iss,prt)

rename class class_hold
gen class_hold_temp=class_hold
//save trial4.dta, replace

*/



/*****************************************************************************
The 2nd part, without division name
*****************************************************************************/
/*
use trial.dta,clear
keep if book_year_hold==1908
drop if industry=="Government"
sort cname_hold_temp
gen use=_n
save temp.dta, replace
*/
use tempm.dta, clear
cap drop max min ct dup strgrp
//cap drop cname_issuer mst ucname_issuer cname_iss_temp rec_scr
replace division=division_temp if division_temp!=""

gen cname_hold_temp= ucname_issuer_temp
replace cname_hold_temp=cname_issuer if cname_hold_temp==""

gen cname_copy=cname_hold_temp
replace cname_hold_temp=lower(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=subinword(cname_hold_temp,"calif.","california",.)
replace cname_hold_temp=subinword(cname_hold_temp,"pcf.","pacific",.)
replace cname_hold_temp=subinword(cname_hold_temp,"r.i.","rhode island",.)
replace cname_hold_temp=subinword(cname_hold_temp,"wis.","wisconsin",.)
replace cname_hold_temp=subinword(cname_hold_temp,"ill.","illinois",.)
replace cname_hold_temp=subinword(cname_hold_temp,"phila.","philadelphia",.)
replace cname_hold_temp=subinword(cname_hold_temp,"balt.","baltimore",.)
replace cname_hold_temp=subinword(cname_hold_temp,"p'burg","pittsburg",.)
replace cname_hold_temp=subinword(cname_hold_temp,"devel.","development",.)
replace cname_hold_temp=subinword(cname_hold_temp,"imp.","improvement",.)
replace cname_hold_temp=subinword(cname_hold_temp,"st. l.","st. louis",.)
replace cname_hold_temp=subinword(cname_hold_temp,"&","and",.)
//replace cname_hold_temp=regexr(cname_hold_temp,"railroad","r. r.") if !regexm(cname_hold_temp,"railroad$")
//replace cname_hold_temp=subinword(cname_hold_temp,"railway","",.)
//replace cname_hold_temp=subinword(cname_hold_temp,"railroad","",.)

replace cname_issuer=cname_issuer+" "+division if !strpos(cname_issuer,division)
sort cname_hold_temp
cap drop mst
gen mst=_n

merge 1:1 mst using temp_use.dta, update
replace cname_hold_temp=ucname_2 if _merge==3
cap drop _merge mst cname_copy mg ucname_issuer_temp ucname_issuer cname_iss_temp cname_issuer division_temp
cap drop rec_scr issuer ucname_2 rec_scr2
gen class_temp=class
replace class_temp=class+" "+class_2 if class_2!=""
replace class_temp=strtrim(class_temp)
replace class_temp=stritrim(class_temp)
cap drop class_2
label division "railway division from issuer_name"
label cname_hold_temp "matched issuer name from holding data"

/*

keep if mg==1
reclink2 cname_hold_temp using temp.dta, idm(mst) idu(use) gen(rec_scr2)

keep cname_hold_temp Ucname_hold_temp rec_scr2 mst
duplicates drop

gsort mst -rec_scr2
bysort mst: gen x=_n
drop if x>4

order cname_hold_temp Ucname_hold_temp rec_scr2 

/*****************************************************************************
The 3rd part, lower the reclink criteria to get higher matching result
*****************************************************************************/
clear
set more off
global root_dta="D:\Dropbox\Bond Rating\Code and Data\dta"
cd "$root_dta"
use Holdings_Data_Dummy.dta,clear
drop if is_stock==1
keep if industry_temp=="Railway Railroad"
keep if book_year_hold==1908
cap gen use=_n
gen cname_issuer=cname_hold_temp
replace cname_issuer=cname_issuer+" "+class_hold_temp if tag_class==3
replace cname_issuer=strtrim(cname_issuer)
replace cname_issuer=stritrim(cname_issuer)
sort cname_issuer
cap drop _merge
save temp_rec1908.dta, replace

clear
import excel using Moodys_1909_Bond_Ratings_2.xlsx, sheet("Sheet3") first
gen issuer=issuer_temp
rename division_2 division
replace issuer_temp=strtrim(issuer_temp)
replace issuer_temp=stritrim(issuer_temp)
replace issuer_temp=subinword(issuer_temp,"calif.","california",.)
replace issuer_temp=subinword(issuer_temp,"pcf.","pacific",.)
replace issuer_temp=subinword(issuer_temp,"r.i.","rhode island",.)
replace issuer_temp=subinword(issuer_temp,"wis.","wisconsin",.)
replace issuer_temp=subinword(issuer_temp,"ill.","illinois",.)
replace issuer_temp=subinword(issuer_temp,"phila.","philadelphia",.)
replace issuer_temp=subinword(issuer_temp,"balt.","baltimore",.)
replace issuer_temp=subinword(issuer_temp,"p'burg","pittsburg",.)
replace issuer_temp=subinword(issuer_temp,"devel.","development",.)
replace issuer_temp=subinword(issuer_temp,"imp.","improvement",.)
replace issuer_temp=subinword(issuer_temp,"st. l.","st. louis",.)
replace issuer_temp=subinword(issuer_temp,"&","and",.)
//replace issuer_temp=regexr(issuer_temp,"railroad","r. r.") if !regexm(issuer_temp,"railroad$")
replace issuer_temp=subinword(issuer_temp,"railway","",.)
replace issuer_temp=subinword(issuer_temp,"railroad","",.)

gen cname_issuer=issuer_temp
replace cname_issuer=cname_issuer+" "+division if !strpos(cname_issuer,division)
replace cname_issuer=strtrim(cname_issuer)
replace cname_issuer=stritrim(cname_issuer)
//keep if strpos(cname_issuer,"div.")
//replace cname_issuer=subinword(cname_issuer,"div.","division",.)
sort cname_issuer
cap gen mst=_n

gen cname_iss_temp=cname_issuer
sort cname_issuer
merge m:1 cname_issuer using tempm.dta, update gen(mg)
drop if mg==2

reclink2 cname_issuer using temp_rec1908.dta, idm(mst) idu(use) gen(rec_scr)
save temp_rec1.dta,replace
duplicates drop Ucname_issuer, force
gsort -rec_scr

/*
sort issuer_temp division 
//gen len=wordcount(issuer_temp)
browse Ucname_issuer cname_issuer issuer_temp rec_scr division industry is_stock is_bond //if rec_scr<1 & (rec_scr<.95|(rec_scr>.95 & len<4))
//merge m:n cname_issuer using temp.dta
//keep if _merge==3

//keep if _merge==2
*/

/*Part 2
*
use trial.dta,clear
keep if book_year_hold==1908
drop if industry=="Government"
sort cname_hold_temp
gen use=_n
save temp.dta, replace
*/
use tempm.dta, clear
cap drop max min ct dup strgrp
//cap drop cname_issuer mst ucname_issuer cname_iss_temp rec_scr
replace division=division_temp if division_temp!=""

gen cname_hold_temp= ucname_issuer_temp
replace cname_hold_temp=cname_issuer if cname_hold_temp==""

gen cname_copy=cname_hold_temp
replace cname_hold_temp=lower(cname_hold_temp)
replace cname_hold_temp=strtrim(cname_hold_temp)
replace cname_hold_temp=stritrim(cname_hold_temp)
replace cname_hold_temp=subinword(cname_hold_temp,"calif.","california",.)
replace cname_hold_temp=subinword(cname_hold_temp,"pcf.","pacific",.)
replace cname_hold_temp=subinword(cname_hold_temp,"r.i.","rhode island",.)
replace cname_hold_temp=subinword(cname_hold_temp,"wis.","wisconsin",.)
replace cname_hold_temp=subinword(cname_hold_temp,"ill.","illinois",.)
replace cname_hold_temp=subinword(cname_hold_temp,"phila.","philadelphia",.)
replace cname_hold_temp=subinword(cname_hold_temp,"balt.","baltimore",.)
replace cname_hold_temp=subinword(cname_hold_temp,"p'burg","pittsburg",.)
replace cname_hold_temp=subinword(cname_hold_temp,"devel.","development",.)
replace cname_hold_temp=subinword(cname_hold_temp,"imp.","improvement",.)
replace cname_hold_temp=subinword(cname_hold_temp,"st. l.","st. louis",.)
replace cname_hold_temp=subinword(cname_hold_temp,"&","and",.)
//replace cname_hold_temp=regexr(cname_hold_temp,"railroad","r. r.") if !regexm(cname_hold_temp,"railroad$")
//replace cname_hold_temp=subinword(cname_hold_temp,"railway","",.)
//replace cname_hold_temp=subinword(cname_hold_temp,"railroad","",.)

replace cname_issuer=cname_issuer+" "+division if !strpos(cname_issuer,division)
sort cname_hold_temp
cap drop mst
gen mst=_n

merge 1:1 mst using temp_use.dta, update
replace cname_hold_temp=ucname_2 if _merge==3
cap drop _merge mst cname_copy mg ucname_issuer_temp ucname_issuer cname_iss_temp cname_issuer division_temp
cap drop rec_scr issuer ucname_2 rec_scr2
gen class_temp=class
replace class_temp=class+" "+class_2 if class_2!=""
replace class_temp=strtrim(class_temp)
replace class_temp=stritrim(class_temp)
cap drop class_2
label var division "railway division from issuer_name"
label var cname_hold_temp "matched issuer name from holding data"
gen mst=_n
cap drop _merge
merge m:1 parent issuer_name using temp3.dta, update
replace cname_hold_temp="chartiers" if issuer_name=="Chartiers Ry."
replace cname_hold_temp="erie" if issuer_name=="Erie Railway Buffalo Br."
replace cname_hold_temp="n. y. l. e. and western" if issuer_name=="N. Y. L. E. & W. Coal & Imp."
replace cname_hold_temp="richmond and pittsburg" if issuer_name=="Richmond & P'burg"
replace cname_hold_temp="wabash" if issuer_name=="Wahash R. R. Det. & Chic. Ext."
//save rating_merge_temp.dta,replace


/*
keep if cname_hold_temp=="" & _merge==1
keep if cname_hold_temp=="" //& strpos(issuer_temp,".")
replace cname_hold_temp=issuer_temp
keep cname_hold_temp mst issuer_name parent

replace cname_hold_temp=lower(cname_hold_temp)
replace cname_hold_temp=subinstr(cname_hold_temp,"riv.","river",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"neb","nebraska",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"so-w","southwestern",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"del.","delaware",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"tenn.","tennessee",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"va.","virginia",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"ga.","georgia",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"n y","new york",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"minn","minnesota",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"s. dakota","south dakota",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"penn.","pennsylvania",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"pitts.","pittsburg",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"n. j.","new jersey",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"nor. w.","northwestern",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"ave.","avenue",.)
replace cname_hold_temp=strtrim(cname_hold_temp)
replace cname_hold_temp=stritrim(cname_hold_temp)

reclink2 cname_hold_temp using temp.dta, idm(mst) idu(use) gen(rec_scr) minscore(0.1) np(4)
drop use
duplicates drop cname_hold_temp Ucname_hold_temp, force

/*

keep if mg==1
reclink2 cname_hold_temp using temp.dta, idm(mst) idu(use) gen(rec_scr2)

keep cname_hold_temp Ucname_hold_temp rec_scr2 mst
duplicates drop

gsort mst -rec_scr2
bysort mst: gen x=_n
drop if x>4

order cname_hold_temp Ucname_hold_temp rec_scr2 

/*Non-rrrty mis-matches
replace cname_hold_temp=" if cname_hold_temp=="prescott and eastern"
replace cname_hold_temp=" if cname_hold_temp=="wilm. and newbern"
replace cname_hold_temp=" if cname_hold_temp=="aroostook county"
replace cname_hold_temp=" if cname_hold_temp=="canadian pacific aigoma br."
replace cname_hold_temp=" if cname_hold_temp=="greenville"
replace cname_hold_temp=" if cname_hold_temp=="kineon coal co."
replace cname_hold_temp=" if cname_hold_temp=="kineon coal co."
replace cname_hold_temp=" if cname_hold_temp=="new york lackawanna & western"
replace cname_hold_temp=" if cname_hold_temp=="valley of new york"
replace cname_hold_temp=" if cname_hold_temp=="warren"
replace cname_hold_temp=" if cname_hold_temp=="pennsylvania and new york canal"
replace cname_hold_temp=" if cname_hold_temp=="bay city and buttle creek"
replace cname_hold_temp=" if cname_hold_temp=="wharton valley"
replace cname_hold_temp=" if cname_hold_temp=="middletown horse"
replace cname_hold_temp=" if cname_hold_temp=="new haven and northampton"
replace cname_hold_temp=" if cname_hold_temp=="norwich st."
replace cname_hold_temp=" if cname_hold_temp=="portland st."
replace cname_hold_temp=" if cname_hold_temp=="midland of n. j."
replace cname_hold_temp=" if cname_hold_temp=="port townsend so."
replace cname_hold_temp=" if cname_hold_temp=="new york bay"
replace cname_hold_temp=" if cname_hold_temp=="new york bay"
replace cname_hold_temp=" if cname_hold_temp=="pennsylvania p. b. and w."
replace cname_hold_temp=" if cname_hold_temp=="pennsylvania p. b. and w."
replace cname_hold_temp=" if cname_hold_temp=="delaware river"
replace cname_hold_temp=" if cname_hold_temp=="beaver and ellwood"
replace cname_hold_temp=" if cname_hold_temp=="chartiers"
replace cname_hold_temp=" if cname_hold_temp=="norristown and main line"
replace cname_hold_temp=" if cname_hold_temp=="schuylkill and leh."
replace cname_hold_temp=" if cname_hold_temp=="central tex. and nor. w."
replace cname_hold_temp=" if cname_hold_temp=="new york texas and mexican"
replace cname_hold_temp=" if cname_hold_temp=="gray's point terminal"
replace cname_hold_temp=" if cname_hold_temp=="pacific of mo."
replace cname_hold_temp=" if cname_hold_temp=="wilmington and weldon"
*/
*/
*/
*/

/*********************************************************
This part cleans name of stocks
**********************************************************/
clear
set more off
global root_dta="D:\Dropbox\Bond Rating\Code and Data\dta"
cd "$root_dta"
import excel using Moodys_1909_Stock_Ratings_2.xlsx, sheet("Sheet1") first
gen issuer_name=cond(PoorsCompanyName!="",PoorsCompanyName , MoodysName)
gen cname_hold_temp=lower(issuer_name)
gen id_rating_stk=_n
tempfile x
save "`x'"
reclink2 cname_hold_temp using temp.dta, idu(use) idm(id_rating_stk) gen(rec_scr)
duplicates drop id_rating_stk Ucname_hold_temp,force
replace Ucname_hold_temp="" if cname_hold_temp=="south western railroad"
replace Ucname_hold_temp="east pennsylvania" if cname_hold_temp=="east pennsylvania railroad"
replace Ucname_hold_temp="" if cname_hold_temp=="rutland & whitehall railroad"
replace Ucname_hold_temp="erie and pittsburgh" if cname_hold_temp=="erie & pittsburg railroad"
replace Ucname_hold_temp="detroit and mackinac" if cname_hold_temp=="detroit & mackinac railway co."
replace Ucname_hold_temp="" if cname_hold_temp=="allegheny railroad"
replace Ucname_hold_temp="" if cname_hold_temp=="central railroad of south carolina"
replace Ucname_hold_temp="" if cname_hold_temp=="greene railroad"
replace Ucname_hold_temp="" if cname_hold_temp=="hiberia mine railroad"
replace Ucname_hold_temp="" if cname_hold_temp=="east mahanoy railroad"
replace Ucname_hold_temp="" if cname_hold_temp=="shamokin valley & pottsville railroad"
replace Ucname_hold_temp="" if cname_hold_temp=="troy & greenbush railroad"
replace Ucname_hold_temp="missouri pacific" if cname_hold_temp=="the missouri pacific railway company"
replace Ucname_hold_temp="" if cname_hold_temp=="mount carbon & port carbon railroad"
replace Ucname_hold_temp="" if cname_hold_temp=="albany & vermont railroad"

cap drop _merge
merge 1:m id_rating_stk using "`x'"

cap drop issuer_name
rename cname_hold_temp issuer_name
rename Ucname_hold_temp cname_hold_temp
rename StockRating1909 rating 
rename stock_type_1909 class 
replace class=class+" "+stock_class_1909
drop stock_class_1909
gen class_rate=class
replace class=lower(class)
replace class=subinstr(class,",","",.)
replace class=subinword(class,"all","",.)
replace class=subinword(class,"preference","preferred",.)
replace class=subinword(class,"special betterment","",.)
replace class=subinword(class,"preference","preferred",.)
replace class=subinword(class,"classes","",.)
replace class=subinword(class,"special","",.)
replace class=subinword(class,"other","",.)
replace class=subinword(class,"a","",.)
replace class=strtrim(class)
replace class=stritrim(class)
replace class="n/a" if class==""
rename class class_temp

foreach v of varlist _all {
	local j="`v'"+"_rate"
     rename `v' `j'
	 macro drop j
   }
keep MoodysName_rate Companyname_rate PoorsCompanyName_rate class_rate StockDividendRate1909_rate StockDividendPaidDates_1909_rate class_temp_rate rating_rate StockOutstanding1909_rate StockPriority1909_rate StockPar1909_rate StockRatingNotes_1909_rate issuer_id_rate BondObs_rate NewFirm_rate issuer_name_rate cname_hold_temp_rate id_rating_stk_rate
rename id_rating_stk_rate id_rate_stk
rename cname_hold_temp_rate cname_hold_temp
rename class_rate_rate class_rate
saveold rating_merge_stk.dta,replace
