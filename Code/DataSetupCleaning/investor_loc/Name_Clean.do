/*
cd "D:\Dropbox\Bond Rating\Code and Data\dta"
use Holdings_Investor_LocClean.dta,clear

cd "D:\Dropbox\Bond Rating\Investor_Name_Loc\temp"
save Holdings_Investor_Nametemp.dta,replace

browse invname_hold_orig invname_hold_temp book_year_hold coupon_hold cname_hold_temp if regexm(invname_hold_orig,"Savings Bank") & investor_city_hold=="Meriden" 
& cname_hold_orig=="ROCK ISLAND, ARKANSAS AND LOUISIANA"


browse invname_hold_orig invname_hold_temp investor_city_temp investor_state_hold book_year_hold cname_hold_temp coupon_hold class_hold 
if regexm(invname_hold_orig,"^[a-z]")

/*cname_hold_orig=="CITY AND MEMPHIS RAILWAY AND BRIDGE" */

browse invname_hold_orig invname_hold_temp book_year_hold coupon_hold cname_hold_temp if strpos(invname_hold_temp,"home fire") & !strpos(invname_hold_orig,"Fire")
*/
global root_data="D:\Dropbox\Bond Rating\Code and Data\dta"
global root_do="D:\Dropbox\Bond Rating\Code and Data\do_investor_loc"

cd "$root_data"
use Holdings_Investor_LocClean.dta, clear
cd "$root_do"
do Replace_List_Investor.do
global x="invname_hold_temp"
*do Remove_Trailing_Geo.do
replace invname_hold_temp=strtrim(invname_hold_temp)
replace invname_hold_temp=stritrim(invname_hold_temp)
cd "$root_data"

