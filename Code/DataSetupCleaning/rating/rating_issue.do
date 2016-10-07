/*
clear
set more off
global root_dta="D:\Dropbox\Bond Rating\Code and Data\dta"
global root_do "D:\Dropbox\Bond Rating\Code and Data\rating"
cd "$root_dta"

use "D:\Dropbox\Bond Rating\Code and Data\dta\Holdings_Data_Dummy.dta", clear
//keep if book_year_hold==1908
//drop if industry=="Government" & cname_hold_temp!="aroostook county"
replace class_hold_temp=strtrim(class_hold_temp)
replace class_hold_temp=stritrim(class_hold_temp)
sort cname_hold_temp
gen cname_division=cname_hold_temp
replace cname_division=cname_division+" "+class_hold_temp if tag_class==3
gen id_hold=_n

cd "$root_do"
global x="class_hold_temp"
do rating_class.do
global x="class_type"
do rating_class.do

foreach i in "class_hold_temp" "class_type" {
replace `i'="preferred" if cname_hold_temp=="catawissa railroad" & invname_hold_temp=="queens insurance of america" & class_hold=="N/A"
replace `i'="preferred" if cname_hold_temp=="catawissa railroad" & invname_hold_temp=="queens insurance of america" & class_hold=="N/A"
replace `i'="preferred" if cname_hold_temp=="denver and rio grande" & invname_hold_temp=="columbus trust" & class_hold=="N/A"
replace `i'="preferred" if cname_hold_temp=="denver and rio grande" & invname_hold_temp=="columbus trust" & class_hold=="N/A"
replace `i'="preferred" if cname_hold_temp=="denver and rio grande" & invname_hold_temp=="duchess insurance" & class_hold=="N/A"
replace `i'="preferred" if cname_hold_temp=="denver and rio grande" & invname_hold_temp=="duchess insurance" & class_hold=="N/A"
replace `i'="first preferred" if cname_hold_temp=="erie railroad" & stock_type_temp=="preferred"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="american foreign marine insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="american mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="bath savings institution" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="blackstone mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="enterprise mutual fire insurance" & class_hold=="N/A"
replace `i'="common" if cname_hold_temp=="illinois central" & invname_hold_temp=="hillsborough county savings bank" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="hope mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="liverpool london globe insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="mercantile mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="merchant mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="national surety" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="nederland limited liability life insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="new york life insurance trust" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="norwich union fire insurance society" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="queens county savings bank" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="royal insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="sottish union national insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="standard fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="state mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="sun insurance office" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="thames mersey marine insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="traveler insurance" & class_hold=="N/A"
replace `i'="common" if cname_hold_temp=="illinois central" & invname_hold_temp=="westchester county savings bank" & class_hold=="N/A"
replace `i'="common" if cname_hold_temp=="illinois central" & invname_hold_temp=="westchester county savings bank" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="illinois central" & invname_hold_temp=="what cheer mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="minneapolis st paul and sault ste marie" & invname_hold_temp=="blackstone mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="minneapolis st paul and sault ste marie" & invname_hold_temp=="hope mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="minneapolis st paul and sault ste marie" & invname_hold_temp=="merchant mutual fire insurance" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="minneapolis st paul and sault ste marie" & invname_hold_temp=="new amsterdam casualty" & class_hold=="N/A"
replace `i'="leased line stock" if cname_hold_temp=="minneapolis st paul and sault ste marie" & invname_hold_temp=="north british mercantile insurance" & class_hold=="N/A"
}

cd "$root_dta"
save temp.dta, replace


use rating_merge.dta, clear
replace issuer_temp=issuer_temp+" "

levelsof class, local(level) 
levelsof cs, local(levels) 
foreach l of local levels {
 replace class_temp=class_temp+" "+"`l'" if strpos(issuer_temp," `l' ")
}

foreach l of local level {
 replace class_temp=class_temp+" "+"`l'" if strpos(issuer_temp," `l' ")
}

replace issuer_temp=strtrim(issuer_temp)
replace issuer_temp=stritrim(issuer_temp)
drop cs
split maturity, gen(mat) parse("-")
gen maturity_temp=mat1
replace maturity_temp=mat1+"-19"+mat2 if mat2!="" & mat2!="6"
replace maturity_temp=mat1+"-193"+mat2 if mat2=="6"
drop mat1 mat2
*/
use rating_merge_temp.dta ,clear
cap drop coupon_temp
gen coupon_temp=lower(coupon)
replace coupon_temp=subinstr(coupon_temp,"and","&",.)
replace coupon_temp=subinstr(coupon_temp,"1/2",".5",.)
replace coupon_temp=subinstr(coupon_temp,"½",".5",.)
replace coupon_temp=subinstr(coupon_temp,"¼",".25",.)
replace coupon_temp=subinstr(coupon_temp,"s","",.)
replace coupon_temp=subinstr(coupon_temp,"erie","",.)
replace coupon_temp=subinstr(coupon_temp,"per cent","",.)
replace coupon_temp=subinstr(coupon_temp," 3/10th",".3",.)
replace coupon_temp=strtrim(coupon_temp)
replace coupon_temp=stritrim(coupon_temp)
replace class_temp=class_temp+" "+regexs(0) if regexm(coupon_temp,"ctf")
replace class_temp=class_temp+" "+regexs(0) if regexm(coupon_temp,"[a-z]+( to [a-z])?")
replace coupon_temp=regexr(coupon_temp,"ctf","")
replace coupon_temp=regexr(coupon_temp,"[a-z]+( to [a-z])?","")
replace coupon_temp="3.5&4&4.5" if coupon_temp=="3.5 4 44"
replace coupon_temp="6" if coupon_temp=="68"
replace coupon_temp=regexr(coupon_temp,"3 3","3&3")
replace coupon_temp=regexr(coupon_temp,"5 5","5&5")
replace coupon_temp=regexr(coupon_temp,"5( )+6","5&6")
replace coupon_temp=subinstr(coupon_temp," ","",.)

cap drop co co2
cap gen mst=_n
save rating_merge_temp.dta, replace


