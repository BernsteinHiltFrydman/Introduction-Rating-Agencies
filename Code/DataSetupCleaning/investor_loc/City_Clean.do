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
replace investor_city_temp=subinstr(investor_city_temp,"london/edinburh/","london & edinburh/",.)
replace investor_city_temp=subinstr(investor_city_temp,"liverpool/london/","liverpool & london/",.)
replace investor_city_temp=subinstr(investor_city_temp,"toronto/toronto","toronto",.)
replace investor_city_temp=subinstr(investor_city_temp,"/new york eng/new york","/new york",.)
replace investor_city_temp=subinstr(investor_city_temp,"salamandra/st petersburg/new york","salamandra & st petersburg/new york",.)
replace investor_city_temp=subinstr(investor_city_temp,"stettin/new york/chicago","stettin/new york & chicago",.)


cap drop investor_city_1 investor_city_2 investor_city_3
split investor_city_temp, parse("/") gen(investor_city_)

*Gen Dummy
forv i=1/3{
global x="investor_city_`i'"
do City_State_Dummy.do
}

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


cap drop _merge 
cap drop state
*merge m:n investor_city_1 using citystate_2010
*drop if _merge==2

*browse investor_city_1 investor_state_temp state investor_city_temp book_year_hold invname_hold_orig cname_hold_temp industry coupon_hold book_year_hold if (dummy_investor_city_1==0|investor_city_temp=="") & industry~="Government"

