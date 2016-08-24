*003
*This file moves the parentheses to the right of the firm names & corrects some 1-typo matchings

***********************************************Move parentheses*******************************************************************************
*ssc install egenmore
cap drop parentheses_count front* within* rear*
egen parentheses_count=noccur(cname_hold_temp),s("(")
tab parentheses_count
*list cname_hold_temp if parentheses_count==2
*step 2: split & move
cap drop subname1*
split cname_hold_temp, gen(subname1) p("(")
split subname12, gen(subname2) p(")")

rename subname11 front 
rename subname21 within
rename subname22 rear
replace cname_hold_temp=strtrim(front)+" "+strtrim(rear)+" ("+strtrim(within)+")" if parentheses_count==1

**When look at multiple parentheses
split subname13, gen(subname3) p(")")
rename subname31 within2
rename subname32 rear2

*This part transfers the state abbreviation into the whole state name, but will be unnecessary if in the future we want to transfer 
***jump to state abbreviation******************************************************************************************************************** 
do State_Abbreviation_05.do
***back******************************************************************************************************************************************/

replace within="" if within=="the"
replace within2="" if within2=="the"
replace cname_hold_temp=strtrim(front)+" "+strtrim(rear)+" "+strtrim(rear2)+" ("+strtrim(within)+")"+" ("+strtrim(within2)+")" if parentheses_count==2
replace cname_hold_temp=strtrim(front)+" "+strtrim(rear)+" ("+strtrim(within)+")" if parentheses_count==1
replace cname_hold_temp=stritrim(cname_hold_temp)
*save temp_parentheses.dta, replace

replace cname_hold_temp=subinstr(cname_hold_temp," )",")",.)
replace cname_hold_temp=subinstr(cname_hold_temp,"( ","(",.)
replace cname_hold_temp=subinstr(cname_hold_temp," ()","",.)


*After parentheses adjustment
replace cname_hold_temp=subinword(cname_hold_temp,"cans (samuel)","gans (samuel)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"chicago and north western","chicago and northwestern",.)
replace cname_hold_temp=subinword(cname_hold_temp,"chicago and alton railroad (the)","chicago and alton railroad the)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"olumbus and nenia","columbus and nenia",.)
replace cname_hold_temp=subinword(cname_hold_temp,"dexter and piscataquis","denter and piscataquis",.)
replace cname_hold_temp=subinword(cname_hold_temp,"evansville and terre haute","evansvile and terre haute",.)
replace cname_hold_temp=subinword(cname_hold_temp,"fairmount cemetery association","fairmont cemetery association",.)
replace cname_hold_temp=subinword(cname_hold_temp,"fifth avenue espate","fifth avenue estate",.)
replace cname_hold_temp=subinword(cname_hold_temp,"gas light of augusta (gas)","gas light of augusta (georgia)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"hamilton electric light and caparact power","hamilton electric light and cataract power",.)
replace cname_hold_temp=subinword(cname_hold_temp,"hudson river water tower","hudson river water power",.)
replace cname_hold_temp=subinword(cname_hold_temp,"illiinois central","illinois central",.)
replace cname_hold_temp=subinword(cname_hold_temp,"jekyll island club","jukyll island club",.)
replace cname_hold_temp=subinword(cname_hold_temp,"lewiston augusta and waterville street","lewistox augusta and water ville street",.)
replace cname_hold_temp=subinword(cname_hold_temp,"lexington and bostox street","lexington and boston street",.)
replace cname_hold_temp=subinword(cname_hold_temp,"maine shore line","maixe shore line",.)
replace cname_hold_temp=subinword(cname_hold_temp,"monongahella river consolidated coal and coke","monongahela river consolidated coal and coke",.)
replace cname_hold_temp=subinword(cname_hold_temp,"municipal gas and electric rochester n y)","municipal gas and electric (rochester new york)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"municipal water works (port smith ark)","municipal water works (fort smith ark)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"muscogee manufacturing (columbus georgia)","muscogee manufacturing columbus georgia)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"national fireproofing","national fire proofing",.)
replace cname_hold_temp=subinword(cname_hold_temp,"new york gas electric light heat vnd power","new york gas electric light heat and power",.)
replace cname_hold_temp=subinword(cname_hold_temp,"new york susquehanna and western","new york jsusquehanna and western",.)
replace cname_hold_temp=subinword(cname_hold_temp,"ntaten island","staten island",.)
replace cname_hold_temp=subinword(cname_hold_temp,"orr (james)","ore (james)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"pennsylvania for insurance on lives and granting annuities","pennsylvania for insurances on lives and granting annuities",.)
replace cname_hold_temp=subinword(cname_hold_temp,"peoples telephone","people s telephone",.)
replace cname_hold_temp=subinword(cname_hold_temp,"pleasant valley coalx","pleasant valley coal",.)
replace cname_hold_temp=subinword(cname_hold_temp,"richmond and mecklenberg","richmond and mecklenburg",.)
replace cname_hold_temp=subinword(cname_hold_temp,"rumford falls realtt (maine)","rumford falls realty (maine)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"springfield railway and light (illinois)","springfield railway and light (illinois)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"standard gas and electri","standard gas and electric",.)
replace cname_hold_temp=subinword(cname_hold_temp,"taunton and brockton street","taunton and brocktox street",.)
replace cname_hold_temp=subinword(cname_hold_temp,"temescal water (corona california)","temkscal water (corona california)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"terminal railroad association of st lous","terminal railroad association of st louis",.)
replace cname_hold_temp=subinword(cname_hold_temp,"union manufacturing (boyertown pennsylvania)","union manufacturing (boycrtown pennsylvania)",.)
replace cname_hold_temp=subinword(cname_hold_temp,"united missouri river power montana)","united missouri river power (montana)",.)

gsort -parentheses_count