use rating_merge_temp.dta,clear
replace cname_hold_temp="chartiers" if issuer_name=="Chartiers Ry."
replace cname_hold_temp="erie railway" if issuer_name=="Erie Railway Buffalo Br."
replace cname_hold_temp="new york lake erie and western" if issuer_name=="N. Y. L. E. & W. Coal & Imp."
replace cname_hold_temp="richmond and pittsburg" if issuer_name=="Richmond & P'burg"
replace cname_hold_temp="wabash" if issuer_name=="Wahash R. R. Det. & Chic. Ext."
replace cname_hold_temp="" if cname_hold_temp=="prescott and eastern"
replace cname_hold_temp="" if cname_hold_temp=="wilm. and newbern"
replace cname_hold_temp="" if cname_hold_temp=="aroostook county"
replace cname_hold_temp="" if cname_hold_temp=="canadian pacific aigoma br."
replace cname_hold_temp="" if cname_hold_temp=="greenville"
replace cname_hold_temp="" if cname_hold_temp=="kineon coal co."
replace cname_hold_temp="" if cname_hold_temp=="kineon coal co."
replace cname_hold_temp="" if cname_hold_temp=="new york lackawanna & western"
replace cname_hold_temp="" if cname_hold_temp=="valley of new york"
replace cname_hold_temp="" if cname_hold_temp=="warren"
replace cname_hold_temp="" if cname_hold_temp=="pennsylvania and new york canal"
replace cname_hold_temp="" if cname_hold_temp=="bay city and buttle creek"
replace cname_hold_temp="" if cname_hold_temp=="wharton valley"
replace cname_hold_temp="" if cname_hold_temp=="middletown horse"
replace cname_hold_temp="" if cname_hold_temp=="new haven and northampton"
replace cname_hold_temp="" if cname_hold_temp=="norwich st."
replace cname_hold_temp="" if cname_hold_temp=="portland st."
replace cname_hold_temp="" if cname_hold_temp=="midland of n. j."
replace cname_hold_temp="" if cname_hold_temp=="port townsend so."
replace cname_hold_temp="" if cname_hold_temp=="new york bay"
replace cname_hold_temp="" if cname_hold_temp=="new york bay"
replace cname_hold_temp="" if cname_hold_temp=="pennsylvania p. b. and w."
replace cname_hold_temp="" if cname_hold_temp=="pennsylvania p. b. and w."
replace cname_hold_temp="" if cname_hold_temp=="delaware river"
replace cname_hold_temp="" if cname_hold_temp=="beaver and ellwood"
replace cname_hold_temp="" if cname_hold_temp=="chartiers"
replace cname_hold_temp="" if cname_hold_temp=="norristown and main line"
replace cname_hold_temp="" if cname_hold_temp=="schuylkill and leh."
replace cname_hold_temp="" if cname_hold_temp=="central tex. and nor. w."
replace cname_hold_temp="" if cname_hold_temp=="new york texas and mexican"
replace cname_hold_temp="" if cname_hold_temp=="gray's point terminal"
replace cname_hold_temp="" if cname_hold_temp=="pacific of mo."
replace cname_hold_temp="" if cname_hold_temp=="wilmington and weldon"


*duplicates drop cname_hold_temp coupon maturity*/, force
*sort cname_hold_temp coupon maturity
*duplicates drop cname_hold_temp maturity, force
*duplicates drop cname_hold_temp, force

gen cname_division=cname_hold_temp+" "+division if !strpos(cname_hold_temp,division)
replace cname_division=cname_hold_temp if division==""
replace cname_division=parent if cname_hold_temp==""
gen mis_cname=1 if cname_hold_temp==""
sort cname_hold_temp coupon maturity

*rename coupon coupon_hold_temp
rename maturity maturity_hold_temp
save temp_ri.dta,replace

use temp_ri.dta,clear
*reclink 
reclink2 cname_division cname_hold_temp using temp.dta, idm(mst) idu(id_hold) gen(rec_scr) //required(maturity_hold_temp)

