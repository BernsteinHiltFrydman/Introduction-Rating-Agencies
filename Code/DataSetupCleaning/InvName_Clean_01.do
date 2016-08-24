**001
*This file cleans the original investor name string variable (cname_id_orig)
*To make this do file reuseable, I need to replace cname_hold_orig by some locals, which will make the program less readable. I might do that in the future.
global root_data "$root_dropbox\Bond Rating\Code and Data\dta"
global root_do "$root_dropbox\Bond Rating\Code and Data\do_investor_PreClean"
 
cd "$root_data"
use Holdings_Data_IssuerClean.dta, clear

cd "$root_do"

*0.cap drop
cap drop parentheses_count issuer_num front subname12 subname13 within rear within2 rear2 tag
cap drop tag
*0.Check for total number of investors
cap drop tag 
cap drop inv_num
rename investor_name_hold invname_hold_orig
egen tag=tag(invname_hold_orig)
egen investor_num=total(tag)
tab investor_num 

*1.Tranfer the upper case into lower case
gen invname_hold_temp=strlower(invname_hold_orig)
label var invname_hold_temp "temporary variable constructed to clean investor name variable"
capture drop tag investor_num
egen tag=tag(invname_hold_temp industry)
egen investor_num=total(tag)
tab investor_num 

*0.remove invalid UTF-8 sequences
replace invname_hold_temp= ustrfix(invname_hold_temp, "")