*Revise state
replace investor_city_temp="boston" if strpos(investor_state_temp,"massachusetts") & strpos(investor_city_temp,"new york")
*Some additional cleaning
*1. Clean the case that number of investor city & state don't match
replace investor_state_temp="germany/new york" if investor_city_temp=="aixlachapelle/new york" & investor_state_temp=="new york"
replace investor_state_temp="germany/new york" if investor_city_temp=="aixlachapelle/new york" & investor_state_temp=="germany"
replace investor_state_temp="holland/new york" if investor_city_temp=="albany/new york" & investor_state_temp=="new york"
replace investor_state_temp="holland/new york" if investor_city_temp=="amsterdam/new york" & investor_state_temp=="new york"
replace investor_state_temp="holland/new york" if investor_city_temp=="amsterdam/new york" & investor_state_temp=="holland"
replace investor_state_temp="holland/new york" if investor_city_temp=="amsterdam/new york city" & investor_state_temp=="holland"
replace investor_state_temp="germany/new york" if investor_city_temp=="cologne/new york" & investor_state_temp=="new york"
replace investor_state_temp="scotland/connecticut" if investor_city_temp=="edinburgh/hartford" & investor_state_temp=="connecticut"
replace investor_state_temp="scotland/new york" if investor_city_temp=="edinburgh/hartford" & investor_state_temp=="new york"
replace investor_state_temp="scotland/canada" if investor_city_temp=="edinburgh/montreal" & investor_state_temp=="scotland"
replace investor_state_temp="scotland/new york" if investor_city_temp=="edinburgh/new york" & investor_state_temp=="new york"
replace investor_state_temp="scotland/new york" if investor_city_temp=="edinburgh/new york" & investor_state_temp=="scotland"
replace investor_state_temp="germany/new york" if investor_city_temp=="frankfort on main/new york" & investor_state_temp=="new york"
replace investor_state_temp="germany/new york" if investor_city_temp=="frankfort/new york" & investor_state_temp=="new york"
replace investor_state_temp="germany/new york" if investor_city_temp=="frankfort/new york" & investor_state_temp=="germany"
replace investor_state_temp="sweden/new york" if investor_city_temp=="gothenburg/new york" & investor_state_temp=="new york"
replace investor_state_temp="sweden/new york" if investor_city_temp=="gothenburg/new york" & investor_state_temp=="sweden"
replace investor_state_temp="germany/new york" if investor_city_temp=="hamburg/new york" & investor_state_temp=="new york"
replace investor_state_temp="germany/new york" if investor_city_temp=="hamburg/new york city" & investor_state_temp=="new york"
replace investor_state_temp="england/connecticut" if investor_city_temp=="liverpool/hartford" & investor_state_temp=="connecticut"
replace investor_state_temp="england/canada" if investor_city_temp=="liverpool/montreal" & investor_state_temp=="england"
replace investor_state_temp="england/new york" if investor_city_temp=="liverpool/new york" & investor_state_temp=="new york"
replace investor_state_temp="england/new york" if investor_city_temp=="liverpool/new york" & investor_state_temp=="england"
replace investor_state_temp="england/new jersey" if investor_city_temp=="liverpool/new york" & investor_state_temp=="new jersey"
replace investor_state_temp="england/new york" if investor_city_temp=="liverpool/new york city" & investor_state_temp=="new york"
replace investor_state_temp="great britain/new york" if investor_city_temp=="london and edinburgh/new york" & investor_state_temp=="new york"
replace investor_state_temp="great britain/new york" if investor_city_temp=="london and edinburgh/new york" & investor_state_temp=="great britain"
replace investor_state_temp="england/massachusetts" if investor_city_temp=="london/boston" & investor_state_temp=="england"
replace investor_state_temp="england/illinois" if investor_city_temp=="london/chicago" & investor_state_temp=="illinois"
replace investor_state_temp="england/canada" if investor_city_temp=="london/montreal" & investor_state_temp=="england"
replace investor_state_temp="england/new york" if investor_city_temp=="london/new york" & investor_state_temp=="great britain"
replace investor_state_temp="england/new york" if investor_city_temp=="london/new york" & investor_state_temp=="new york"
replace investor_state_temp="england/new york" if investor_city_temp=="london/new york city" & investor_state_temp=="england"
replace investor_state_temp="england/canada" if investor_city_temp=="london/ontario" & investor_state_temp=="canada"
replace investor_state_temp="england/canada" if investor_city_temp=="london/toronto" & investor_state_temp=="canada"
replace investor_state_temp="england/canada" if investor_city_temp=="london/toronto" & investor_state_temp=="england"
replace investor_state_temp="germany/new york" if investor_city_temp=="mannheim/new york" & investor_state_temp=="new york"
replace investor_state_temp="germany/connecticut" if investor_city_temp=="munich/hartford" & investor_state_temp=="connecticut"
replace investor_state_temp="germany/new york" if investor_city_temp=="munich/new york" & investor_state_temp=="new york"
replace investor_state_temp="germany/new york" if investor_city_temp=="munich/new york" & investor_state_temp=="germany"
replace investor_state_temp="new york" if investor_city_temp=="new york" & investor_state_temp=="scotland/pennsylvania"
replace investor_state_temp="england/new york" if investor_city_temp=="norwich/new york" & investor_state_temp=="new york"
replace investor_state_temp="england/new york" if investor_city_temp=="norwich/new york" & investor_state_temp=="england"
replace investor_state_temp="france/new york" if investor_city_temp=="paris/new york" & investor_state_temp=="new york"
replace investor_state_temp="france/rhode island" if investor_city_temp=="paris/providence" & investor_state_temp=="rhode island"
replace investor_state_temp="france/rhode island" if investor_city_temp=="paris/providence" & investor_state_temp=="france"
replace investor_state_temp="rhode island" if investor_city_temp=="pawtucket" & investor_state_temp=="england/new york"
replace investor_state_temp="scotland/new york" if investor_city_temp=="perth/new york" & investor_state_temp=="new york"
replace investor_state_temp="scotland/pennsylvania" if investor_city_temp=="perth/philadelphia" & investor_state_temp=="new york"
replace investor_state_temp="scotland/pennsylvania" if investor_city_temp=="perth/philadelphia" & investor_state_temp=="new hampshire"
replace investor_state_temp="scotland/pennsylvania" if investor_city_temp=="perth/philadelphia" & investor_state_temp=="pennsylvania"
replace investor_state_temp="scotland/pennsylvania" if investor_city_temp=="perth/philadelphia" & investor_state_temp=="scotland"
replace investor_city_temp="st petersburg/new york" if investor_city_temp=="st petersburg/russia" & investor_state_temp=="new york/new york"
replace investor_state_temp="china/new york" if investor_city_temp=="shanghai/new york city" & investor_state_temp=="new york"
replace investor_state_temp="russia/new york" if investor_city_temp=="st petersburg/new york" & investor_state_temp=="new york"
replace investor_state_temp="russia/new york" if investor_city_temp=="st petersburg/new york" & investor_state_temp=="russia"
replace investor_state_temp="russia/new york" if investor_city_temp=="st petersburg/new york" & investor_state_temp=="new hampshire"
replace investor_state_temp="russia/new york" if investor_city_temp=="st petersburg/new york city" & investor_state_temp=="new york"
replace investor_state_temp="russia/new york" if investor_city_temp=="st petersburg/new york city" & investor_state_temp=="russia"
replace investor_state_temp="poland/illinois" if investor_city_temp=="stettin/chicago" & investor_state_temp=="illinois"
replace investor_state_temp="poland/new york" if investor_city_temp=="stettin/new york" & investor_state_temp=="new york"
replace investor_state_temp="sweden/new york" if investor_city_temp=="stockholm/new york" & investor_state_temp=="new york"
replace investor_state_temp="sweden/new york" if investor_city_temp=="stockholm/new york city" & investor_state_temp=="sweden"
replace investor_state_temp="canada/new york" if investor_city_temp=="toronto/new york" & investor_state_temp=="new york"
replace investor_state_temp="canada/new york" if investor_city_temp=="waterloo/ontario" & investor_state_temp=="canada"
replace investor_state_temp="england/canada" if investor_city_temp=="york/montreal" & investor_state_temp=="england"
replace investor_state_temp="switzerland/new york" if investor_city_temp=="zurich/new york" & investor_state_temp=="new york"
replace investor_state_temp="england/new york" if investor_city_temp=="york/new york" & investor_state_temp=="new york/new york"
replace investor_state_temp="england/new york" if investor_city_temp=="london/new york" & investor_state_temp=="new york/new york"
replace investor_state_temp="russia/new york" if investor_city_temp=="st petersburg/new york" & investor_state_temp=="new york/new york"
replace investor_city_temp="philadelphia" if invname_hold_orig=="Aldine Trust Company" & investor_city_temp==""
replace investor_city_temp="boston" if invname_hold_orig=="Columbian National Life Insurance Company" & investor_city_temp==""
replace investor_city_temp="hartford" if invname_hold_orig=="Hartford Steam Boiler Inspection and Insurance Co. (Series A and B)" & investor_city_temp==""
replace investor_city_temp="london/toronto" if invname_hold_orig=="London Mutual Fire Insurance Company of Canada. Toronto" & investor_city_temp==""
replace investor_city_temp="baltimore" if invname_hold_orig=="Maryland Life Insurance Company" & investor_city_temp==""
replace investor_city_temp="boston" if invname_hold_orig=="metropolitan Life Insurance Company" & investor_city_temp==""
replace investor_city_temp="new york" if invname_hold_orig=="Mutual Life Insurance Co." & investor_city_temp==""
replace investor_city_temp="new york" if invname_hold_orig=="New York Life Insurance & Trust Company. New York. N. Y." & investor_city_temp==""
replace investor_city_temp="pawtucket" if invname_hold_orig=="Pawtucket Institution for Savings." & investor_city_temp==""
replace investor_city_temp="stettin" if invname_hold_orig=="Prussian National Ins. Co. Stettin" & investor_city_temp==""
replace investor_city_temp="danbury" if invname_hold_orig=="Savings Bank of Danbury" & investor_city_temp==""
replace investor_city_temp="town of union" if invname_hold_orig=="Weehawken Trust Company" & investor_city_temp==""
replace investor_state_temp="pennsylvania" if invname_hold_orig=="Aldine Trust Company" & investor_state_temp==""
replace investor_state_temp="massachusetts" if invname_hold_orig=="Columbian National Life Insurance Company" & investor_state_temp==""
replace investor_state_temp="connecticut" if invname_hold_orig=="Hartford Steam Boiler Inspection and Insurance Co. (Series A and B)" & investor_state_temp==""
replace investor_state_temp="england/canada" if invname_hold_orig=="London Mutual Fire Insurance Company of Canada. Toronto" & investor_state_temp==""
replace investor_state_temp="maryland" if invname_hold_orig=="Maryland Life Insurance Company" & investor_state_temp==""
replace investor_state_temp="massachusetts" if invname_hold_orig=="metropolitan Life Insurance Company" & investor_state_temp==""
replace investor_state_temp="new york" if invname_hold_orig=="Mutual Life Insurance Co." & investor_state_temp==""
replace investor_state_temp="new york" if invname_hold_orig=="New York Life Insurance & Trust Company. New York. N. Y." & investor_state_temp==""
replace investor_state_temp="rhode island" if invname_hold_orig=="Pawtucket Institution for Savings." & investor_state_temp==""
replace investor_state_temp="germany" if invname_hold_orig=="Prussian National Ins. Co. Stettin" & investor_state_temp==""
replace investor_state_temp="connecticut" if invname_hold_orig=="Savings Bank of Danbury" & investor_state_temp==""
replace investor_state_temp="new jersey" if invname_hold_orig=="Weehawken Trust Company" & investor_state_temp==""

cd "$root_data"
saveold Holdings_Data_InvestorClean.dta, replace

/*
cd "$root_do"
do Investor_Name_Dummy.do

cd "$root_data"
saveold Holdings_Data_InvestorClean_dummy.dta, replace