/*
tempfile x
tempfile y
tempfile z
save "`x'"
keep if tag_merge==1
reclink2 cname_division cname_hold_temp using temp.dta, idm(mst) idu(use) gen(rec_scr) //required(maturity_hold_temp)
save "`y'"
use "`x'"
keep if tag_merge!=1
reclink2 cname_division cname_hold_temp maturity_hold_temp using temp.dta, idm(mst) idu(use) gen(rec_scr) required(maturity_hold_temp)
save "`z'"
append using "`y'"
*/
replace cname_hold_temp="" if cname_hold_temp=="louisville and nashville Mobile & Montg."
replace cname_hold_temp="" if cname_hold_temp=="new york short line"
replace cname_hold_temp="" if cname_hold_temp=="new york and flushing"
replace cname_hold_temp="" if cname_hold_temp=="grand rap. b. and s."
replace cname_hold_temp="" if cname_hold_temp=="new london st."
replace cname_hold_temp="" if cname_hold_temp=="jacksonville and s. w."
replace cname_hold_temp="" if cname_hold_temp=="jefferson branch"
replace cname_hold_temp="" if cname_hold_temp=="paterson extension"
replace cname_hold_temp="" if cname_hold_temp=="delaware river"
replace cname_hold_temp="" if cname_hold_temp=="new york bay"
replace cname_hold_temp="" if cname_hold_temp=="camden and bur. county"
replace cname_hold_temp="" if cname_hold_temp=="schuylkill and leh."
replace cname_hold_temp="" if cname_hold_temp=="greenv. and newman"
replace cname_hold_temp="" if cname_hold_temp=="chester and beeket"
replace cname_hold_temp="" if cname_hold_temp=="northeastern of s. c."
replace cname_hold_temp="" if cname_hold_temp=="lehigh valley of new york"
replace cname_hold_temp="" if cname_hold_temp=="lehigh valley of new york"
replace cname_hold_temp="" if cname_hold_temp=="new york bay exten."
replace cname_hold_temp="" if cname_hold_temp=="warren"
replace cname_hold_temp="" if cname_hold_temp=="ocean s. s. co."
replace cname_hold_temp="" if cname_hold_temp=="state line and sull."
replace cname_hold_temp="" if cname_hold_temp=="morgan's la. and tex. s.s. alex. extension"
replace cname_hold_temp="" if cname_hold_temp=="canada and southern"
replace cname_hold_temp="" if cname_hold_temp=="pennsylvania P. B. & W."
replace cname_hold_temp="" if cname_hold_temp=="roanoke and tar riv."
replace cname_hold_temp="" if cname_hold_temp=="wheeling and lake erie div"
replace cname_hold_temp="" if cname_hold_temp=="mobile and bay shore"
replace cname_hold_temp="" if cname_hold_temp=="aroostook county"
replace cname_hold_temp="" if cname_hold_temp=="pacific of mo."
replace cname_hold_temp="" if cname_hold_temp=="passaic and new york"
replace cname_hold_temp="" if cname_hold_temp=="norwich st."
replace cname_hold_temp="" if cname_hold_temp=="southern Mobile & O."
replace cname_hold_temp="" if cname_hold_temp=="wilm. and newbern"
replace cname_hold_temp="" if cname_hold_temp=="fulton chain"
replace cname_hold_temp="" if cname_hold_temp=="arkansas midland"
replace cname_hold_temp="" if cname_hold_temp=="oregon and pal."
replace cname_hold_temp="" if cname_hold_temp=="cons. indiana coal"
replace cname_hold_temp="" if cname_hold_temp=="central tex. and nor. w."
replace cname_hold_temp="" if cname_hold_temp=="midland of n. j."
replace cname_hold_temp="" if cname_hold_temp=="portland st."
replace cname_hold_temp="" if cname_hold_temp=="delano land co."
replace cname_hold_temp="" if cname_hold_temp=="delano land co."
replace cname_hold_temp="" if cname_hold_temp=="meriden horse"
replace cname_hold_temp="" if cname_hold_temp=="norristown and main line"
replace cname_hold_temp="" if cname_hold_temp=="little rock june."
replace cname_hold_temp="" if cname_hold_temp=="st. paul eastern grand trunk"
replace cname_hold_temp="" if cname_hold_temp=="long island Nor. Sh. Br."
replace cname_hold_temp="" if cname_hold_temp=="clev. col. cin. and i."
replace cname_hold_temp="" if cname_hold_temp=="toronto, grey and bruce"
replace cname_hold_temp="" if cname_hold_temp=="wisconsin central Minn. Term. P. M."
replace cname_hold_temp="" if cname_hold_temp=="southwest coal and improvement"
replace cname_hold_temp="" if cname_hold_temp=="prescott and eastern"
replace cname_hold_temp="" if cname_hold_temp=="Chic. and rhode island Ele."
replace cname_hold_temp="" if cname_hold_temp=="middletown horse"
replace cname_hold_temp="" if cname_hold_temp=="saginaw, t. and h."
replace cname_hold_temp="" if cname_hold_temp=="wharton valley"
replace cname_hold_temp="" if cname_hold_temp=="buff. r. and p."
replace cname_hold_temp="" if cname_hold_temp=="ogdenburg term"
replace cname_hold_temp="" if cname_hold_temp=="valley of new york"
replace cname_hold_temp="" if cname_hold_temp=="greenville"
replace cname_hold_temp="" if cname_hold_temp=="canadian pacific Aigoma Br."
replace cname_hold_temp="" if cname_hold_temp=="wash. and col. riv."
replace cname_hold_temp="" if cname_hold_temp=="leh. and wilkesbarre coal"
replace cname_hold_temp="" if cname_hold_temp=="iberia and vern."
replace cname_hold_temp="" if cname_hold_temp=="kineon coal co."
replace cname_hold_temp="" if cname_hold_temp=="beaver and ellwood"
replace cname_hold_temp="" if cname_hold_temp=="port townsend so."
replace cname_hold_temp="" if cname_hold_temp=="cons. stone co."
replace cname_hold_temp="" if cname_hold_temp=="gray's point terminal"
replace cname_hold_temp="" if cname_hold_temp=="sodus bay and south"
replace cname_hold_temp="" if cname_hold_temp=="bay city and buttle creek"
replace cname_hold_temp="" if cname_hold_temp=="Chic. R. I. and pacific Railway"
replace cname_hold_temp="" if cname_hold_temp=="chicago san francisco and california"
replace cname_hold_temp="" if cname_hold_temp=="wilm. and newborn"
replace cname_hold_temp="" if cname_hold_temp=="southern mobile and o."
replace Ucname_hold_temp="atlantic coast line" if cname_hold_temp=="atlantic coast line" & Ucname_hold_temp=="atlantic shore line"
replace Ucname_hold_temp="cedar rapids and missouri river" if cname_hold_temp=="cedar rapids and missouri river" & Ucname_hold_temp=="cedar rapids iowa falls and northwestern"
replace Ucname_hold_temp="chicago rock island and pacific railway" if cname_hold_temp=="chic. r. i. and pacific railway" & Ucname_hold_temp=="chicago and atlantic railway"
replace Ucname_hold_temp="st louis southern" if cname_hold_temp=="st louis southern" & Ucname_hold_temp=="st louis and northeastern"
replace Ucname_hold_temp="toledo st louis and western" if cname_hold_temp=="toledo st louis and western" & Ucname_hold_temp=="toledo and western"
replace Ucname_hold_temp="union pacific" if cname_hold_temp=="union pacific" & Ucname_hold_temp=="union passenger"
replace Ucname_hold_temp="wheeling and lake erie" if cname_hold_temp=="wheeling and lake erie" & Ucname_hold_temp=="wheeling and elm grove"
replace Ucname_hold_temp="new york lake erie and western" if issuer_name=="N. Y. L. E. & Western"
replace Ucname_hold_temp="erie railroad" if issuer_name=="Erie R. R. Huff. & So'w. Div."
replace Ucname_hold_temp="southern railway" if issuer_name=="So. Ry. E. Tenn."
replace Ucname_hold_temp="wabash railroad" if issuer_name=="Wabash R. R. Omaha Div."
replace Ucname_hold_temp="aroostook county" if issuer_name=="Aroostook County"
replace Ucname_hold_temp="canadian pacific" if issuer_name=="Can. Pcf. Aigoma Br."
replace Ucname_hold_temp="" if issuer_name=="Greenville Ry"
replace Ucname_hold_temp="midland railroad" if issuer_name=="Midland R. R. of N. J."
replace Ucname_hold_temp="new haven and northampton" if issuer_name=="New Haven a Nor. ref."
replace Ucname_hold_temp="new haven and northampton" if issuer_name=="New Haven a Nor. ref."
replace Ucname_hold_temp="pacific railroad" if issuer_name=="Pacific R. R. of Mo."
replace Ucname_hold_temp="pacific railroad" if issuer_name=="Pacific R. R. of Mo."
replace Ucname_hold_temp="wabash railroad" if issuer_name=="Wahash R. R. Det. & Chic. Ext."
replace Ucname_hold_temp="wilmington and weldon" if issuer_name=="Wilmington & Weldon gen."
replace Ucname_hold_temp="wilmington and weldon" if issuer_name=="Wilmington & Weldon"
replace Ucname_hold_temp="wilmington and weldon" if issuer_name=="Wilmington & Weldon gen."
replace Ucname_hold_temp="wilmington and weldon" if issuer_name=="Wilmington & Weldon"
replace Ucname_hold_temp="pennsylvania railroad" if issuer_temp=="pennsylvania"
replace division="philadelphia wilmington and baltimore" if issuer_name=="Pennsylvania R. R. P. B. & W. Coll."
replace division="east tennessee reorganization" if issuer_name=="So. Ry. E. Tenn."
replace division="buffalo and southwestern division" if issuer_name=="Erie R. R. Huff. & So'w. Div."
replace division="lehigh valley railway" if issuer_name=="Leh. Valley of N. Y."
replace Ucname_hold_temp="big sandy" if issuer_temp=="big sandy" & cname_hold_temp==""
replace Ucname_hold_temp="middletown horse" if issuer_temp=="middletown horse" & cname_hold_temp==""
replace Ucname_hold_temp="ontario and quebec" if issuer_temp=="ontario and quebec" & cname_hold_temp==""
replace Ucname_hold_temp="newburgh and new york" if issuer_temp=="newburg and new york" & cname_hold_temp==""
replace Ucname_hold_temp="greenville s" if issuer_temp=="greenville" & cname_hold_temp==""
replace Ucname_hold_temp="aroostook county maine" if issuer_temp=="aroostook county" & cname_hold_temp==""
replace Ucname_hold_temp="bells gap" if issuer_temp=="bell's gap" & cname_hold_temp==""
replace Ucname_hold_temp="piqua and troy branch" if issuer_temp=="piqua and troy bn." & cname_hold_temp==""
replace Ucname_hold_temp="new york texas and mexico" if issuer_temp=="new york tex. and mex." & cname_hold_temp==""
replace Ucname_hold_temp="newburgh new york" if issuer_temp=="newburg and new york" & cname_hold_temp==""
replace Ucname_hold_temp="norwich street" if issuer_temp=="norwich st." & cname_hold_temp==""
replace Ucname_hold_temp="new haven and northampton" if issuer_temp=="new haven and nor." & cname_hold_temp==""
replace Ucname_hold_temp="winchester ont" if issuer_temp=="winchester ave." & cname_hold_temp==""
replace Ucname_hold_temp="delaware river ferry" if issuer_temp=="delaware river" & cname_hold_temp==""
replace Ucname_hold_temp="traverse city michigan" if issuer_temp=="traverse city" & cname_hold_temp==""
replace Ucname_hold_temp="sanford and st petersburg" if issuer_temp=="sanford and s. pittsburg" & cname_hold_temp==""
replace Ucname_hold_temp="winchester avenue railroad" if issuer_temp=="winchester ave." & cname_hold_temp==""
replace Ucname_hold_temp="st lawrence and ottawa" if issuer_temp=="st. lawrence&ottawa" & cname_hold_temp==""
replace Ucname_hold_temp="new york lackawanna and western" if issuer_temp=="branford l. and w." & cname_hold_temp==""
replace Ucname_hold_temp="new york lackawanna and western" if issuer_temp=="new york l. and w. terminal" & cname_hold_temp==""
replace Ucname_hold_temp="pennsylvania and new york canal and railroad" if issuer_temp=="penn. and x. y. canal and" & cname_hold_temp==""
replace Ucname_hold_temp="pennsylvania and new york canal and railroad" if issuer_temp=="penn. and s. y. canal and r.r." & cname_hold_temp==""
replace Ucname_hold_temp="ogdensburg new york" if issuer_temp=="ogdenburg term" & cname_hold_temp==""

