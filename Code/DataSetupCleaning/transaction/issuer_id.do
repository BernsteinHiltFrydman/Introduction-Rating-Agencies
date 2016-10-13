global root_do="D:\Dropbox\Bond Rating\Code and Data\transaction"
global root_dta="D:\Dropbox\Bond Rating\Code and Data\dta"
cd "$root_dta"
*ssc install moss

/************************************
This part revises the problematic id
************************************/
use weekly_data_cleaned_v1.dta,clear
*false negative
rename companyname cname
gen issuer_id_temp=issuer_id
replace issuer_id_temp=520 if issuer_id==524
replace issuer_id_temp=148 if issuer_id==189
replace issuer_id_temp=30 if strpos(cname,"Chic., M. & St. P.") 
replace issuer_id_temp=476 if issuer_id==534
replace issuer_id_temp=532 if issuer_id==530
replace issuer_id_temp=19 if issuer_id==813
replace issuer_id_temp=397 if issuer_id==608
replace issuer_id_temp=196 if issuer_id==440
replace issuer_id_temp=691 if issuer_id==317
replace issuer_id_temp=418 if issuer_id==550
replace issuer_id_temp=486 if issuer_id==413
replace issuer_id_temp=68 if issuer_id==225
replace issuer_id_temp=768 if issuer_id==556
replace issuer_id_temp=506 if issuer_id==445
replace issuer_id_temp=632 if issuer_id==631
replace issuer_id_temp=368 if issuer_id==442
replace issuer_id_temp=272 if issuer_id==171
replace issuer_id_temp=303 if issuer_id==566
replace issuer_id_temp=489 if issuer_id==475
replace issuer_id_temp=170 if issuer_id==179
replace issuer_id_temp=392 if issuer_id==493
replace issuer_id_temp=131 if issuer_id==132
replace issuer_id_temp=400 if issuer_id==511
replace issuer_id_temp=509 if issuer_id==456
replace issuer_id_temp=900 if issuer_id==768 & strpos(cname,"Midland")
rename cname companyname

*false positive
gen cname=companyname
replace companyname=subinword(companyname,"of","",.)
replace companyname=subinword(companyname,"and","",.)
replace companyname=subinstr(companyname,"A.v.","Av.",.)
replace companyname=subinstr(companyname,","," ",.)
replace companyname=subinstr(companyname,"&"," ",.)
replace companyname=subinstr(companyname,"."," ",.)
replace companyname=subinstr(companyname,"' ","'",.)
replace companyname=strtrim(companyname)
replace companyname=stritrim(companyname)
replace companyname=regexr(companyname,"Co$","")
replace companyname=" "+companyname
moss companyname, match("( [a-zA-Z0-9])") regex
egen cap_cname=concat(_match*),p(" ")
drop _*
replace cap_cname=subinstr(cap_cname," ","",.)
replace cap_cname=lower(cap_cname)
//browse cap_cname cname if regexm(cap_cname,"[a-z]")
//browse cname issuer_id
replace issuer_id_temp=22 if issuer_id_temp==21 & cap_cname=="clnj"
replace issuer_id_temp=901 if issuer_id_temp==28 & cap_cname=="ei"
replace issuer_id_temp=151 if issuer_id_temp==30 & cap_cname=="cspmo"
replace issuer_id_temp=223 if issuer_id_temp==31 & cap_cname=="cwi"
replace issuer_id_temp=40 if issuer_id_temp==39 & cap_cname=="drg"
replace issuer_id_temp=52 if issuer_id_temp==55 & cap_cname=="htc"
replace issuer_id_temp=160 if issuer_id_temp==58 & cap_cname=="in"
replace issuer_id_temp=902 if issuer_id_temp==65 & cap_cname=="lew"
replace issuer_id_temp=103 if issuer_id_temp==65 & cap_cname=="ple"
replace issuer_id_temp=255 if issuer_id_temp==68 & cap_cname=="lny"
replace issuer_id_temp=95 if issuer_id_temp==87 & cap_cname=="orrn"
replace issuer_id_temp=179 if issuer_id_temp==170 & cap_cname=="svne"
replace issuer_id_temp=905 if issuer_id_temp==255 & cap_cname=="hewt"
replace issuer_id_temp=906 if issuer_id_temp==476 & cap_cname=="cge"
replace issuer_id_temp=907 if issuer_id_temp==482 & cap_cname=="cr"
replace issuer_id_temp=95 if issuer_id_temp==648 & cap_cname=="orrn"

/* check
keep if issuer_id_temp!=issuer_id
keep issuer_id_temp issuer_id cname
rename issuer_id issuer_id_orig
rename issuer_id_temp issuer_id
rename cname Ucname
joinby issuer_id using weekly_data_cleaned_v1.dta

sort issuer_id issuer_id_orig
browse issuer_id companyname issuer_id_orig Ucname if issuer_id_orig==556
*/
save weekly_data_checked.dta, replace

