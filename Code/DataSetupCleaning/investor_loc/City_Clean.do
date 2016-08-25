set more off

replace investor_city_temp=ustrfix(investor_city_temp,"")
replace investor_city_1=subinstr(investor_city_1,"�","",.)

cap drop investor_city_1 investor_city_2 investor_city_3
split investor_city_temp, parse("/") gen(investor_city_)
sort investor_city_1

replace investor_city_1="" if investor_city_1=="can"
replace investor_city_1="" if investor_city_1=="canada"
replace investor_city_1="white river junction" if investor_city_1=="junction" & strpos(invname_hold_orig,"White River")
replace investor_city_1="" if investor_city_1=="scotland"
replace investor_city_1="" if investor_city_1=="sweden"
replace investor_city_1="" if investor_city_1=="trust"
replace investor_city_1="" if investor_city_1=="union"
replace investor_city_1="" if investor_city_1=="worker"

*Replace City List
forv i=1/3{
global x="investor_city_`i'"
do Replace_City_List.do
}

*drop meaning-less observations
forv i=1/3{
replace $x="" if $x=="safe deposit & title ins"
replace $x="" if $x=="conn"
replace $x="" if $x=="new"
replace $x="" if $x=="delaware"
replace $x="" if $x=="eng"
replace $x="" if $x=="germany"
replace $x="" if $x=="me"
replace $x="" if $x=="mass"
replace $x="" if $x=="savings bank"
replace $x="" if $x=="st"
replace $x="" if $x=="bank"
replace $x="" if $x=="england"
replace $x="" if $x=="ger"
replace $x="" if $x=="o"
replace $x="" if $x=="pa"
replace $x="" if $x=="pennsylvania"
replace $x="" if $x=="title & savings company"
replace $x="" if $x=="title a s"
replace $x="" if $x=="industrial trust company"
replace $x="" if $x=="fire & life assurance corporation"
replace $x="" if $x=="inc"
}

*Recreate split variable
replace investor_city_temp=investor_city_1
replace investor_city_temp=investor_city_temp+"/"+investor_city_2 if investor_city_2~=""
replace investor_city_temp=investor_city_temp+"/"+investor_city_3 if investor_city_3~=""
replace investor_city_temp=subinstr(investor_city_temp,"/"," ",.) if investor_city_1=="st" & investor_city_2~=""
replace investor_city_temp=subinstr(investor_city_temp,"new york/new york","new york",.)
replace investor_city_temp=subinstr(investor_city_temp,"toronto/ontario","toronto",.)
replace investor_city_temp=subinstr(investor_city_temp,"london/edinburgh/","london & edinburgh/",.)
replace investor_city_temp=subinstr(investor_city_temp,"liverpool/london/","liverpool & london/",.)
replace investor_city_temp=subinstr(investor_city_temp,"toronto/toronto","toronto",.)
replace investor_city_temp=subinstr(investor_city_temp,"/new york eng/new york","/new york",.)
replace investor_city_temp=subinstr(investor_city_temp,"salamandra/st petersburg/new york","salamandra & st petersburg/new york",.)
replace investor_city_temp=subinstr(investor_city_temp,"stettin/new york/chicago","stettin/new york & chicago",.)

*Some Addings
replace invname_hold_temp="delaware county trust,safe deposit & title insurance company" if invname_hold_orig=="Delaware County Trust" & cname_hold_temp=="kanawha valley traction" & book_year_hold==1908
replace invname_hold_temp="industrial trust title & savings company" if invname_hold_orig=="Industrial Trust" & cname_hold_temp=="chicago rock island and pacific railway" & book_year_hold==1908
replace invname_hold_temp="northwestern trust company" if invname_hold_orig=="Northw.este.cn"
replace invname_hold_temp="people's bank of wilkes barre" if strpos(invname_hold_orig, "PeopIe&^Eank")
replace invname_hold_temp="industrial trust company" if invname_hold_orig=="Providence"
replace invname_hold_temp="security mutual life insurance company" if strpos(invname_hold_orig,"Security Muruai NiLfeai^ujca")
replace invname_hold_temp="buffalo loan trust and safe deposit company buffalo" if invname_hold_orig=="Buffalo Loan" & cname_hold_temp=="cataract power and conduit"
replace invname_hold_temp="institution for saving newburyport and vicinity" if invname_hold_orig=="Institution for Sav," & cname_hold_temp=="rome watertown and ogdensburg"