*2.Remove unnecessary punctuations
replace invname_hold_temp=subinstr(invname_hold_temp,"/'s","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"+bt:d36","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"co's","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"co,'s","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"'s","s",.)
replace invname_hold_temp=subinstr(invname_hold_temp," s ","s ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"'","",.)
replace invname_hold_temp=subinword(invname_hold_temp,","," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"; "," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,";"," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"!","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"*","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"&"," and ",.)
replace invname_hold_temp=subinword(invname_hold_temp,"a","and",.)
replace invname_hold_temp=subinword(invname_hold_temp,"^","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"- "," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"-"," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp," -"," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"."," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"+","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,":","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"$","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"#","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"@","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,","," ",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"+","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"?","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,">","",.)


*3.Remove "company"
foreach y in "compauy" "companv" "company" "co." "co;" "co" "corporation" /*
*/"corp." " corp;" "corp" "ltd" "coltd" "co's"{
	replace invname_hold_temp=subinword(invname_hold_temp,"`y'","",.)
	}

*5.Parentheses: normalize the parentheses and move them all into the back
*ssc install egenmore
egen parentheses_count=noccur(invname_hold_temp),s("(")
*step 1: elliminate (the)?
replace invname_hold_temp=subinword(invname_hold_temp,"(the)","",.)
*step 2: split & move
cap drop subname1*
split invname_hold_temp, gen(subname1) p("(")
split subname12, gen(subname2) p(")")

rename subname11 front 
rename subname21 within
rename subname22 rear
replace invname_hold_temp=strtrim(front)+" "+strtrim(rear)+"("+strtrim(within)+")" if parentheses_count==1
replace invname_hold_temp=subinstr(invname_hold_temp,"(","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,")","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"[","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"]","",.)
*replace invname_hold_temp=regexr
*don't do this because no double parentheses in the inv_name
/**When look at multiple parentheses
split subname13, gen(subname3) p(")")
rename subname31 within2
rename subname32 rear2
replace invname_hold_temp=strtrim(front)+" "+strtrim(rear)+" "+strtrim(rear2)+"("+strtrim(within)+")" +" ("+strtrim(within2)+")" if parentheses_count==2
replace invname_hold_temp=stritrim(invname_hold_temp)
replace invname_hold_temp=subinstr(invname_hold_temp," )",")",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"( ","(",.)

replace invname_hold_temp = regexr(invname_hold_temp, "\((.)+\)", "")
*/

*check for parentheses characteristics
/*use holding_temp.dta, clear
duplicates drop invname_hold_temp industry, force
tempfile t
tempfile x
sort invname_hold_temp
save "`t'"
replace invname_hold_temp = regexr(invname_hold_temp, "\((.)+\)", "")
save "`x'"
merge m:n invname_hold_temp using "`t'"
drop if _merge==3
save holding_parantheses.dta
*/

*7.Common typos: Replace “5” w/ “S”, “8” w/ “S”, “1” w/ “t”, “axd” w/ “and”, " ryand" w/ " ry and", " oas " w/ " gas ", then leading numbers with blank
replace invname_hold_temp=subinstr(invname_hold_temp,"5","s",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"8","s",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"1","t",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"axd","and",.)
replace invname_hold_temp=subinstr(invname_hold_temp," ryand"," ry and",.)
replace invname_hold_temp=subinstr(invname_hold_temp," oas "," gas ",.)

forvalues i=0/9 {
	replace invname_hold_temp=subinstr(invname_hold_temp,"`i'","",.)
	}

capture drop tag investor_num
egen tag=tag(invname_hold_temp industry)
egen investor_num=total(tag)
tab investor_num 

*8.Replace multiple blanks
replace invname_hold_temp=stritrim(invname_hold_temp)

*9.Remove trailing and leading spaces
replace invname_hold_temp=strtrim(invname_hold_temp)

*10. Replace ry & rr, ryand by "ry and"
replace invname_hold_temp=subinstr(invname_hold_temp," ry"," railway",.)
replace invname_hold_temp=subinstr(invname_hold_temp," rr"," railroad",.)


replace invname_hold_temp=invname_hold_temp+";"
foreach w in "bade;" "bamc;" "ban;" "ibank;" "bant;" "baank;" "bak;" "banks;" "banky;" "bauk;" "bk;"/*
*/ "bnk;" "bnnk;" "bonk;" "bulk;" "bunk;" "eank;" "hank;" "honk;" "hunk;" "ibank;" "knnk;" "nnk;" "rank;" "sank;"{

replace invname_hold_temp=subinstr(invname_hold_temp,"`w'","bank;",.)
}
replace invname_hold_temp=subinstr(invname_hold_temp,";","",.)
replace invname_hold_temp=subinstr(invname_hold_temp,"bankk","",.)

replace invname_hold_temp=invname_hold_temp+";"
foreach w in "tarust;" "tpust;" "tryst" "trustt;" "tust;" "trast"{

replace invname_hold_temp=subinstr(invname_hold_temp,"`w'","trust;",.)
}
replace invname_hold_temp=subinstr(invname_hold_temp,";","",.)

foreach w in "savings" "saviugs" "savlngb" "savine" "savines" "havings" "savihgs" "sayings" "saving" "savingb" "savngs" "ssavings" "savmgs" "sarvings" "sarings"{
replace invname_hold_temp=subinword(invname_hold_temp,"`w'","savings",.)
}

foreach w in "comany" "comapany" "comapny" "comoanv" "compaiw" "comoany" "compaay" "compahy" "compan"/*
*/ "companr" "compapy" "compaq" "compay" "compnay" "compnny" "compony" "compuny" "comrany" "com" "comp" "companly" "companvy" "comiwny" "comjwny"{
replace invname_hold_temp=subinword(invname_hold_temp,"`w'","company",.)
}

foreach w in "asssurance" "assuerance" "assuraance" "assurance" "assurauce" "asurance"{
replace invname_hold_temp=subinword(invname_hold_temp,"`w'","assurance",.)
}

foreach w in "fnsurance" "iasurance" "inburance" "innsurance" "insnrance" "insuauce" "insurace" "insuranc" /*
*/"insura nce" "insurance" "insurance)" "insurancee" "insurances" "insuranec" "insurant" "insurauce" "insurauge" "insurnace" "insurnce" "insurnnce" /*
*/"inurance" "inusrance" "inusurance" "iusurance" "lasurance" "lnsurance" "nsurance" "surance"{
replace invname_hold_temp=subinword(invname_hold_temp,"`w'","insurance",.)
}


/*
ass assurance
ins insurance
asso assn association
sav savings 
*/
*11. extend state abbreviation
global x="invname_hold_temp"
do StateList.do
do RepList.do
do RepList.do
do RepList2.do
do InvLoc_Clean.do

cap drop parentheses_count front subname12 subname13 within rear tag investor_num

cd "$root_data"
saveold Holdings_Investor_PreClean.dta, replace


/*
use temp_invname.dta, clear

keep if industry!="Government"
duplicates drop invname_hold_temp, force

*ssc install strgroup
strgroup invname_hold_temp, gen(group) threshold(2) norm(none) force
duplicates tag group, gen(count_fuzzymatch)
gsort -count_fuzzymatch group

duplicates tag group book_year_hold cname_hold_temp, gen(count_dup1)
duplicates tag group book_year_hold cname_hold_temp coupon_hold maturity_year_hold, gen(count_dup2)
gen count_invname=wordcount(invname_hold_temp)
bysort group: egen max_count=max(count_invname)
bysort group: egen min_count=min(count_invname)
gen max_min=1 if max_count==min_count
gsort -count_fuzzymatch group invname_hold_temp


gen correct=0
gen group_corrected=0


use temp_duploc.dta, clear

browse invname_hold_orig invname_hold_temp group investor_city_hold investor_state_hold count_fuzzymatch cname_hold_orig industry if count_fuzzymatch>1 & !strpos(invname_hold_temp,"fire") & !strpos(invname_hold_temp,"life") 

browse invname_hold_orig invname_hold_temp group investor_city_hold investor_state_hold count_fuzzymatch cname_hold_orig industry if count_fuzzymatch>0 //book_year_hold invname_hold_orig cname_hold_orig industry investor_state_hold par_value_clean_hold count_invname