duplicates drop mst,force

keep tag_merge security salability rating parent_use parent other mst mis_cname miles maturity_temp maturity_hold_temp lien issuer_temp issuer_name interest_per_mile interest income factor_of_safety division coupon_temp coupon cname_hold_temp Ucname_hold_temp cname_division class_temp class
*rename cname_hold_temp cname_2
cap drop cname_hold_temp
rename Ucname_hold_temp cname_hold_temp

//cap drop _merge
//merge 1:1 mst using temp_ri.dta
save temp1.dta,replace

cd "$root_dta"
use temp1.dta,clear
******************************************************************
*Clean class & lien & division
******************************************************************
cd "$root_do"
global x="class_temp"
do rating_class.do
split $x, gen(rem_dup)
	forv i=2/7{
		forv j=1/`i'{
			replace rem_dup`i'="" if rem_dup`j'==rem_dup`i' & `i'!=`j'
		}
	}
	gen classs=rem_dup1
	forv i=2/7{
		replace classs=classs+" "+ rem_dup`i' if rem_dup`i'!=""
		}
	replace classs=strtrim(classs)
	replace classs=stritrim(classs)
	cap drop $x
	cap drop rem_dup*
	rename classs $x

cap drop lien_temp
gen lien_temp=lien
global x="lien_temp"
do rating_class.do
split $x, gen(rem_dup)
	forv i=2/3{
		forv j=1/`i'{
			replace rem_dup`i'="" if rem_dup`j'==rem_dup`i' & `i'!=`j'
		}
	}
	gen classs=rem_dup1
	forv i=2/3{
		replace classs=classs+" "+ rem_dup`i' if rem_dup`i'!=""
		}
	replace classs=strtrim(classs)
	replace classs=stritrim(classs)
	cap drop $x
	cap drop rem_dup*
	rename classs $x
	replace miles=lien_temp if lien_temp=="1223"
	replace lien_temp="" if lien_temp=="1223"
/************************************************************************
move anything in lien to class
*************************************************************************/
gen lien_temp_2=lien_temp
replace lien_temp=subinword(lien_temp,"first and second","",.)
replace lien_temp=subinword(lien_temp,"not mortgage","",.)
replace lien_temp=subinword(lien_temp,"not","",.)
replace lien_temp=subinword(lien_temp,"first","",.)
replace lien_temp=subinword(lien_temp,"second","",.)
replace lien_temp=subinword(lien_temp,"third","",.)
replace lien_temp=subinword(lien_temp,"fourth","",.)
replace lien_temp=subinword(lien_temp,"fifth","",.)
replace lien_temp=subinword(lien_temp,"sixth","",.)
replace class_temp=class_temp+" "+lien_temp
global x="class_temp"
split $x, gen(rem_dup)
	forv i=2/6{
		forv j=1/`i'{
			replace rem_dup`i'="" if rem_dup`j'==rem_dup`i' & `i'!=`j'
		}
	}
	gen classs=rem_dup1
	forv i=2/6{
		replace classs=classs+" "+ rem_dup`i' if rem_dup`i'!=""
		}
/*
replace class_temp=subinword(class_temp,"first","",.) if strpos(lien_temp,"first") & strpos(temp,"second") & !strpos(temp,"first")
replace class_temp=subinword(class_temp,"second","",.) if strpos(lien_temp,"second") & strpos(temp,"first") & !strpos(temp,"second")
replace class_temp=subinword(class_temp,"first","",.) if strpos(lien_temp,"first") & !strpos(temp,"first")
replace class_temp=subinword(class_temp,"first","",.) if strpos(lien_temp,"first") & !strpos(temp,"first")
*/
cap drop temp
drop lien_temp
rename lien_temp_2 lien_temp
	replace classs=strtrim(classs)
	replace classs=stritrim(classs)
	cap drop $x
	cap drop rem_dup*
	rename classs $x