replace invname_hold_orig="institution for saving newburyport and vicinity" if invname_hold_orig=="Institution for Sav," & cname_hold_temp=="rome watertown and ogdensburg"
replace invname_hold_orig="buffalo loan trust and safe deposit company buffalo" if invname_hold_orig=="Buffalo Loan" & cname_hold_temp=="cataract power and conduit"
replace invname_hold_orig="delaware county trust,safe deposit & title insurance company" if invname_hold_orig=="Delaware County Trust" & cname_hold_temp=="kanawha valley traction" & book_year_hold==1908
replace invname_hold_orig="industrial trust title & savings company" if invname_hold_orig=="Industrial Trust" & cname_hold_temp=="chicago rock island and pacific railway" & book_year_hold==1908
replace investor_state_temp="england/new york" if investor_city_temp=="london/new york"
replace coupon_hold="5" if invname_hold_orig=="Northw.este.cn"
replace invname_hold_orig="northwestern trust company" if invname_hold_orig=="Northw.este.cn"
replace coupon_hold="5" if strpos(invname_hold_orig, "PeopIe") & strpos(invname_hold_orig,"Eank")
replace par_value_clean_hold=25000 if strpos(invname_hold_orig, "PeopIe") & strpos(invname_hold_orig,"Eank")
replace invname_hold_orig="people's bank of wilkes barre" if strpos(invname_hold_orig, "PeopIe") & strpos(invname_hold_orig,"Eank")
replace investor_state_temp="england/new york" if investor_city_temp=="dover" & invname_hold_orig=="Piscataquis Cents Savings Bank"
replace invname_hold_orig="industrial trust company" if invname_hold_orig=="Providence"
replace invname_hold_orig="security mutual life insurance company" if strpos(invname_hold_orig,"Security Muruai NiLfeai^ujca")
replace investor_state_temp="spain/new york" if investor_city_temp=="madrid/new york"
replace investor_state_temp="philadelphia" if investor_city_temp=="philadelphia/pa"

