*004
/*

*When they incorrectly type in the other bond-relating information
keep if strpos(cname_hold_orig, "'s")
keep cname_hold_clean cname_hold_temp cname_hold_orig 
duplicates drop cname_hold_temp, force

gen cname_hold_orig2=cname_hold_orig

forvalues i=0/9{
replace cname_hold_orig=subinstr(cname_hold_orig,"`i'","",.)
}

replace cname_hold_orig=subinstr(cname_hold_orig,"/'s","",.)
replace cname_hold_orig=subinstr(cname_hold_orig,"'s","",.)
replace cname_hold_orig=subinstr(cname_hold_orig,"COMPANY","",.)
replace cname_hold_orig=subinstr(cname_hold_orig,"COMPANY","",.)

drop cname_hold_temp
rename cname_hold_orig cname_hold_temp
rename cname_hold_orig2 cname_hold_orig

*2.Tranfer the upper case into lower case
replace cname_hold_temp=strlower(cname_hold_temp)
label var cname_hold_temp "temporary variable constructed to clean issuer name variable"
capture drop tag issuer_num

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

*5. move parentheses
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


*8.Replace multiple blanks
replace cname_hold_temp=stritrim(cname_hold_temp)

*9.Remove trailing and leading spaces
replace cname_hold_temp=strtrim(cname_hold_temp)

*10. Replace ry & rr, ryand by "ry and"
replace cname_hold_temp=subinstr(cname_hold_temp," ry"," railway",.)
replace cname_hold_temp=subinstr(cname_hold_temp," rr"," railroad",.)


keep cname_*
sort cname_hold_orig
tempfile t
save "`t'"

*use HoldingsData_IssuerName_match2.dta, clear
sort cname_hold_orig
merge m:n cname_hold_orig using "`t'"
drop _merge

*save HoldingsData_IssuerName_match2.dta, replace

Cross-check whether coupon info. is missing

keep if strpos(cname_hold_orig, "'s")
keep cname_hold_orig coupon_hold stock_type_hold maturity_year_hold
*/

*Replace