/*************************************************************************
clean division
*************************************************************************/
replace division="louisville and nashville collateral" if division=="l. & n." & issuer_name=="Atl. Coast Line—L. & N."
replace division="pittsburgh junction and middle division" if division=="Pitts. Jc. & M. D." & issuer_name=="B. & O. Pitts. Jc. & M. D."
replace division="southwestern division" if division=="S.-W. Div." & issuer_name=="B. & O. S.-W. Div."
replace division="piscataquis division" if division=="pisca div." & issuer_name=="Bang. & Aroos. Pisca div."
replace division="middle georgia and atlantic division" if division=="Mid. Ga. & Atl. div." & issuer_name=="Cent. of Ga. Ry. Mid. Ga. & Atl. div."
replace division="macon and northern division" if division=="Macon & N. div" & issuer_name=="Cent. of Ga. Ry. Macon & N. div"
replace division="chattanooga division" if division=="chat. div. p.m." & issuer_name=="Cent. of Ga. Chat. div. P. M."
replace division="mobile division" if division=="mobile div." & issuer_name=="Cent. of Ga. Ry. Mobile div."
replace division="oconee division" if division=="oconee div." & issuer_name=="Cent. of Ga. Ry. Oconee div."
replace division="upper cahaba branch" if division=="Upper Cahaba Br." & issuer_name=="Cent. of Ga. Ry. Upper Cahaba Br."
replace division="richmond and allegheny division" if division=="R. & A. div." & issuer_name=="Ches Ohio R. & A. div."
replace division="peninsula extension" if division=="Penin Ex." & issuer_name=="Ches. & Ohio Penin Ex."
replace division="paint creek branch" if division=="Potts Cr. Br." & issuer_name=="Ches. & Ohio Potts Cr. Br."
replace division="warm springs branch" if division=="Warm Sp. Val. Br." & issuer_name=="Ches. & Ohio Warm Sp. Val. Br."
replace division="craig valley branch" if division=="Craig Val. Br." & issuer_name=="Ches. & Ohio Craig Val. Br."
replace division="extension" if division=="Extension" & issuer_name=="Chic. & No. W. Extension"
replace division="madison" if division=="Madison ext." & issuer_name=="Chic. & Nor. W. Madison ext."
replace division="menominee" if division=="Menom, Ext" & issuer_name=="Chic & No. W. Menom, Ext"
replace division="illinois division" if division=="ill. div." & issuer_name=="C. B. & Q. Ill. Div."
replace division="iowa division" if division=="ia. div." & issuer_name=="C. B. & Q. Ia. Div."
replace division="southwestern division" if division=="So-w. Div." & issuer_name=="C. Q. & Q. So-w. Div."
replace division="nebraska extension" if division=="neb. Exten." & issuer_name=="C. B. & Q. Neb. Exten."
replace division="denver extension" if division=="denver exctension" & issuer_name=="C. B. & Q. Denver Exten."
replace division="wisconsin and minnesota division" if division=="Wisc. & Minn. div." & issuer_name=="C. M. & St. Paul Wisc. & Minn. div."
replace division="dubuque division" if division=="dubuque div." & issuer_name=="G. M. & St. Paul Dubuque div."
replace division="mineral point division" if division=="Mineral Point div." & issuer_name=="C M & St. Paul Mineral Point div."
replace division="hastings and dakota division" if division=="Hastings & Dak. Ex" & issuer_name=="C. M. & St. Paul Hastings & Dak. Ex"
replace division="chicago and pacific west division" if division=="Chic. & Pcf. West div." & issuer_name=="C. M. & St. Paul Chic. & Pcf. West div."
replace division="southwestern division" if division=="Southwestern div." & issuer_name=="C. M. & St. Paul Southwestern div."
replace division="wisconsin valley division" if division=="Wisc. Valley div." & issuer_name=="C. M. & St. Paul Wisc. Valley div."
replace division="la crosse and davenport division" if division=="La Croose & Dav. div." & issuer_name=="C M. & St. Paul La Croose & Dav. div."
replace division="chicago and pacific division" if division=="Chic. & Pcf. div." & issuer_name=="C. M. & St Paul Chic. & Pcf. div."
replace division="southern minnesota division" if division=="Southern Minn. div." & issuer_name=="C. M. & St. Paul Southern Minn. div."
replace division="chicago and missouri river division" if division=="Chic. & M Riv. div." & issuer_name=="C. M. & St. Paul Chic. & M Riv. div."
replace division="memphis division" if division=="memphis div." & issuer_name=="Chic. St. L. & N. O. Memphis Div."
replace division="cairo division" if division=="cairo div." & issuer_name=="C. C. C. & St. L. Cairo Div."
replace division="st louis division" if division=="div." & issuer_name=="C. C. C. & St. Louis Div."
replace division="springfield and columbus division" if division=="Sp'fld. & Col. Div." & issuer_name=="C. C. C. & St. L. Sp'fld. & Col. Div."
replace division="cincinnati wabash and michigan division" if division=="Cin. Wab. & Mich. Div." & issuer_name=="C. C. C. & St. L. Cin. Wab. & Mich. Div."
replace division="northern division" if division=="n div." & issuer_name=="Eastern Ry. of Minn. N Div."
replace division="pennsylvania collateral" if division=="Penn. Coal" & issuer_name=="Erie R. R Penn. Coal"
replace division="sullivan county coal branch" if division=="Sull County C. Br." & issuer_name=="Evans. & T. H. Sull County C. Br."
replace division="mt vernon branch" if division=="Mt. Vernon Br." & issuer_name=="Evans. & T. H. Mt. Vernon Br."
replace division="tort huron division" if division=="Port H. Div." & issuer_name=="Flint & P. M. Port H. Div."
replace division="toledo division" if division=="toledo div." & issuer_name=="Flint & P. M. Toledo div."
replace division="mexican and pacific extension" if division=="Hex. & Pcf. ext." & issuer_name=="Gal. Harris. & San Ant. Hex. & Pcf. ext."
replace division="louisville division and terminal" if division=="louisville div. & term." & issuer_name=="Ill. Cent. Louisville Div. & Term."
replace division="western line" if division=="Western Lines" & issuer_name=="Ill. Cent. Western Lines"
replace division="st louis division and terminal" if division=="l. div. & term." & issuer_name=="Ill. Cent. St. L. Div. & Term."
replace division="litchfield division" if division=="litchfield div." & issuer_name=="Ill. Cent. Litchfield Div."
replace division="omaha division" if division=="omaha div." & issuer_name=="Ill. Cent. Omaha Div."
replace division="springfield division" if division=="Springfield division" & issuer_name=="Illinois Central Springfield Trust"
replace division="new orleans and mobile division" if division=="N. O. & Mobile div." & issuer_name=="L. & N.-N. O. & Mobile div."
replace division="pensacola division" if division=="pensacola div." & issuer_name=="L. & N. Pensacola div."
replace division="evansville henderson and nashville division" if division=="E. Hend. & Nash. div" & issuer_name=="L. & N.-E. Hend. & Nash. div"
replace division="monon joint collateral" if division=="Southern-Monon" & issuer_name=="Lou & Nash. Southern-Monon"
replace division="michigan division" if division=="mich. dir." & issuer_name=="Mil. Lake Sh. & W. Ry. Mich. Dir."
replace division="ashland division" if division=="ashland div." & issuer_name=="Mil. Lake Sh. & W. Ry. Ashland Div."
replace division="marshfield extension" if division=="mansfield extension" & issuer_name=="Mil. Lake Sh. & W. Mansfield Ext."
replace division="southwestern extension" if division=="So'w. Ext." & issuer_name=="Minn. & St. L. So'w. Ext."
replace division="iowa extension" if division=="Iowa Ext." & issuer_name=="Minn. & St. L. Iowa Ext."
replace division="pacific extension" if division=="Pacific Ext." & issuer_name=="Minn & St. L. Pacific Ext."
replace division="st louis division" if division=="louis div." & issuer_name=="M. K. & Texas St. Louis Div."
replace division="lexington division" if division=="lexington div." & issuer_name=="Missouri Pcf. Lexington Div."
replace division="montgomery division" if division=="montg. div." & issuer_name=="Mobile & Ohio Montg. Div."
replace division="collateral st louis and cairo" if division=="St. L. & Cairo" & issuer_name=="Mobile & Ohio St. L. & Cairo"
replace division="lebanon branch" if division=="Lebanon Br." & issuer_name=="Nash. C. & St. L. Lebanon Br."
replace division="centreville branch" if division=="Centreville Br." & issuer_name=="Nash. C. & St. L. Centreville Br."
replace division="jasper branch" if division=="Jasper Br. Ex." & issuer_name=="Nash. C. & St. L. Jasper Br. Ex."
replace division="tracy city branch" if division=="Tracy City Br." & issuer_name=="Nash. C. & St. L. Tracy City Br."
replace division="new river division" if division=="new river div." & issuer_name=="Norfolk & W. R. R. New River Div."
replace division="st paul-duluth division" if division=="St. P. & Dul. Div." & issuer_name=="Northern Pacific Ry. St. P. & Dul. Div."
replace division="missouri st louis city real estate" if division=="st. l. r. est" & issuer_name=="Pacific R. R. of Mo. St. L. R. Est"
replace division="missouri carondelet branch" if division=="caron bch." & issuer_name=="Pacific R. R. of Mo. Caron Bch."
replace division="delaware river terminal extension" if division=="extd. p. m." & issuer_name=="Del. River Term, Extd. P. M."
replace division="delaware river terminal" if division=="extd. p. m." & issuer_name=="Del. River Term, Extd. P. M."
replace division="atlanta-birmingham division" if division=="Ala. & Birm." & issuer_name=="Seaboard A. L. Ala. & Birm."
replace division="memphis division" if division=="Memphis Div" & issuer_name=="Southern Ry. Memphis Div"
replace division="mobile and ohio collateral" if division=="Mobile & O." & issuer_name=="Southern Ry. Mobile & O."
replace division="central division" if division=="central div." & issuer_name=="St. L. & San. Fran. Central Div."
replace division="northwestern division" if division=="Nor. W. div." & issuer_name=="St. L. & San Fran. Nor. W. div."
replace division="southwestern division" if division=="S. W. div." & issuer_name=="St. L. & San Fran. S. W. div."
replace division="river and gulf division" if division=="river & gulf div." & issuer_name=="St. Louis, Iron Mt. River & Gulf div."
replace division="dakota extension" if division=="dakota ex." & issuer_name=="St. Paul, M. & M. Dakota Ex."
replace division="dallas division" if division=="dallas div." & issuer_name=="Tex. & N. O. Dallas div."
replace division="louisiana division" if division=="Lou. Div. Br. Line" & issuer_name=="Texas & Pacific Lou. Div. Br. Line"
replace division="st mary division" if division=="St. Mary's div." & issuer_name=="Toledo & Ohio C. St. Mary's div."
replace division="western division" if division=="West, Div" & issuer_name=="Tol. & Ohio C. West, Div"
replace division="detroit and chicago extension" if division=="Det. & Chic. Ext." & issuer_name=="Wahash R. R. Det. & Chic. Ext."
replace division="omaha division" if division=="Omaha Div." & issuer_name=="Wabash R. R. Omaha Div."
replace division="toledo and chicago division" if division=="Toledo & Chic. Div." & issuer_name=="Wabash R. R. Toledo & Chic. Div."
replace division="des moines division" if division=="DesM. div." & issuer_name=="Wabash R. R. DesM. div."
replace division="marshfield and southeastern division" if division=="Marsh. & S. E. Div." & issuer_name=="Wisconsin Cent. Marsh. & S. E. Div."
replace division="superior and duluth division and terminal" if division=="Sup. & Dul. term." & issuer_name=="Wisconsin Cent. Sup. & Dul. term."