replace investor_city_temp="london/boston" if invname_hold_orig=="Emplpoyers' Liability Assurance Corporation. London" & book_year_hold==1911 & cname_hold_temp=="charleston union station"
replace investor_city_temp="edinburgh/toronto" if invname_hold_orig=="No. British & Merc. Ins. Co." & book_year_hold==1911 & cname_hold_temp=="st james cathedral (toronto can)"
replace investor_city_temp="edinburgh/toronto" if invname_hold_orig=="No. British & Merc. Ins. Co." & book_year_hold==1911 & cname_hold_temp=="st cunegonde of montreal water and power"
replace investor_city_temp="edinburgh/hartford" if invname_hold_orig=="Scottish Union ft National Insurance Company" & book_year_hold==1911 & cname_hold_temp=="shawinigan water and power"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Stand. Life Assur. Co." & book_year_hold==1908 & cname_hold_temp=="new york coal"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assur Co" & book_year_hold==1911 & cname_hold_temp=="seattle electric"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assur. Co." & book_year_hold==1913 & cname_hold_temp=="ontario power"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assur. Co." & book_year_hold==1913 & cname_hold_temp=="victoria rolling"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Co." & book_year_hold==1913 & cname_hold_temp=="montreal light heat and power"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1913 & cname_hold_temp=="national breweries"
replace investor_city_temp="edinburgh/hartford" if invname_hold_orig=="Scottish Union & National Insurance Co." & book_year_hold==1911 & cname_hold_temp=="halifax electric tramway colorado"
replace investor_city_temp="edinburgh/hartford" if invname_hold_orig=="Scottish Union and National Insurance Company" & book_year_hold==1913 & cname_hold_temp=="ontario loan and debenture"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assur. Co." & book_year_hold==1913 & cname_hold_temp=="laurentide pulp"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Co" & book_year_hold==1911 & cname_hold_temp=="seattle renton and southern"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Co." & book_year_hold==1908 & cname_hold_temp=="west india electric"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="underground electric railway of london england"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1911 & cname_hold_temp=="halifax electric tramway"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="canada atlantic"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="toronto railway"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="montreal light heat and power"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="sault ste marie bridge"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="canada atlantic"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="seattle electric"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="winnipeg electric street"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1908 & cname_hold_temp=="metropolitan building"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Company" & book_year_hold==1913 & cname_hold_temp=="keewatin flour mill"
replace investor_city_temp="edinburgh/hartford" if invname_hold_orig=="Scottish Union & National Insurance Company" & book_year_hold==1908 & cname_hold_temp=="nashville chattanooga and st louis"
replace investor_city_temp="edinburgh/hartford" if invname_hold_orig=="Scottish Union National Insurance Company" & book_year_hold==1911 & cname_hold_temp=="mortgage bond of new york"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Scottish Union A Nat. Ins.Co." & book_year_hold==1913 & cname_hold_temp=="lehigh valley railway"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="North British & Mercantile Insurance Co." & book_year_hold==1913 & cname_hold_temp=="st louis iron mountain and southern"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Scottish Union & National Insurance Company" & book_year_hold==1913 & cname_hold_temp=="st lawrence and ottawa"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Stand. Life As. Co." & book_year_hold==1908 & cname_hold_temp=="victoria rolling stock"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Co." & book_year_hold==1911 & cname_hold_temp=="central vermont"
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assurance Co." & book_year_hold==1908 & cname_hold_temp=="milwaukee electric railway and light"
replace investor_city_temp="gothenburg/new york" if invname_hold_orig=="Svea Fire & Life Ins. Co.  Ltd." & book_year_hold==1911 & cname_hold_temp=="norfolk and western pocahontas coal and coke"
replace investor_city_temp="liverpool/new york" if invname_hold_orig=="London & Lancashire Fire Insurance Company" & book_year_hold==1911 & cname_hold_temp=="terminal railroad association of st louis"
replace investor_city_temp="liverpool/montreal" if invname_hold_orig=="Liverpool A London A Globe Insurance Company  Ltd." & book_year_hold==1913 & cname_hold_temp=="ontario and quebec"
replace investor_city_temp="liverpool/norfolk" if invname_hold_orig=="Standard Marine Ins. Co" & book_year_hold==1908 & cname_hold_temp=="new york central"
replace investor_city_temp="london/new york" if invname_hold_orig=="North British & mercantile Insurance Company" & book_year_hold==1911 & cname_hold_temp=="reading"
replace investor_city_temp="london/new york" if invname_hold_orig=="North British & mercantile Insurance Company" & book_year_hold==1911 & cname_hold_temp=="northern pacific"
replace investor_city_temp="munich/new york" if invname_hold_orig=="Munich Re-insurance Co." & book_year_hold==1911 & cname_hold_temp=="illinois central"
replace investor_city_temp="paris/providence" if invname_hold_orig=="National Fire Ins. Co." & book_year_hold==1911 & cname_hold_temp=="new york central and hudson river"
replace investor_city_temp="perth/philadelphia" if invname_hold_orig=="General Accident, Fire & Life Assur. Corp. Ltd." & book_year_hold==1913 & cname_hold_temp=="lehigh valley railroad"
replace investor_city_temp="st petersburg/new york" if invname_hold_orig=="Rossia Ins. Co..," & book_year_hold==1911 & cname_hold_temp=="baltimore and ohio"
replace investor_city_temp="st petersburg/new york" if invname_hold_orig=="Insurance Company of Salamandra" & book_year_hold==1913 & cname_hold_temp=="new york telephone"
replace investor_city_temp="stettin/chicago" if invname_hold_orig=="Prussian National Insurance Company" & book_year_hold==1908 & cname_hold_temp=="pere marquette"
replace investor_city_temp="toronto" if invname_hold_orig=="Canada Life Assurance Co." & book_year_hold==1913 & cname_hold_temp=="grand trunk railway of canada"
replace investor_city_temp="hamburg/new york" if investor_city_temp=="hamburg/n y city"
replace investor_city_temp="hamburg/new york" if investor_city_temp=="hamburg/nycity"
replace investor_city_temp="liverpool/new york" if investor_city_temp=="liverpool/new yoerk"
replace investor_city_temp="liverpool/new york" if investor_city_temp=="liverpool/new yor k"
replace investor_city_temp="liverpool/new york" if investor_city_temp=="liverpool/newy york"
replace investor_city_temp="liverpool/new york" if investor_city_temp=="liverpool/nycity"
replace investor_city_temp="london/new york" if investor_city_temp=="london/ew york"
replace investor_city_temp="london/new york" if investor_city_temp=="london/n ew york"
replace investor_city_temp="london/new york" if investor_city_temp=="london/n y"
replace investor_city_temp="london/new york" if investor_city_temp=="london/n y c"
replace investor_city_temp="london/new york" if investor_city_temp=="london/n y city"
replace investor_city_temp="london/new york" if investor_city_temp=="london/newyork"
replace investor_city_temp="munich/new york" if investor_city_temp=="munich/new yortk"
replace investor_city_temp="munich/new york" if investor_city_temp=="munich/nyc"
replace investor_city_temp="norwich/new york" if investor_city_temp=="norwich/newyork"
replace investor_city_temp="perth/philadelphia" if investor_city_temp=="perth/phila"
replace investor_city_temp="perth/philadelphia" if investor_city_temp=="perth/philadephia"
replace investor_city_temp="perth/philadelphia" if investor_city_temp=="perth/philladelph"
replace investor_city_temp="philadelphia" if investor_city_temp=="philadelphia/pa"
replace investor_city_temp="shanghai/new york" if investor_city_temp=="shanghai/nycity"
replace investor_city_temp="st petersburg/hartford" if investor_city_temp=="st petersburg/heartford"
replace investor_city_temp="st petersburg/new york" if investor_city_temp=="st petersburg/n y c"
replace investor_city_temp="st petersburg/new york" if investor_city_temp=="st petersburg/ny city"
replace investor_city_temp="st petersburg/new york" if investor_city_temp=="st petersburg/nyc"
replace investor_city_temp="st petersburg/new york" if investor_city_temp=="st petersburg/nycity"
replace investor_city_temp="" if investor_city_temp=="stettin/new york & chicago"
replace investor_city_temp="stockholm/new york" if investor_city_temp=="stockholm/ny city"
replace investor_city_temp="london/toronto" if investor_city_temp=="eng/toronto"
replace investor_city_temp=regexr(investor_city_temp,"^/","")
replace investor_city_temp="munich/new york" if investor_city_temp=="new york/munich"
replace investor_city_temp="edinburgh/montreal" if investor_city_temp=="edin/montreal"
replace investor_city_temp="gothenburg/new york" if investor_city_temp=="new york/gothenburg"
replace investor_city_temp="edinburgh/new york" if investor_city_temp=="new york/edinburgh"

*Check for multiple regions
cap drop investor_city_1 investor_city_2
cap drop investor_city_3
split investor_city_temp, parse("/") gen(investor_city_)

*Gen Dummy
forv i=1/2{
global x="investor_city_`i'"
do City_State_Dummy.do
}

cap drop _merge 
*cap drop state
*merge m:n investor_city_1 using citystate_2010
*drop if _merge==2

*browse investor_city_1 investor_state_temp investor_city_temp book_year_hold invname_hold_orig cname_hold_temp industry coupon_hold book_year_hold if (dummy_investor_city_2~=2&dummy_investor_city_2~=23|investor_city_temp=="") &investor_city_2~="" & industry~="Government"
label var investor_city_temp "Cleaned investor city, county or township"
label var investor_state_temp "Cleaned investor US state or foreign country"
label var investor_city_1 "Primary investor city, US or Foreign city"
label var investor_city_2 "Secondary investor city, US or Canada branch"
label var dummy_investor_city_1 "Primary city type: domestic or foreign"
label var dummy_investor_city_2 "Secondary city type: domestic or foreign"
cap drop state
cap drop var3