replace stock_type_hold ="sub" if cname_hold_orig=="ALLEN 5's, Sub ,,"
replace stock_type_hold ="N/A" if cname_hold_orig=="ATHENS, TENAS, 5's 1949"
replace stock_type_hold ="N/A" if cname_hold_orig=="ATHENS, TENN, 6's 1928"
replace stock_type_hold ="N/A" if cname_hold_orig=="BROWN FOLDING MACHINE COMPANY 6's"
replace stock_type_hold ="N/A" if cname_hold_orig=="CALDWELL, N J , 41/2's, 1929"
replace stock_type_hold ="N/A" if cname_hold_orig=="CAPE BRETON REAL ESTATE COMPANY 51/2's, 1911"
replace stock_type_hold ="N/A" if cname_hold_orig=="CAPE BRETON REAL ESTATE COMPANY 6's, 1914"
replace stock_type_hold ="N/A" if cname_hold_orig=="CAPE MAY ILLUMINATING GAS COMPANY 5's, 1930"
replace stock_type_hold ="" if cname_hold_orig=="CATAWBA RIVER POWER COMPANY 51/2's, 1920"
replace stock_type_hold ="N/A" if cname_hold_orig=="CATSKILL, N Y, 5's"
replace stock_type_hold ="" if cname_hold_orig=="CEDAR HOLLOW COMPANY 5's"
replace stock_type_hold ="" if cname_hold_orig=="CELADON TERRA COTTA COMPANY 6's, 1909"
replace stock_type_hold ="" if cname_hold_orig=="CENTRAL CALIFORNIA GAS AND ELECTRIC CORPORATION 5's"
replace stock_type_hold ="" if cname_hold_orig=="CENTRAL CITY WATER COMPANY 6's"
replace stock_type_hold ="" if cname_hold_orig=="CENTRAL COAL AND COKE COMPANY 6's"
replace stock_type_hold ="" if cname_hold_orig=="CENTRAL COAL AND COKE COMPANY 6's"
replace stock_type_hold ="" if cname_hold_orig=="CENTRAL CONSUMERS COMPANY 5's"
replace stock_type_hold ="" if cname_hold_orig=="CENTRAL MARKET HOUSE (York, Pa ) 4's, 1909"
replace stock_type_hold ="" if cname_hold_orig=="CENTRAL NORMAL SCHOOL ASSOCIATION 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="CHESTER TRACTION 5's, 1914"
replace stock_type_hold ="N/A" if cname_hold_orig=="CINCINNATI INDIANAPOLIS ST LOUIS AND CHICAGO, 6's, 1920"
replace stock_type_hold ="N/A" if cname_hold_orig=="CINCINNATI INDIANAPOLIS ST LOUIS AND CHICAGO, 6's, 1920"
replace stock_type_hold ="N/A" if cname_hold_orig=="CINCINNATI LEBANON AND NORTHERN 4's 1942"
replace stock_type_hold ="N/A" if cname_hold_orig=="CISCO, TEX , 5's, 1947"
replace stock_type_hold ="N/A" if cname_hold_orig=="CITY ELECTRIC COMPANY 5's, 1937"
replace stock_type_hold ="" if cname_hold_orig=="COALINGA OIL COMPANY 5's"
replace stock_type_hold ="" if cname_hold_orig=="CONGREGATION SHERITH ISRAEL 5's"
replace stock_type_hold ="" if cname_hold_orig=="CONSOLIDATED GAS COMPANY (West Virginia) 6's"
replace stock_type_hold ="" if cname_hold_orig=="COOK AND COMPANY INC , 5's"
replace stock_type_hold ="" if cname_hold_orig=="CORPUS CHRISTI WATER WORKS 5's, 1938"
replace stock_type_hold ="N/A" if cname_hold_orig=="COTTONWOOD COUNTY, MINN , 5's"
replace stock_type_hold ="" if cname_hold_orig=="CRAMP AND SONS (THE WILLIAM) SHIP AND ENGINE BUILDING COMPANY's"
replace stock_type_hold ="" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace stock_type_hold ="" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace stock_type_hold ="" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace stock_type_hold ="" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace stock_type_hold ="" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace stock_type_hold ="" if cname_hold_orig=="CRUCIBLE STEEL COMPANY 6's"
replace stock_type_hold ="N/A" if cname_hold_orig=="DELPHI, IND , 5's"
replace stock_type_hold ="" if cname_hold_orig=="DEWEES (W ) WOOD COMPANY 5's, 1910"
replace stock_type_hold ="N/A" if cname_hold_orig=="DORCHESTER COUNTY MD, 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="FAIRMOUNT PARK TRANSPORTATION 5's, 1937"
replace stock_type_hold ="" if cname_hold_orig=="FIRST NATIONAL BANK 6's, Brandon, Vt"
replace stock_type_hold ="" if cname_hold_orig=="FIRST NATIONAL BANK 6's, Brandon, Vt"
replace stock_type_hold ="" if cname_hold_orig=="FOREST A 5's, 1910"
replace stock_type_hold ="N/A" if cname_hold_orig=="FRANKFORD, N Y , 's"
replace stock_type_hold ="N/A" if cname_hold_orig=="GAS LIGHT COMPANY (Galena, Ill 4's)"
replace stock_type_hold ="N/A" if cname_hold_orig=="GERMANIA, IA , 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="GERMANTOWN, N Y , 's"
replace stock_type_hold ="N/A" if cname_hold_orig=="GERMANTOWN, N Y , 4's"
replace stock_type_hold ="N/A" if cname_hold_orig=="GEYSERVILLE, SONOMA COUNTY CAL , 5's, School District"
replace stock_type_hold ="" if cname_hold_orig=="HARWOOD ELECTRIC POWER COMPANY 5's, 1937"
replace stock_type_hold ="" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace stock_type_hold ="" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace stock_type_hold ="" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace stock_type_hold ="" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace stock_type_hold ="" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace stock_type_hold ="" if cname_hold_orig=="HAZLE BREWING COMPANY 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="INDIANA RAILWAY 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="INGALLS, IND , O's"
replace stock_type_hold ="N/A" if cname_hold_orig=="MONTEREY AND PACIFIC GROVE 6's, 1937"
replace stock_type_hold ="N/A" if cname_hold_orig=="McCURTAIN COUNTY, OKLA , O's,"
replace stock_type_hold ="N/A" if cname_hold_orig=="NORTHVILLE, MCH 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="NORTHVILLE, MCH 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="PEORIA, ILL, 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="PEORIA, ILL, 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="PEORIA, ILL, 5's, 1920"
replace stock_type_hold ="N/A" if cname_hold_orig=="PETROLIA, ONT, CAN, 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="PETROLIA, ONT, CAN, 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="PETROLIA, ONT, CAN, 4's"
replace stock_type_hold ="N/A" if cname_hold_orig=="PETROLIA, ONT, CAN, 4's"
replace stock_type_hold ="N/A" if cname_hold_orig=="PITTSBURGH STOVE AND RANGE 5's 1924"
replace stock_type_hold ="N/A" if cname_hold_orig=="POPLAR BLUFF, MO, 4's, 1921-22"
replace stock_type_hold ="N/A" if cname_hold_orig=="PUBLIC UTILITIES CORPORATION Notes 6's, 1915"
replace stock_type_hold ="N/A" if cname_hold_orig=="SAN FRANCISCO, CAL , 4's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SEAMLESS TUBE COMPANY OF AMERICA 6's, 1924"
replace stock_type_hold ="N/A" if cname_hold_orig=="SEARSBORO, IA , 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SHAWNEE, OKLA , 5's, 1930"
replace stock_type_hold ="N/A" if cname_hold_orig=="SMITH GRANITE 5's, 1921"
replace stock_type_hold ="N/A" if cname_hold_orig=="SMYRNA, N Y 3 1/2's-"
replace stock_type_hold ="N/A" if cname_hold_orig=="SNAKE RIVER VALLEY IRRIGATION 5's 1921-27"
replace stock_type_hold ="N/A" if cname_hold_orig=="SNOHOMISH COUNTY, WASH , 8's, Warrants"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOMERSET COUNTY, MD , 3 1/2's, Opt , 1909"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOMERSET, PA , School, 4's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOUTH HUTCHINSON, KAN , 4 1/2's, 1918"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOUTH PLATTE CANAL AND RESERVOIR 5's, 1923 Par Value"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOUTH SAN JOAQUIN IRRIGATION DISTRICT, CAL , 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOUTH SAN JOAQUIN IRRIGATION DISTRICT, CAL , 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOUTH SHORE GAS AND ELECTRIC 5's, 1933"
replace stock_type_hold ="N/A" if cname_hold_orig=="SOUTHBURY, CONN , 4's, 1909"
replace stock_type_hold ="N/A" if cname_hold_orig=="ST LOUIS REF AND COLD STORAGE 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="STAN WOOD, IA , 5's,"
replace stock_type_hold ="N/A" if cname_hold_orig=="SUSQUEHANNA RIVER AND WESTERN 5's, 1933"
replace stock_type_hold ="N/A" if cname_hold_orig=="TARENTUM, PA , 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="TAYLOR'S FALLS AND LAKE SUPERIOR 6's, 1914 Par Value"
replace stock_type_hold ="" if cname_hold_orig=="TENTH AND TWENTY-THIRD STREETS FERRY COMPANY 5's 1919"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOTOWA, N J , 5's, 1908"
replace stock_type_hold ="N/A" if cname_hold_orig=="TOWNER COUNTY, N D , 5's"
replace stock_type_hold ="N/A" if cname_hold_orig=="TRANSVAAL GOVERNMENT, 3's, 1953"
replace stock_type_hold ="N/A" if cname_hold_orig=="TRI-CITY BUTTON (DAVENPORT, IA ) 6's"
replace stock_type_hold ="N/A" if cname_hold_orig=="TRIPLE STATE NATURAL GAS AND OIL 6's, 1917-18"
replace stock_type_hold ="N/A" if cname_hold_orig=="TYRONE, PA , 4 1/2's"
replace stock_type_hold ="N/A" if cname_hold_orig=="UNION FURNACE MANUFACTURING 5�'s"
replace stock_type_hold ="N/A" if cname_hold_orig=="UNITED ELECTRIC, GAS AND POWER 5's, 1920"
replace stock_type_hold ="" if cname_hold_orig=="WASHINGTON (D C ) GAS LIGHT COMPANY 4's"
replace stock_type_hold ="N/A" if cname_hold_orig=="WILLIAMSPORT PASSENGER 6's, 1922"
replace stock_type_hold ="N/A" if cname_hold_orig=="WINCHESTER AVENUE R R 5's 1912"
replace stock_type_hold ="N/A" if cname_hold_orig=="WINDSOR AND TECUMSEH ELECTRIC 5's, 1927"
replace stock_type_hold ="N/A" if cname_hold_orig=="WINDSOR AND TECUMSEH ELECTRIC 5's, 1927"
replace stock_type_hold ="N/A" if cname_hold_orig=="WINDSOR ESSEX AND LAKE SHORE RAPID RAILWAY 5's 1947"