/**************************************************************
Create maturity/coupon_min/max
**************************************************************/

rename maturity_temp maturity_temp
rename maturity_hold_temp maturity
replace maturity_temp="1913" if maturity_temp=="1713"
split maturity_temp, gen(cop) parse("&" "-")
gen maturity_min=cop1
gen maturity_max=cop1
replace maturity_max=cop2 if cop2!=""

replace maturity_min="" if maturity_min=="Irred"
replace maturity_max="" if maturity_max=="Irred"
cap drop cop*
destring maturity_*, replace

split coupon_temp, gen(cop) parse("&" "-")
gen coupon_min=cop1
gen coupon_max=cop1
forv i=2/3{
	replace coupon_max=cop`i' if cop`i'!=""
}
cap drop cop*
destring coupon_*, replace
/*
replace parent_use=subinstr(parent_use,"&","and",.)
replace parent_use=subinstr(parent_use,",","",.)
replace parent_use=subinstr(parent_use,"company","",.)
gen tag_mismatch=1 if cname_hold_temp==""
replace cname_hold_temp=parent_use if cname_hold_temp==""
*/

foreach v of varlist _all {
	local j="`v'"+"_rate"
     rename `v' `j'
	 macro drop j
   }
rename cname_hold_temp_rate cname_hold_temp
cap drop mis_cname tag_merge 
replace class_temp_rate=subinstr(class_temp_rate,"second","",.) if strpos(class_temp_rate,"first") & strpos(class_temp_rate,"second") & strpos(lien_rate,"2")
replace class_temp_rate=subinstr(class_temp_rate,"first","",.) if strpos(class_temp_rate,"first") & strpos(class_temp_rate,"second") & strpos(lien_rate,"1")
cd "$root_dta"
save rating_merge.dta,replace
cd "$root_dta"
use rating_merge.dta,clear
/**************************************************************
Merge with holdings data using issuer_id
**************************************************************/
sort cname_hold_temp
tempfile y
save "`y'"
keep cname_hold_temp
duplicates drop
cap drop _merge
merge 1:m cname_hold_temp using temp.dta
keep if _merge==3
keep cname_hold_temp id_issuer_nl
duplicates drop
*drop if cname_hold_temp==""
merge 1:m cname_hold_temp using "`y'"
cap drop _merge


tempfile x
save "`x'"
use temp_stk.dta,clear
drop _merge
joinby cname_hold_temp using "`x'", unmatched(master)
save join_result2.dta,replace
*/
/**************************************************************
Merge with holdings data using only cname
**************************************************************
tempfile x
save "`x'"
use temp_stk.dta,clear
cap drop _merge
joinby cname_hold_temp using "`x'", unmatched(master)
save join_result.dta,replace
*/
/**************************************************************
Match coupon, maturity, division & class
**************************************************************/
use join_result2.dta,clear
global tir "tag_class_weak"
*tag_class_strp
*tag_class_stg
set more off
rename mst_rate id_rate
*rename use id_hold
*
bysort cname_hold_temp : egen co=nvals(id_rate)
gen tag_cop=cond(coupon_max_rate<=coupon_max & coupon_min_rate>=coupon_min,1,0)
replace tag_cop=1 if coupon_max_rate>=coupon_max & coupon_min_rate<=coupon_min
gen tag_mat=cond(maturity_max_rate<=maturity_max & maturity_min_rate>=maturity_min,1,0)
replace tag_mat=1 if maturity_max_rate>=maturity_max & maturity_min_rate<=maturity_min
/*
release matching rule to: if |maturity_rate-maturity_hold|<2
replace tag_mat=1 if abs(maturity_max_rate-maturity_max)<=2 & abs(maturity_min_rate-maturity_min)<=2
*/

*division
gen tag_division=cond(strpos(cname_hold_temp,division_rate),1,0)
replace class_hold_temp=lower(class_hold_temp)
replace tag_division=1 if strpos(class_hold_temp,division_rate)
bysort id_hold: egen max_d=max(tag_division)
*class

/*The idea of matching class (rough method):
1) class_DS1 is included in class_DS2
2) if class_hold includes collateral-related info & class_rate includes "collateral"
3) if either class_hold or class_rate is missing & no other matches exist for this issue
4)
*/
replace class_temp_rate="n/a" if class_temp_rate==""
replace class_type="n/a" if class_type==""
gen class_hold_use=class_type if class_type!="n/a"
replace class_hold_use=class_hold_use+" "+"trans line" if strpos(class_hold_temp,"transcontinental short line")
replace class_hold_use=class_hold_use+" "+"trans line" if strpos(stock_type_temp,"trans line") & !strpos(class_hold_use,"trans line")
replace class_hold_use=class_hold_use+" "+"trans line" if strpos(class_hold_temp,"trans line") & !strpos(class_hold_use,"trans line")
replace class_hold_use=class_hold_use+" "+"leased line" if strpos(stock_type_temp,"leased line") & !strpos(class_hold_use,"leased line")
replace class_hold_use=class_hold_use+" "+"leased line" if strpos(class_hold_temp,"leased line") & !strpos(class_hold_use,"leased line")
replace class_hold_use=class_hold_use+" "+"trust" if strpos(stock_type_temp,"trust") & !strpos(class_hold_use,"trust")
replace class_hold_use=class_hold_use+" "+"trust" if strpos(class_hold_temp,"trust") & !strpos(class_hold_use,"trust")
replace class_hold_use=class_hold_use+" "+"loan" if strpos(stock_type_temp,"loan") & !strpos(class_hold_use,"loan")
replace class_hold_use=class_hold_use+" "+"loan" if strpos(class_hold_temp,"loan") & !strpos(class_hold_use,"loan")