/****************************************************************
Idea to check false negative:
1) by issuer id, count # obs. as countid
2) extract first letter of every word & concatenate to form new string cap_cname
3) fuzzy match on cap_cname, create group cap_2 (here I match all issuer names with same first two letters in cap_cname)
4) by cap_2, count the minimum ocuntid, if that's less than 15, there might be a potential problem
5) check problematic matches (manually/again by fuzzy match)
****************************************************************/
use weekly_data_cleaned_v1.dta,clear
bysort issuer_id: egen countid=nvals(companyname)
*tab countid
gen cname=companyname
replace companyname=subinword(companyname,"of","",.)
replace companyname=subinword(companyname,"and","",.)
replace companyname=subinstr(companyname,"A.v.","Av.",.)
replace companyname=subinstr(companyname,","," ",.)
replace companyname=subinstr(companyname,"&"," ",.)
replace companyname=subinstr(companyname,"."," ",.)
replace companyname=subinstr(companyname,"' ","'",.)
replace companyname=strtrim(companyname)
replace companyname=stritrim(companyname)
replace companyname=regexr(companyname,"Co$","")
replace companyname=" "+companyname
moss companyname, match("( [a-zA-Z0-9])") regex
egen cap_cname=concat(_match*),p(" ")
drop _*
replace cap_cname=subinstr(cap_cname," ","",.)
//browse cap_cname cname if regexm(cap_cname,"[a-z]")
//browse cname issuer_id
bysort cap_cname: egen ct=nvals(issuer_id)
bysort cap_cname: egen mincount=min(countid)

//strgroup cap_cname, gen(strg) thresh(1) norm(none) force
*Match by first two characters
gen len=length(cname)
gsort issuer_id -len
by issuer_id: gen n=_n
keep if n==1
drop n
drop len
*duplicates drop issuer_id cap_cname,force
gen cap_2=substr(cap_cname,1,2)
sort cap_2 issuer_id cname
bysort cap_2: egen countid_cap2=nvals(issuer_id)
bysort cap_2: egen countid_min=min(countid)

sort cname
gen l2=substr(cname,2,1)
replace l2=lower(l2)
sort cap_2 l2
*Potential problem: too high countid_cap2/ too low countid
browse cap_2 issuer_id cname countid_cap2 countid_min countid if countid_min<20


*See match between only 1 character & first # characters

/*****************************************
Idea to check false positive:
see those has different cap_cname
*****************************************/
use weekly_data_checked.dta,clear
bysort issuer_id_temp: egen countid=nvals(companyname)
*tab countid
gen cname=companyname
replace companyname=subinword(companyname,"of","",.)
replace companyname=subinword(companyname,"and","",.)
replace companyname=subinstr(companyname,"A.v.","Av.",.)
replace companyname=subinstr(companyname,","," ",.)
replace companyname=subinstr(companyname,"&"," ",.)
replace companyname=subinstr(companyname,"."," ",.)
replace companyname=subinstr(companyname,"' ","'",.)
replace companyname=strtrim(companyname)
replace companyname=stritrim(companyname)
replace companyname=regexr(companyname,"Co$","")
replace companyname=" "+companyname
moss companyname, match("( [a-zA-Z0-9])") regex
egen cap_cname=concat(_match*),p(" ")
drop _*
replace cap_cname=subinstr(cap_cname," ","",.)
replace cap_cname=lower(cap_cname)
bysort issuer_id_temp: egen ctcap=nvals(cap_cname)
duplicates drop issuer_id_temp cap_cname, force
/*
gen len=length(cap_cname)
bysort issuer_id_temp: egen minlen=min(len)
bysort issuer_id_temp: gen mincap_cname=cap_cname if len==minlen
egen 
sort issuer_id_temp len
bysort issuer
*/
sort issuer_id_temp cname
browse issuer_id_temp cname cap_cname if ctcap>1
tab ctcap


sort cname
browse cname
/*
tempfile x
save "`x'"

keep cap_2 cap_cname issuer_id cname
rename cap_cname Ucap_cname
rename issuer_id Uissuer_id
rename cname Ucname
tempfile y
save "`y'"

use "`x'"
joinby cap_2 using "`y'"

save temp.dta,replace

drop if issuer_id==Uissuer_id
sort issuer_id Uissuer_id

browse issuer_id cname Uissuer_id Ucname
*/

gen idm=_n
tempfile x
save temp1.dta,replace
keep companyname cap_cname issuer_id idm
duplicates drop cap_cname issuer_id, force
rename idm idu
tempfile y 
save temp2.dta,replace

use temp1.dta,clear
reclink2 cap_cname using temp2.dta, idm(idm) idu(idu) gen(rec_scr)

cd "$root_dta"
save temp.dta,replace
//use temp.dta,clear

use temp1.dta,clear
reclink2 cap_cname using temp2.dta, idm(idm) idu(idu) gen(rec_scr) exclude(temp.dta)


/*
duplicates drop issuer_id, force
gsort -ct cap_cname issuer_id
browse cap_cname companyname issuer_id countid if ct>1 & mincount<10
tab ct
*/



strgroup cap_cname, gen(strg) thresh(1) norm(none) force
bysort strg: egen countid_stg=nvals(issuer_id)
bysort strg: egen min_countid=min(countid)
gen len=length(cap_cname)

duplicates drop strg issuer_id,force
sort strg issuer_id
browse companyname cap_cname strg issuer_id if countid_stg>1 & len>3


gsort -countid 
browse companyname cap_cname strg issuer_id countid if countid<8