replace coupon_hold ="5" if cname_hold_orig=="ALLEN 5's, Sub ,,"
replace coupon_hold ="5" if cname_hold_orig=="ATHENS, TENAS, 5's 1949"
replace coupon_hold ="6" if cname_hold_orig=="ATHENS, TENN, 6's 1928"
replace coupon_hold ="6" if cname_hold_orig=="BROWN FOLDING MACHINE COMPANY 6's"
replace coupon_hold ="4.5" if cname_hold_orig=="CALDWELL, N J , 41/2's, 1929"
replace coupon_hold ="5" if cname_hold_orig=="CAPE BRETON REAL ESTATE COMPANY 51/2's, 1911"
replace coupon_hold ="6" if cname_hold_orig=="CAPE BRETON REAL ESTATE COMPANY 6's, 1914"
replace coupon_hold ="5" if cname_hold_orig=="CAPE MAY ILLUMINATING GAS COMPANY 5's, 1930"
replace coupon_hold ="5" if cname_hold_orig=="CATAWBA RIVER POWER COMPANY 51/2's, 1920"
replace coupon_hold ="5" if cname_hold_orig=="CATSKILL, N Y, 5's"
replace coupon_hold ="5" if cname_hold_orig=="CEDAR HOLLOW COMPANY 5's"
replace coupon_hold ="6" if cname_hold_orig=="CELADON TERRA COTTA COMPANY 6's, 1909"
replace coupon_hold ="5" if cname_hold_orig=="CENTRAL CALIFORNIA GAS AND ELECTRIC CORPORATION 5's"
replace coupon_hold ="6" if cname_hold_orig=="CENTRAL CITY WATER COMPANY 6's"
replace coupon_hold ="6" if cname_hold_orig=="CENTRAL COAL AND COKE COMPANY 6's"
replace coupon_hold ="6" if cname_hold_orig=="CENTRAL COAL AND COKE COMPANY 6's"
replace coupon_hold ="5" if cname_hold_orig=="CENTRAL CONSUMERS COMPANY 5's"
replace coupon_hold ="4" if cname_hold_orig=="CENTRAL MARKET HOUSE (York, Pa ) 4's, 1909"
replace coupon_hold ="5" if cname_hold_orig=="CENTRAL NORMAL SCHOOL ASSOCIATION 5's"
replace coupon_hold ="5" if cname_hold_orig=="CHESTER TRACTION 5's, 1914"
replace coupon_hold ="6" if cname_hold_orig=="CINCINNATI INDIANAPOLIS ST LOUIS AND CHICAGO, 6's, 1920"
replace coupon_hold ="6" if cname_hold_orig=="CINCINNATI INDIANAPOLIS ST LOUIS AND CHICAGO, 6's, 1920"
replace coupon_hold ="4" if cname_hold_orig=="CINCINNATI LEBANON AND NORTHERN 4's 1942"
replace coupon_hold ="5" if cname_hold_orig=="CISCO, TEX , 5's, 1947"
replace coupon_hold ="5" if cname_hold_orig=="CITY ELECTRIC COMPANY 5's, 1937"
replace coupon_hold ="5" if cname_hold_orig=="COALINGA OIL COMPANY 5's"
replace coupon_hold ="5" if cname_hold_orig=="CONGREGATION SHERITH ISRAEL 5's"
replace coupon_hold ="6" if cname_hold_orig=="CONSOLIDATED GAS COMPANY (West Virginia) 6's"
replace coupon_hold ="5" if cname_hold_orig=="COOK AND COMPANY INC , 5's"
replace coupon_hold ="5" if cname_hold_orig=="CORPUS CHRISTI WATER WORKS 5's, 1938"
replace coupon_hold ="5" if cname_hold_orig=="COTTONWOOD COUNTY, MINN , 5's"
replace coupon_hold ="5" if cname_hold_orig=="CRAMP AND SONS (THE WILLIAM) SHIP AND ENGINE BUILDING COMPANY's"
replace coupon_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace coupon_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace coupon_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace coupon_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace coupon_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace coupon_hold ="6" if cname_hold_orig=="CRUCIBLE STEEL COMPANY 6's"
replace coupon_hold ="5" if cname_hold_orig=="DELPHI, IND , 5's"
replace coupon_hold ="5" if cname_hold_orig=="DEWEES (W ) WOOD COMPANY 5's, 1910"
replace coupon_hold ="5" if cname_hold_orig=="DORCHESTER COUNTY MD, 5's"
replace coupon_hold ="5" if cname_hold_orig=="FAIRMOUNT PARK TRANSPORTATION 5's, 1937"
replace coupon_hold ="6" if cname_hold_orig=="FIRST NATIONAL BANK 6's, Brandon, Vt"
replace coupon_hold ="6" if cname_hold_orig=="FIRST NATIONAL BANK 6's, Brandon, Vt"
replace coupon_hold ="5" if cname_hold_orig=="FOREST A 5's, 1910"
replace coupon_hold ="3.5" if cname_hold_orig=="FRANKFORD, N Y , 's"
replace coupon_hold ="4" if cname_hold_orig=="GAS LIGHT COMPANY (Galena, Ill 4's)"
replace coupon_hold ="5" if cname_hold_orig=="GERMANIA, IA , 5's"
replace coupon_hold ="4.5" if cname_hold_orig=="GERMANTOWN, N Y , 's"
replace coupon_hold ="4" if cname_hold_orig=="GERMANTOWN, N Y , 4's"
replace coupon_hold ="N/A" if cname_hold_orig=="GEYSERVILLE, SONOMA COUNTY CAL , 5's, School District"
replace coupon_hold ="5" if cname_hold_orig=="HARWOOD ELECTRIC POWER COMPANY 5's, 1937"
replace coupon_hold ="5" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace coupon_hold ="5" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace coupon_hold ="5" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace coupon_hold ="5" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace coupon_hold ="5" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace coupon_hold ="5" if cname_hold_orig=="HAZLE BREWING COMPANY 5's"
replace coupon_hold ="5" if cname_hold_orig=="INDIANA RAILWAY 5's"
replace coupon_hold ="N/A" if cname_hold_orig=="INGALLS, IND , O's"
replace coupon_hold ="6" if cname_hold_orig=="MONTEREY AND PACIFIC GROVE 6's, 1937"
replace coupon_hold ="N/A" if cname_hold_orig=="McCURTAIN COUNTY, OKLA , O's,"
replace coupon_hold ="5" if cname_hold_orig=="NORTHVILLE, MCH 5's"
replace coupon_hold ="5" if cname_hold_orig=="NORTHVILLE, MCH 5's"
replace coupon_hold ="4.5" if cname_hold_orig=="PEORIA, ILL, 4 1/2's"
replace coupon_hold ="4.5" if cname_hold_orig=="PEORIA, ILL, 4 1/2's"
replace coupon_hold ="5" if cname_hold_orig=="PEORIA, ILL, 5's, 1920"
replace coupon_hold ="4.5" if cname_hold_orig=="PETROLIA, ONT, CAN, 4 1/2's"
replace coupon_hold ="4.5" if cname_hold_orig=="PETROLIA, ONT, CAN, 4 1/2's"
replace coupon_hold ="4" if cname_hold_orig=="PETROLIA, ONT, CAN, 4's"
replace coupon_hold ="4" if cname_hold_orig=="PETROLIA, ONT, CAN, 4's"
replace coupon_hold ="5" if cname_hold_orig=="PITTSBURGH STOVE AND RANGE 5's 1924"
replace coupon_hold ="4" if cname_hold_orig=="POPLAR BLUFF, MO, 4's, 1921-22"
replace coupon_hold ="6" if cname_hold_orig=="PUBLIC UTILITIES CORPORATION Notes 6's, 1915"
replace coupon_hold ="4" if cname_hold_orig=="SAN FRANCISCO, CAL , 4's"
replace coupon_hold ="6" if cname_hold_orig=="SEAMLESS TUBE COMPANY OF AMERICA 6's, 1924"
replace coupon_hold ="5" if cname_hold_orig=="SEARSBORO, IA , 5's"
replace coupon_hold ="4.5" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace coupon_hold ="4.5" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace coupon_hold ="4.5" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace coupon_hold ="5" if cname_hold_orig=="SHAWNEE, OKLA , 5's, 1930"
replace coupon_hold ="5" if cname_hold_orig=="SMITH GRANITE 5's, 1921"
replace coupon_hold ="3.5" if cname_hold_orig=="SMYRNA, N Y 3 1/2's-"
replace coupon_hold ="5" if cname_hold_orig=="SNAKE RIVER VALLEY IRRIGATION 5's 1921-27"
replace coupon_hold ="8" if cname_hold_orig=="SNOHOMISH COUNTY, WASH , 8's, Warrants"
replace coupon_hold ="3.5" if cname_hold_orig=="SOMERSET COUNTY, MD , 3 1/2's, Opt , 1909"
replace coupon_hold ="4" if cname_hold_orig=="SOMERSET, PA , School, 4's"
replace coupon_hold ="4.5" if cname_hold_orig=="SOUTH HUTCHINSON, KAN , 4 1/2's, 1918"
replace coupon_hold ="5" if cname_hold_orig=="SOUTH PLATTE CANAL AND RESERVOIR 5's, 1923 Par Value"
replace coupon_hold ="5" if cname_hold_orig=="SOUTH SAN JOAQUIN IRRIGATION DISTRICT, CAL , 5's"
replace coupon_hold ="5" if cname_hold_orig=="SOUTH SAN JOAQUIN IRRIGATION DISTRICT, CAL , 5's"
replace coupon_hold ="5" if cname_hold_orig=="SOUTH SHORE GAS AND ELECTRIC 5's, 1933"
replace coupon_hold ="4" if cname_hold_orig=="SOUTHBURY, CONN , 4's, 1909"
replace coupon_hold ="5" if cname_hold_orig=="ST LOUIS REF AND COLD STORAGE 5's"
replace coupon_hold ="5" if cname_hold_orig=="STAN WOOD, IA , 5's,"
replace coupon_hold ="5" if cname_hold_orig=="SUSQUEHANNA RIVER AND WESTERN 5's, 1933"
replace coupon_hold ="5" if cname_hold_orig=="TARENTUM, PA , 5's"
replace coupon_hold ="6" if cname_hold_orig=="TAYLOR'S FALLS AND LAKE SUPERIOR 6's, 1914 Par Value"
replace coupon_hold ="5" if cname_hold_orig=="TENTH AND TWENTY-THIRD STREETS FERRY COMPANY 5's 1919"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="4" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace coupon_hold ="5" if cname_hold_orig=="TOTOWA, N J , 5's, 1908"
replace coupon_hold ="5" if cname_hold_orig=="TOWNER COUNTY, N D , 5's"
replace coupon_hold ="3" if cname_hold_orig=="TRANSVAAL GOVERNMENT, 3's, 1953"
replace coupon_hold ="6" if cname_hold_orig=="TRI-CITY BUTTON (DAVENPORT, IA ) 6's"
replace coupon_hold ="6" if cname_hold_orig=="TRIPLE STATE NATURAL GAS AND OIL 6's, 1917-18"
replace coupon_hold ="4.5" if cname_hold_orig=="TYRONE, PA , 4 1/2's"
replace coupon_hold ="5.5" if cname_hold_orig=="UNION FURNACE MANUFACTURING 5�'s"
replace coupon_hold ="5" if cname_hold_orig=="UNITED ELECTRIC, GAS AND POWER 5's, 1920"
replace coupon_hold ="4" if cname_hold_orig=="WASHINGTON (D C ) GAS LIGHT COMPANY 4's"
replace coupon_hold ="6" if cname_hold_orig=="WILLIAMSPORT PASSENGER 6's, 1922"
replace coupon_hold ="5" if cname_hold_orig=="WINCHESTER AVENUE R R 5's 1912"
replace coupon_hold ="5" if cname_hold_orig=="WINDSOR AND TECUMSEH ELECTRIC 5's, 1927"
replace coupon_hold ="5" if cname_hold_orig=="WINDSOR AND TECUMSEH ELECTRIC 5's, 1927"
replace coupon_hold ="5" if cname_hold_orig=="WINDSOR ESSEX AND LAKE SHORE RAPID RAILWAY 5's 1947"