replace class_hold_use=class_hold_use+" "+"equipment" if strpos(class_hold_temp,"equipment") & !strpos(class_hold_use,"equipment")
replace class_hold_use=class_hold_use+" "+"equipment" if strpos(class_hold_temp,"equipment") & !strpos(class_hold_use,"equipment")
replace class_hold_use=class_hold_use+" "+stock_type_temp if stock_type_temp!="n/a"
*replace class_hold_use=subinword(class_hold_use,"equipment","collateral",.)
*replace class_hold_use=subinword(class_hold_use,"car","collateral",.)
*replace class_hold_use=subinword(class_hold_use,"cable","collateral",.)
replace class_hold_use=subinword(class_hold_use,"consolidated","con",.)
replace class_hold_use=subinword(class_hold_use,"convertible","con",.)
replace class_hold_use=subinword(class_hold_use,"bonds","",.)
replace class_hold_use=subinword(class_hold_use,"securities","",.)
replace class_hold_use=subinword(class_hold_use,"various","",.)
replace class_hold_use=subinword(class_hold_use,"serial","",.)
replace class_hold_use=subinword(class_hold_use,"con","cons",.)
replace class_temp_rate=subinword(class_temp_rate,"con","cons",.)
replace class_hold_use=regexr(class_hold_use,"\(.+\)","")
replace class_hold_use=strtrim(class_hold_use)
replace class_hold_use=stritrim(class_hold_use)
replace class_hold_use="n/a" if class_hold_use==""

cap drop tag_class_weak 
cap drop tag_class_stg 
cap drop hold1 rate1 thold trate
global m=1
gen tag_class_weak=0
gen tag_class_stg=1
gen thold=0
gen trate=0
foreach i in "first" "cons" "second" "general" "debenture" "refund" "collateral" "sink fund" "guaranteed" "certificate" "exten" "debenture" "joint" "line" "gold" "equipment" "trust" "loan"{
	gen hold$m=cond(strpos(class_hold_use,"`i'"),1,0)
	gen rate$m=cond(strpos(class_temp_rate,"`i'"),1,0)
	replace tag_class_stg=0 if hold$m!=rate$m
	replace tag_class_weak=1 if hold$m==1 & rate$m==1
	replace thold=thold+hold$m
	replace trate=trate+rate$m
	cap drop hold$m
	cap drop rate$m
	global m=$m+1
}

replace tag_class_stg=0 if _merge!=3
replace tag_class_weak=0 if _merge!=3

cap drop tag_class_strp
gen tag_class_strp=cond(strpos(class_hold_temp,class_temp_rate),1,0)
replace tag_class_strp=1 if strpos(stock_type_temp,class_temp_rate)
replace tag_class_strp=1 if strpos(class_hold_use,class_temp_rate)
replace tag_class_strp=1 if strpos(class_temp_rate,"collateral") & (tag_class==6|tag_class==16|tag_class==36)
/*
replace tag_class_strp=1 if strpos(class_type,class_temp_rate)
replace tag_class_strp=1 if strpos(class_temp_rate,class_hold_temp)
replace tag_class_strp=1 if strpos(class_temp_rate,class_type)
replace tag_class_strp=1 if strpos(class_temp_rate,stock_type_temp)
*/
cap drop tag_class_match
rename $tir tag_class_match
replace tag_class_match=1 if class_hold_use=="n/a" & class_temp_rate=="n/a"

cap drop max_d2
bysort id_hold: egen max_d2=max(tag_class_match)
replace tag_class_match=1 if class_hold_use=="n/a" & class_temp_rate=="n/a"
replace tag_class_match=1 if class_temp_rate=="n/a" & max_d2==0
replace tag_class_match=1 if class_hold_use=="n/a" & max_d2==0
replace tag_class_match=1 if thold==0 & trate==0
cap drop thold trate 
cap drop max_d2


save temp_tag.dta,replace
//strdist class_type class_temp_rate, gen(distance_class)

*overall matching score
/*
use temp_tag.dta,clear
*/
cap drop tag_total
gen tag_total=max(tag_cop+tag_mat+tag_division+tag_class_match-3,0)
//gen tag_total=max(tag_cop+tag_mat-1,0)
replace tag_total=0 if _merge!=3
bysort id_hold: egen count_match=total(tag_total)
/*release matching standard for maturity when no matches exists*/
replace tag_mat=1 if abs(maturity_max_rate-maturity_max)<=2 & abs(maturity_min_rate-maturity_min)<=2 & count_match==0
replace tag_cop=1 if coupon_hold_temp=="n/a" & count_match==0
replace tag_mat=1 if maturity_hold_temp=="n/a" & count_match==0
replace tag_cop=1 if coupon_temp_rate=="" & count_match==0
replace tag_mat=1 if (maturity_temp_rate==""|maturity_temp_rate=="Irred") & count_match==0
replace tag_division=1 if division_rate=="" & count_match==0
replace tag_division=1 if class_hold_temp=="n/a" & & count_match==0
replace tag_division=1 if tag_class!=3 & tag_class!=13 & tag_class!=36 & count_match==0
*replace tag_class_match=1 if class_temp_rate=="n/a" & count_match==0
*replace tag_class_match=1 if class_hold_use=="n/a" & count_match==0
*replace tag_class_match=1 if thold==0 & trate==0
cap drop thold trate
cap drop tag_total count_match
//gen tag_total=max(tag_cop+tag_mat-1,0)
gen tag_total=max(tag_cop+tag_mat+tag_division+tag_class_match-3,0)
replace tag_total=0 if _merge!=3
replace tag_total=0 if is_stock==1
replace rating_rate="" if is_stock==1
bysort id_hold: egen count_match=total(tag_total)
*replace tag_total=0 if industry=="Government"
//bysort id_hold: egen temp_id=nvals(is_stock)
//replace tag_total=0 if coupon_hold_temp=="n/a" & maturity_hold_temp=="n/a" & count_match>1 
//& temp_id!=1
replace rating_rate="" if tag_total==0
replace rating_rate_stk="" if rating_rate!="" & is_bond!=0
cap drop count_match
bysort id_hold: egen count_match=total(tag_total)
*replace tag_total=max(tag_cop+tag_mat-1,0) if count_match==0 & _merge==3
*cap drop count_match
*bysort id_hold: egen count_match=total(tag_total)