replace maturity_year_hold ="1917" if cname_hold_orig=="ALLEN 5's, Sub ,,"
replace maturity_year_hold ="1949" if cname_hold_orig=="ATHENS, TENAS, 5's 1949"
replace maturity_year_hold ="1928" if cname_hold_orig=="ATHENS, TENN, 6's 1928"
replace maturity_year_hold ="N/A" if cname_hold_orig=="BROWN FOLDING MACHINE COMPANY 6's"
replace maturity_year_hold ="1929" if cname_hold_orig=="CALDWELL, N J , 41/2's, 1929"
replace maturity_year_hold ="1911" if cname_hold_orig=="CAPE BRETON REAL ESTATE COMPANY 51/2's, 1911"
replace maturity_year_hold ="1914" if cname_hold_orig=="CAPE BRETON REAL ESTATE COMPANY 6's, 1914"
replace maturity_year_hold ="1930" if cname_hold_orig=="CAPE MAY ILLUMINATING GAS COMPANY 5's, 1930"
replace maturity_year_hold ="1920" if cname_hold_orig=="CATAWBA RIVER POWER COMPANY 51/2's, 1920"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CATSKILL, N Y, 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CEDAR HOLLOW COMPANY 5's"
replace maturity_year_hold ="1909" if cname_hold_orig=="CELADON TERRA COTTA COMPANY 6's, 1909"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CENTRAL CALIFORNIA GAS AND ELECTRIC CORPORATION 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CENTRAL CITY WATER COMPANY 6's"
replace maturity_year_hold ="1910-11" if cname_hold_orig=="CENTRAL COAL AND COKE COMPANY 6's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CENTRAL COAL AND COKE COMPANY 6's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CENTRAL CONSUMERS COMPANY 5's"
replace maturity_year_hold ="1909" if cname_hold_orig=="CENTRAL MARKET HOUSE (York, Pa ) 4's, 1909"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CENTRAL NORMAL SCHOOL ASSOCIATION 5's"
replace maturity_year_hold ="1914" if cname_hold_orig=="CHESTER TRACTION 5's, 1914"
replace maturity_year_hold ="1920" if cname_hold_orig=="CINCINNATI INDIANAPOLIS ST LOUIS AND CHICAGO, 6's, 1920"
replace maturity_year_hold ="1920" if cname_hold_orig=="CINCINNATI INDIANAPOLIS ST LOUIS AND CHICAGO, 6's, 1920"
replace maturity_year_hold ="1942" if cname_hold_orig=="CINCINNATI LEBANON AND NORTHERN 4's 1942"
replace maturity_year_hold ="1947" if cname_hold_orig=="CISCO, TEX , 5's, 1947"
replace maturity_year_hold ="1937" if cname_hold_orig=="CITY ELECTRIC COMPANY 5's, 1937"
replace maturity_year_hold ="N/A" if cname_hold_orig=="COALINGA OIL COMPANY 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CONGREGATION SHERITH ISRAEL 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CONSOLIDATED GAS COMPANY (West Virginia) 6's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="COOK AND COMPANY INC , 5's"
replace maturity_year_hold ="1938" if cname_hold_orig=="CORPUS CHRISTI WATER WORKS 5's, 1938"
replace maturity_year_hold ="N/A" if cname_hold_orig=="COTTONWOOD COUNTY, MINN , 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CRAMP AND SONS (THE WILLIAM) SHIP AND ENGINE BUILDING COMPANY's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CROCKER NATIONAL BANK, Turner's Falls, Mass"
replace maturity_year_hold ="N/A" if cname_hold_orig=="CRUCIBLE STEEL COMPANY 6's"
replace maturity_year_hold ="1910" if cname_hold_orig=="DELPHI, IND , 5's"
replace maturity_year_hold ="1910" if cname_hold_orig=="DEWEES (W ) WOOD COMPANY 5's, 1910"
replace maturity_year_hold ="N/A" if cname_hold_orig=="DORCHESTER COUNTY MD, 5's"
replace maturity_year_hold ="1937" if cname_hold_orig=="FAIRMOUNT PARK TRANSPORTATION 5's, 1937"
replace maturity_year_hold ="N/A" if cname_hold_orig=="FIRST NATIONAL BANK 6's, Brandon, Vt"
replace maturity_year_hold ="N/A" if cname_hold_orig=="FIRST NATIONAL BANK 6's, Brandon, Vt"
replace maturity_year_hold ="1910" if cname_hold_orig=="FOREST A 5's, 1910"
replace maturity_year_hold ="N/A" if cname_hold_orig=="FRANKFORD, N Y , 's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="GAS LIGHT COMPANY (Galena, Ill 4's)"
replace maturity_year_hold ="N/A" if cname_hold_orig=="GERMANIA, IA , 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="GERMANTOWN, N Y , 's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="GERMANTOWN, N Y , 4's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="GEYSERVILLE, SONOMA COUNTY CAL , 5's, School District"
replace maturity_year_hold ="1937" if cname_hold_orig=="HARWOOD ELECTRIC POWER COMPANY 5's, 1937"
replace maturity_year_hold ="1922" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace maturity_year_hold ="1922" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace maturity_year_hold ="1922" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace maturity_year_hold ="1922" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace maturity_year_hold ="1922" if cname_hold_orig=="HAVANA TOBACCO COMPANY 5's, 1922"
replace maturity_year_hold ="N/A" if cname_hold_orig=="HAZLE BREWING COMPANY 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="INDIANA RAILWAY 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="INGALLS, IND , O's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="MONTEREY AND PACIFIC GROVE 6's, 1937"
replace maturity_year_hold ="1929" if cname_hold_orig=="McCURTAIN COUNTY, OKLA , O's,"
replace maturity_year_hold ="1929" if cname_hold_orig=="NORTHVILLE, MCH 5's"
replace maturity_year_hold ="1922" if cname_hold_orig=="NORTHVILLE, MCH 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="PEORIA, ILL, 4 1/2's"
replace maturity_year_hold ="1914-28" if cname_hold_orig=="PEORIA, ILL, 4 1/2's"
replace maturity_year_hold ="1920" if cname_hold_orig=="PEORIA, ILL, 5's, 1920"
replace maturity_year_hold ="1909-34" if cname_hold_orig=="PETROLIA, ONT, CAN, 4 1/2's"
replace maturity_year_hold ="1912-19" if cname_hold_orig=="PETROLIA, ONT, CAN, 4 1/2's"
replace maturity_year_hold ="1912-22" if cname_hold_orig=="PETROLIA, ONT, CAN, 4's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="PETROLIA, ONT, CAN, 4's"
replace maturity_year_hold ="1924" if cname_hold_orig=="PITTSBURGH STOVE AND RANGE 5's 1924"
replace maturity_year_hold ="1921-22" if cname_hold_orig=="POPLAR BLUFF, MO, 4's, 1921-22"
replace maturity_year_hold ="1915" if cname_hold_orig=="PUBLIC UTILITIES CORPORATION Notes 6's, 1915"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SAN FRANCISCO, CAL , 4's"
replace maturity_year_hold ="1924" if cname_hold_orig=="SEAMLESS TUBE COMPANY OF AMERICA 6's, 1924"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SEARSBORO, IA , 5's"
replace maturity_year_hold ="1939" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace maturity_year_hold ="1915" if cname_hold_orig=="SHARON, PA , 4 1/2's"
replace maturity_year_hold ="1930" if cname_hold_orig=="SHAWNEE, OKLA , 5's, 1930"
replace maturity_year_hold ="1921" if cname_hold_orig=="SMITH GRANITE 5's, 1921"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SMYRNA, N Y 3 1/2's-"
replace maturity_year_hold ="1921-27" if cname_hold_orig=="SNAKE RIVER VALLEY IRRIGATION 5's 1921-27"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SNOHOMISH COUNTY, WASH , 8's, Warrants"
replace maturity_year_hold ="1909" if cname_hold_orig=="SOMERSET COUNTY, MD , 3 1/2's, Opt , 1909"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SOMERSET, PA , School, 4's"
replace maturity_year_hold ="1918" if cname_hold_orig=="SOUTH HUTCHINSON, KAN , 4 1/2's, 1918"
replace maturity_year_hold ="1923" if cname_hold_orig=="SOUTH PLATTE CANAL AND RESERVOIR 5's, 1923 Par Value"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SOUTH SAN JOAQUIN IRRIGATION DISTRICT, CAL , 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="SOUTH SAN JOAQUIN IRRIGATION DISTRICT, CAL , 5's"
replace maturity_year_hold ="1933" if cname_hold_orig=="SOUTH SHORE GAS AND ELECTRIC 5's, 1933"
replace maturity_year_hold ="1909" if cname_hold_orig=="SOUTHBURY, CONN , 4's, 1909"
replace maturity_year_hold ="N/A" if cname_hold_orig=="ST LOUIS REF AND COLD STORAGE 5's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="STAN WOOD, IA , 5's,"
replace maturity_year_hold ="1933" if cname_hold_orig=="SUSQUEHANNA RIVER AND WESTERN 5's, 1933"
replace maturity_year_hold ="N/A" if cname_hold_orig=="TARENTUM, PA , 5's"
replace maturity_year_hold ="1914" if cname_hold_orig=="TAYLOR'S FALLS AND LAKE SUPERIOR 6's, 1914 Par Value"
replace maturity_year_hold ="1919" if cname_hold_orig=="TENTH AND TWENTY-THIRD STREETS FERRY COMPANY 5's 1919"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1951" if cname_hold_orig=="TOLEDO AND OHIO CENTRAL, St Mary's Division,"
replace maturity_year_hold ="1908" if cname_hold_orig=="TOTOWA, N J , 5's, 1908"
replace maturity_year_hold ="N/A" if cname_hold_orig=="TOWNER COUNTY, N D , 5's"
replace maturity_year_hold ="1953" if cname_hold_orig=="TRANSVAAL GOVERNMENT, 3's, 1953"
replace maturity_year_hold ="N/A" if cname_hold_orig=="TRI-CITY BUTTON (DAVENPORT, IA ) 6's"
replace maturity_year_hold ="1917-18" if cname_hold_orig=="TRIPLE STATE NATURAL GAS AND OIL 6's, 1917-18"
replace maturity_year_hold ="N/A" if cname_hold_orig=="TYRONE, PA , 4 1/2's"
replace maturity_year_hold ="N/A" if cname_hold_orig=="UNION FURNACE MANUFACTURING 5�'s"
replace maturity_year_hold ="1920" if cname_hold_orig=="UNITED ELECTRIC, GAS AND POWER 5's, 1920"
replace maturity_year_hold ="N/A" if cname_hold_orig=="WASHINGTON (D C ) GAS LIGHT COMPANY 4's"
replace maturity_year_hold ="1922" if cname_hold_orig=="WILLIAMSPORT PASSENGER 6's, 1922"
replace maturity_year_hold ="1920" if cname_hold_orig=="WINCHESTER AVENUE R R 5's 1912"
replace maturity_year_hold ="1927" if cname_hold_orig=="WINDSOR AND TECUMSEH ELECTRIC 5's, 1927"
replace maturity_year_hold ="1927" if cname_hold_orig=="WINDSOR AND TECUMSEH ELECTRIC 5's, 1927"
replace maturity_year_hold ="1947" if cname_hold_orig=="WINDSOR ESSEX AND LAKE SHORE RAPID RAILWAY 5's 1947"