cap drop dup
gen dup=0
*foreach i in "salability_rate" "security_rate" "factor_of_safety_rate" "interest_per_mile_rate" "income_rate" "miles_rate" "interest_rate" "rating_rate" "miles_rate"{
*foreach i in "salability_rate" "security_rate" "factor_of_safety_rate" "interest_rate" "rating_rate" "miles_rate"{
foreach i in "rating_rate" {
cap drop countv_`i'
bysort id_hold: egen countv_`i'=nvals(`i') if tag_total==1 
replace countv_`i'=0 if countv_`i'==.
replace dup=1 if count_match>1 & countv_`i'>1
cap drop countv_`i' 
}


/*
codebook id_issue_std if dup==1 & count_match>1
tab count_match if industry_temp=="Railway Railroad"
codebook id_issue_std if count_match>1
*/
cap drop keep arrr
gen keep=0
replace keep=1 if tag_total>0
replace keep=1 if _merge!=3
bysort id_hold: gen arrr=_n
replace keep=2 if count_match==0 & arr==1
keep if keep>0

sort id_hold
//browse rating_rate cname_hold_temp id_hold maturity_hold_temp maturity_temp_rate coupon_hold_temp coupon_temp_rate/*
//*/ class_hold_use class_temp_rate division_rate cname_hold_temp if count_match>1 & tag_total>0 & dup>0 //& class_hold_use!="n/a"

bysort id_rate: egen max_temp=max(tag_total)
codebook id_rate if max_temp==0 & _merge==3

bysort id_rate: egen ct_m=nvals(id_issue_std) if tag_total==1


cap drop tag_dup 
cap drop id_hold_drop
bysort id_hold: gen tag_dup=_N
replace tag_dup=cond(tag_dup>1,1,0)

foreach i in "id_mtr" "count_str" "cuse2" "investor_type" "min_mat_year_hold" "max_mat_year_hold" "min_coupon_hold" "max_coupon_hold" "id_coupon_temp" "id_issue_d" "cname_division" "coupon_max" "coupon_min" "maturity_max" "maturity_min" "dummy_investor_state_use" "dummy_investor_city_use" "cname_division_rate" "maturity_min_rate" "maturity_max_rate" "coupon_min_rate" "coupon_max_rate" "co" "" "max_d" "tag_class_stg" "tag_class_strp" "max_d2" "arrr" "keep" "tag_dup" "tag_class_strp" "tag_class_stg" "tag_class_match" "max_d" "tag_mat" "tag_cop" "co" "cname_division_rate" "_merge" "keep" "arrr" {
cap drop `i'
}


cd "$root_dta"
saveold Holding_Rating_Merged.dta,replace

/*
use Holding_Rating_Merged.dta,clear

*check for not-merged rating entries

bysort id_rate: egen max=max(tag_total)
browse id_rate id_issue_std cname_hold_temp count_match invname_hold_temp class_hold_use class_hold_temp class_temp_rate coupon_hold_temp coupon_temp_rate maturity_hold_temp maturity_temp_rate book_year_hold division_rate id_rate tag_cop  tag_mat tag_class_match tag_division if _merge==3 & max==0 & is_stock!=1 & industry_temp=="Railway Railroad" & tag_class_match!=0

sort id_hold
browse id_rate id_issue_std ct_m cname_hold_temp count_match invname_hold_temp class_hold_use class_hold_temp class_temp_rate coupon_hold_temp coupon_temp_rate maturity_hold_temp maturity_temp_rate book_year_hold division_rate id_rate tag_cop  tag_mat tag_class_match tag_division if _merge==3 & count_match>1 & dup==1

browse id_rate id_issue_std ct_m cname_hold_temp invname_hold_temp class_hold_use class_hold_temp class_temp_rate coupon_hold_temp coupon_temp_rate maturity_hold_temp maturity_temp_rate book_year_hold division_rate tag_cop tag_mat tag_class_match tag_division issuer_temp_rate class_rate lien_rate income_rate interest_per_mile_rate factor_of_safety_rate security_rate salability_rate rating_rate if _merge==3 & count_match>1 & dup==1


bysort id_rate: egen max_temp=max(tag_total)
codebook id_rate if max_temp==0 & _merge==3

bysort id_rate: egen max_stk=nvals(is_stock)




/*****************************************************************************
Merge with stock_ratings
*****************************************************************************/
use temp, clear
joinby cname_hold_temp using rating_merge_stk.dta, unm(master)
gen class_hold_use=class_hold_temp if class_hold_temp!="n/a"
replace class_hold_use=class_hold_use+" "+stock_type_temp if stock_type_temp!="n/a"
replace class_hold_use=subinword(class_hold_use,"stock","",.)
replace class_hold_use=subinword(class_hold_use,"securities","",.)
replace class_hold_use=subinword(class_hold_use,"various","",.)
*replace class_hold_use=subinword(class_hold_use,"transcontinental short line","",.)
replace class_hold_use=subinword(class_hold_use,"hampshire","",.)
*replace class_hold_use=subinword(class_hold_use,"leased line stock","",.)
replace class_hold_use=subinword(class_hold_use,"serial","",.)
replace class_hold_use=regexr(class_hold_use,"\(.+\)","")
replace class_hold_use=strtrim(class_hold_use)
replace class_hold_use=stritrim(class_hold_use)
replace class_hold_use="n/a" if class_hold_use==""

gen tag_class_match=cond(strpos(class_hold_use,class_temp_rate),1,0)
replace tag_class_match=1 if strpos(class_temp_rate,class_hold_use)

bysort id_hold: egen max_d2=max(tag_class_match)
replace tag_class_match=1 if class_hold_use=="n/a" & class_temp_rate=="n/a" & is_stock!=0 
replace tag_class_match=1 if class_temp_rate=="n/a" & max_d2==0 & is_stock!=0
replace tag_class_match=1 if class_hold_use=="n/a" & max_d2==0 & is_stock!=0
replace tag_class_match=0 if _merge!=3

gen tag_total=tag_class_match
replace tag_total=0 if _merge!=3
replace tag_total=0 if is_stock==0
bysort id_hold: egen count_match=total(tag_total)
bysort id_hold: egen cotv=nvals(rating_rate)
replace cotv=0 if cotv==.
gen dup=0
replace dup=1 if count_match>1 & cotv>1
replace rating_rate="" if tag_total==0

cap drop max
bysort id_rate_stk: egen max=max(count_match)
codebook id_rate_stk if _merge==3 & max<1 & is_stock!=0

cap drop keep arrr
gen keep=0
replace keep=1 if tag_total>0
replace keep=1 if _merge!=3
bysort id_hold: gen arrr=_n
replace keep=2 if count_match==0 & arr==1

keep if keep>0

cap drop arrr
bysort id_hold: gen id_hold_dup=_n
replace id_hold_dup=cond(id_hold_dup==1,0,1)

drop issuer_id_rate max_d2 cotv max com keep tag_class_match

foreach i in "issuer_name_rate" "class_rate" "class_hold_use" "tag_total" "count_match" "rating_rate" "class_temp_rate" "_merge" {
	rename `i' `i'_stk
}

label var id_hold_dup "equals 1 if multiple matches in rating & holding"

save temp_stk.dta, replace
*browse class_hold_use class_temp_rate is_bond is_stock max_d2 id_hold tag_class_match  _merge if _merge==3 & tag_total!=1 & is_bond==0 & max_d2==0

*foreach i in "certificates" "common" "first" "preferred" "guaranteed"


/*
gen tag_class=1  

/*
reclink2 cname_hold_temp using temp.dta, idm(mst) idu(use) gen(rec_scr) required(cname_hold_temp)
replace _merge=1 if cname_hold_temp=="" 

sort cname_hold_temp
duplicates drop cname_hold_temp Ucname_hold_temp, force
browse cname_hold_temp Ucname_hold_temp rec_scr if rec_scr!=1 & Ucname_hold_temp!=""


replace _merge=1 if cname_hold_temp==""
replace _merge=1 if Ucname_hold_temp==""
save temp_ri.dta,replace
*duplicates drop use, force

*reclink2 cname_hold_temp maturity_hold_temp using temp.dta, idm(mst) idu(use) gen(rec_scr) required(maturity_hold_temp)
replace Ucname_hold_temp="" if cname_hold_temp==""
codebook mst if Ucname_hold_temp!=""
codebook mst if Ucname_hold_temp==""
*duplicates drop cname_hold_temp maturity_hold_temp,force
