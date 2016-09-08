global root_dropbox "D:\Dropbox"
global root_data "$root_dropbox\Bond Rating\Code and Data\dta"
global root_do "$root_dropbox\Bond Rating\Code and Data\do_investor_loc"

set more off
cd "$root_data"
use Holdings_Investor_PreClean.dta, clear

cd "$root_do"
gen mis_state=cond(investor_state_temp=="",1,0)

replace investor_state_temp="pa" if invname_hold_temp=="farmers and mechanic bank" & book_year_hold==1908 &  cname_hold_temp=="american screw" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="templeton savings bank" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="bloomfield trust" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="lanchester savings bank" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="england/ny" if invname_hold_temp=="phoenix assur soc" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="summit trust" & book_year_hold==1911 &  cname_hold_temp=="american type founders" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="new hamphire" if invname_hold_temp=="concord mutual fire insurance concord new hamphire" & book_year_hold==1911 &  cname_hold_temp=="amoskeag manufacturing" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="union mutual home fire insurance qompany" & book_year_hold==1911 &  cname_hold_temp=="arkansaw water" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="wis" if invname_hold_temp=="milwaukee mechanic insurance company" & book_year_hold==1911 &  cname_hold_temp=="armour and" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="maryland" if invname_hold_temp=="maryland home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="atlantic coast line" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="va" if invname_hold_temp=="mutual assurance society" & book_year_hold==1913 &  cname_hold_temp=="atlantic coast line railroad" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="farmers fire insurance of upper and lower sancon town ships" & book_year_hold==1911 &  cname_hold_temp=="baldwin locomotive works" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="industrial trust title and savings philadelphia" & book_year_hold==1913 &  cname_hold_temp=="baldwin locomotive works" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="england/ny" if invname_hold_temp=="palatine ins" & book_year_hold==1908 &  cname_hold_temp=="baltimore and ohio" & coupon_hold=="3.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="richmond insurance of new york" & book_year_hold==1908 &  cname_hold_temp=="baltimore and ohio" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="new london county mutus tt" & book_year_hold==1908 &  cname_hold_temp=="baltimore united heat light and power" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="merchants insurance" & book_year_hold==1908 &  cname_hold_temp=="baltimore united heat light and power" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="title and guaranty rochester n yt" & book_year_hold==1911 &  cname_hold_temp=="bankers realty and security" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="canada/england" if invname_hold_temp=="phoenix assurance" & book_year_hold==1911 &  cname_hold_temp=="bell telephone of canada" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pennsylvania" if invname_hold_temp=="altoona trust altoona pennsylvania" & book_year_hold==1911 &  cname_hold_temp=="bickford fire brick" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="new hamphire" if invname_hold_temp=="new hamphire savings bank concord new hamphire" & book_year_hold==1911 &  cname_hold_temp=="bigelow carpet" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="danvers savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ma" if invname_hold_temp=="city institution for savings" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ma" if invname_hold_temp=="new england mutual home fire insurance boston" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="maiden savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="whiting savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="worcester mutual fire insurance" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ma" if invname_hold_temp=="abington mutual fire insurance" & book_year_hold==1913 &  cname_hold_temp=="boston elevated" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="worcester five cent savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston revere beach and lynn" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="wonsocket institution for savings" & book_year_hold==1908 &  cname_hold_temp=="buffalo and susquehanna railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="mechanic savings bank" & book_year_hold==1908 &  cname_hold_temp=="buffalo new york and erie" & coupon_hold=="7" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="laconia savings bank" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="plymouth guaranty savings bank plymouth" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="monroe county savings bank rochester" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="continental insurance" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="national accident society" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="wonsocket institution for savings woonsocket" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="hartford steam boiler inspec and ins" & book_year_hold==1908 &  cname_hold_temp=="canada southern" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="home home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="canada southern" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="columbus trust" & book_year_hold==1908 &  cname_hold_temp=="canadian northern" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="waterville savings bank" & book_year_hold==1911 &  cname_hold_temp=="central branch" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="broome county trust" & book_year_hold==1911 &  cname_hold_temp=="central leather" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="john hancock mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="central of georgia" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="connecticut federal home fire insurance hartford" & book_year_hold==1908 &  cname_hold_temp=="central ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="columbia national home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="central railroad of new jersey" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ny/london" if invname_hold_temp=="commercial union assurance" & book_year_hold==1911 &  cname_hold_temp=="central railroad of new jersey" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="guardian trust of york" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="lehigh valley trust and safe deposit" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny/scot" if invname_hold_temp=="century ins" & book_year_hold==1913 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="miners savings bank of wilkes barre" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5 &5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="fire association of philadelphia" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="va" if invname_hold_temp=="franklin fire insurance of wheeling" & book_year_hold==1908 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="matteawan savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and alton railroad" & coupon_hold=="3" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="freestone savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and alton railroad" & coupon_hold=="3" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="dime savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and alton railroad" & coupon_hold=="3" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="farmers and mechanic savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and indiana coal" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="chelseu savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and indiana coal" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="saco and birddeford savings institution" & book_year_hold==1911 &  cname_hold_temp=="chicago and north michigan" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="people mutual life ins association and league" & book_year_hold==1911 &  cname_hold_temp=="chicago and north michigan" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="farmers and mechanic savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago burlington and quincy" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="hartford steam boiler inspection and insurance series and and b" & book_year_hold==1913 &  cname_hold_temp=="chicago railways" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="rossia insurance" & book_year_hold==1908 &  cname_hold_temp=="cincinnati indianapolis st louis and chicago" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ca" if invname_hold_temp=="colusa county bank colusa county" & book_year_hold==1911 &  cname_hold_temp=="coast counties light and power" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="ga" if invname_hold_temp=="georgia home insurance" & book_year_hold==1911 &  cname_hold_temp=="columbus manufacturing (georgia)" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="strafford savings bank" & book_year_hold==1913 &  cname_hold_temp=="concord and montreal" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="peter banking" & book_year_hold==1908 &  cname_hold_temp=="concord and montreal" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="union mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="connecticut railway and lighting" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="il" if invname_hold_temp=="illinois home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="crosstown street railway of buffalo" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="savings bank of danbury" & book_year_hold==1908 &  cname_hold_temp=="danbury and norwalk" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="provident county savings bank" & book_year_hold==1913 &  cname_hold_temp=="des moines electric" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="wakefield trust" & book_year_hold==1913 &  cname_hold_temp=="east ohio gas" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="canada" if invname_hold_temp=="london mutual fire insurance of canada toronto" & book_year_hold==1913 &  cname_hold_temp=="electrical development ltd (ontario can)" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="england/ny" if invname_hold_temp=="london guaranty and accident" & book_year_hold==1908 &  cname_hold_temp=="erie and pittsburgh" & coupon_hold=="3.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="people savings bank of pittsburgh pittsburgh" & book_year_hold==1911 &  cname_hold_temp=="exited states glass" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="union trust" & book_year_hold==1913 &  cname_hold_temp=="frick coke (h c)" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="cranford trust" & book_year_hold==1913 &  cname_hold_temp=="german american car" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="delaware county trust safe deposit and title insurance" & book_year_hold==1911 &  cname_hold_temp=="gogebic service" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="savings and trust of indiana" & book_year_hold==1908 &  cname_hold_temp=="greenwich coal and coke" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="mechanic bank harrisburg" & book_year_hold==1908 &  cname_hold_temp=="halifax electric tramway ltd" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="doylestown trust" & book_year_hold==1911 &  cname_hold_temp=="harrisburg light heat and power" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="fidelity mutual home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="harrisburg light heat and power" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="equitable life assurance society" & book_year_hold==1911 &  cname_hold_temp=="hudson and manhattan" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="continental insurance" & book_year_hold==1911 &  cname_hold_temp=="illinois central" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="new jersey title guaranty and trust" & book_year_hold==1911 &  cname_hold_temp=="international paper" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="wash" if invname_hold_temp=="western empire insurance" & book_year_hold==1911 &  cname_hold_temp=="interstate telephone" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="ia" if invname_hold_temp=="hawkeye and des moines fire insurance" & book_year_hold==1911 &  cname_hold_temp=="iowa central" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="guaranty trust and safe deposit tts" & book_year_hold==1913 &  cname_hold_temp=="lehigh and wilkes barre coal" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="pa/scotland" if invname_hold_temp=="federal accident fire and life assur" & book_year_hold==1913 &  cname_hold_temp=="lehigh valley railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny/scot" if invname_hold_temp=="century insurance" & book_year_hold==1913 &  cname_hold_temp=="louisville and nashville" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="maiden savings bank" & book_year_hold==1911 &  cname_hold_temp=="maine water" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="pennsylvania trust norristown" & book_year_hold==1911 &  cname_hold_temp=="manufacturers coal and coke" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="trust and deposit of onondaza" & book_year_hold==1911 &  cname_hold_temp=="marquette and south eastern" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="piscataquis savings bank dover" & book_year_hold==1908 &  cname_hold_temp=="masonic building association (biddeford maine)" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="morristown trust" & book_year_hold==1911 &  cname_hold_temp=="metropolitan street" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="" if invname_hold_temp=="ttohfiosifprp tnj^jt" & book_year_hold==1911 &  cname_hold_temp=="missouri pacific" & coupon_hold=="3" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="trust and deposit of onondaza" & book_year_hold==1911 &  cname_hold_temp=="missouri pacific" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="commercial trust of reading" & book_year_hold==1908 &  cname_hold_temp=="mountain city water" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="monongabela city trust" & book_year_hold==1911 &  cname_hold_temp=="national glass" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="la" if invname_hold_temp=="mechanic and traders insurance" & book_year_hold==1911 &  cname_hold_temp=="new orleans railway and light" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="new york home fire insurance and trust new york new york" & book_year_hold==1911 &  cname_hold_temp=="new york and harlem" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="central trust" & book_year_hold==1913 &  cname_hold_temp=="new york gas electric light heat and power" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="morton trust new york" & book_year_hold==1908 &  cname_hold_temp=="north american" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="manchester savings bank" & book_year_hold==1908 &  cname_hold_temp=="northern pacific" & coupon_hold=="3" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="audroscoggin county savings bank" & book_year_hold==1908 &  cname_hold_temp=="omaha street" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="stater trust" & book_year_hold==1911 &  cname_hold_temp=="oneonta light and power" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ca" if invname_hold_temp=="bank of arroyo grande" & book_year_hold==1913 &  cname_hold_temp=="pacific telephone and telegraph" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ca" if invname_hold_temp=="california bank oakland" & book_year_hold==1908 &  cname_hold_temp=="palm fruit stock" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="people safe deposit and trust" & book_year_hold==1908 &  cname_hold_temp=="passaic water" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="people bank and trust" & book_year_hold==1908 &  cname_hold_temp=="passaic water" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="pawtucket institution for savings" & book_year_hold==1908 &  cname_hold_temp=="pawtucket electrict ompany" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="wyoming valley trust wilkes barre" & book_year_hold==1908 &  cname_hold_temp=="pennsylvania central brewing" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="philadelphia trust safe deposit and insurance" & book_year_hold==1913 &  cname_hold_temp=="pennsylvania railroad" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="eastport savings bank eastport" & book_year_hold==1913 &  cname_hold_temp=="pere marquette railroad of indiana" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="lehigh valley trust" & book_year_hold==1913 &  cname_hold_temp=="perkiomen" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="" if invname_hold_temp=="for holders of securities of this see industrial and misc section" & book_year_hold==1913 &  cname_hold_temp=="philadelphia" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="county fire insurance" & book_year_hold==1911 &  cname_hold_temp=="philadelphia baltimore and washington" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="freeport bank of freeport pennsylvania t" & book_year_hold==1911 &  cname_hold_temp=="pittsburgh buffalo" & coupon_hold=="3" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="national fire insurance of hartford" & book_year_hold==1911 &  cname_hold_temp=="potomac electric power" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="" if invname_hold_temp=="for holders of securities of this see street railway section" & book_year_hold==1913 &  cname_hold_temp=="public works (bangor maine)" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="" if invname_hold_temp=="for holders of securities of this" & book_year_hold==1913 &  cname_hold_temp=="rochester railway and light" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="canada" if invname_hold_temp=="independent order of foresters supreme court" & book_year_hold==1913 &  cname_hold_temp=="rogers lumber (arkansas)" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="adirondack trust" & book_year_hold==1908 &  cname_hold_temp=="santa paula building and loan association (california)" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="orient insurance" & book_year_hold==1913 &  cname_hold_temp=="savannah florida and western" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="security insurance" & book_year_hold==1908 &  cname_hold_temp=="second national bank" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="ca" if invname_hold_temp=="bank of san bernardino" & book_year_hold==1911 &  cname_hold_temp=="southern pacific railroad o (california)" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="delaware county trust safe deposit and insurance" & book_year_hold==1911 &  cname_hold_temp=="springfield consolidated water" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="spring lake and sea girt stock" & book_year_hold==1911 &  cname_hold_temp=="springfield water (pennsylvania)" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="middletown savings bank" & book_year_hold==1908 &  cname_hold_temp=="st louis iron mountain and southern" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="metropolitan home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="st louis iron mountain and southern" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="jersey city trust" & book_year_hold==1911 &  cname_hold_temp=="st louis iron mountain and southern" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="essex savings bank" & book_year_hold==1908 &  cname_hold_temp=="st paul minneapolis and manitoba" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ma" if invname_hold_temp=="berkshire home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="sunset telephone and telegraph" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="toledo and ohio central" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="pennsylvania mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="toledo and ohio central" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="mutual trust of w chester county" & book_year_hold==1908 &  cname_hold_temp=="toledo and ohio central" & coupon_hold=="4" & mis_state==1
replace investor_state_temp="md" if invname_hold_temp=="maryland casualty" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="england/ny" if invname_hold_temp=="sun insurance office" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="orange county trust" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="pennsylvania trust" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="people savings bank" & book_year_hold==1911 &  cname_hold_temp=="topeka edison" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="real estate title insurance and trust" & book_year_hold==1911 &  cname_hold_temp=="trappe and limerick electric" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="rockland savings" & book_year_hold==1908 &  cname_hold_temp=="trenton passenger" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="lloyds plate glass insurance of new york" & book_year_hold==1911 &  cname_hold_temp=="union typewriter" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="aldine trust" & book_year_hold==1908 &  cname_hold_temp=="united railways investment" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="nh" if invname_hold_temp=="concord mutual fire insurance concord" & book_year_hold==1911 &  cname_hold_temp=="united states rubber" & coupon_hold=="N/A" & mis_state==1
replace investor_state_temp="md" if invname_hold_temp=="united states fidelity and guaranty" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="md" if invname_hold_temp=="maryland home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="cumberland trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="brooklyn trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="franklin trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="carbondale miners and mechanic savings bank" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="mi" if invname_hold_temp=="standard life ft accident insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="citizens bank of freeland" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="national fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="mass" if invname_hold_temp=="hingham mutual fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="jenklntown trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="northern trust k savings" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="lock haven trust and safe deposit" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ct" if invname_hold_temp=="mariners savings bank" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="united states trust of new york" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ma" if invname_hold_temp=="newbury port mutual fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ri" if invname_hold_temp=="newport trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="manayunk trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="frankford trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="finance of pennsylvania" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="jefferson fire insurance of philadelphia" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="me" if invname_hold_temp=="union mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="rochester trust and safe deposit" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="genessee valley trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="security trust of rochester" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="modern protective association" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="sunbury trust and safe deposit" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="trust and deposit of onondaza" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="wilkes barre deposit and savings bank" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="people bank of wilkes barre" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="canada" if invname_hold_temp=="confederation life association toronto" & book_year_hold==1911 &  cname_hold_temp=="west kootenay power and light" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="md" if invname_hold_temp=="maryland motor car insurance" & book_year_hold==1913 &  cname_hold_temp=="western maryland" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="nj" if invname_hold_temp=="prudential insurance" & book_year_hold==1913 &  cname_hold_temp=="western maryland" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="pennsylvania trust" & book_year_hold==1913 &  cname_hold_temp=="western maryland" & coupon_hold=="5" & mis_state==1
replace investor_state_temp="pa" if invname_hold_temp=="delaware county trust safe dep and title insurance" & book_year_hold==1913 &  cname_hold_temp=="western north carolina" & coupon_hold=="6" & mis_state==1
replace investor_state_temp="ny" if invname_hold_temp=="mutual home fire insurance" & book_year_hold==1913 &  cname_hold_temp=="wha and michigan" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="sharpsburg" if invname_hold_temp=="farmers and mechanic bank" & book_year_hold==1908 &  cname_hold_temp=="american screw" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="baldwinvllle" if invname_hold_temp=="templeton savings bank" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="bloomfield" if invname_hold_temp=="bloomfield trust" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="lancaster" if invname_hold_temp=="lanchester savings bank" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="london/new york" if invname_hold_temp=="phoenix assur soc" & book_year_hold==1911 &  cname_hold_temp=="american telephone and telegraph" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="summit" if invname_hold_temp=="summit trust" & book_year_hold==1911 &  cname_hold_temp=="american type founders" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="concord" if invname_hold_temp=="concord mutual fire insurance concord new hamphire" & book_year_hold==1911 &  cname_hold_temp=="amoskeag manufacturing" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="portland" if invname_hold_temp=="union mutual home fire insurance qompany" & book_year_hold==1911 &  cname_hold_temp=="arkansaw water" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="milwaukee" if invname_hold_temp=="milwaukee mechanic insurance company" & book_year_hold==1911 &  cname_hold_temp=="armour and" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="baltimore" if invname_hold_temp=="maryland home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="atlantic coast line" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="richmond" if invname_hold_temp=="mutual assurance society" & book_year_hold==1913 &  cname_hold_temp=="atlantic coast line railroad" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="bethlehem" if invname_hold_temp=="farmers fire insurance of upper and lower sancon town ships" & book_year_hold==1911 &  cname_hold_temp=="baldwin locomotive works" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="industrial trust title and savings philadelphia" & book_year_hold==1913 &  cname_hold_temp=="baldwin locomotive works" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="london/new york" if invname_hold_temp=="palatine ins" & book_year_hold==1908 &  cname_hold_temp=="baltimore and ohio" & coupon_hold=="3.5" & mis_state==1
replace investor_city_temp="west new brighton" if invname_hold_temp=="richmond insurance of new york" & book_year_hold==1908 &  cname_hold_temp=="baltimore and ohio" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="new london" if invname_hold_temp=="new london county mutus tt" & book_year_hold==1908 &  cname_hold_temp=="baltimore united heat light and power" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="bangor" if invname_hold_temp=="merchants insurance" & book_year_hold==1908 &  cname_hold_temp=="baltimore united heat light and power" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="rochester" if invname_hold_temp=="title and guaranty rochester n yt" & book_year_hold==1911 &  cname_hold_temp=="bankers realty and security" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="montreal/london" if invname_hold_temp=="phoenix assurance" & book_year_hold==1911 &  cname_hold_temp=="bell telephone of canada" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="altoona" if invname_hold_temp=="altoona trust altoona pennsylvania" & book_year_hold==1911 &  cname_hold_temp=="bickford fire brick" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="concord" if invname_hold_temp=="new hamphire savings bank concord new hamphire" & book_year_hold==1911 &  cname_hold_temp=="bigelow carpet" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="dan vers" if invname_hold_temp=="danvers savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="lowell" if invname_hold_temp=="city institution for savings" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="boston" if invname_hold_temp=="new england mutual home fire insurance boston" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="warrenv" if invname_hold_temp=="maiden savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="whiting" if invname_hold_temp=="whiting savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="worcester" if invname_hold_temp=="worcester mutual fire insurance" & book_year_hold==1908 &  cname_hold_temp=="boston and maine" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="abington" if invname_hold_temp=="abington mutual fire insurance" & book_year_hold==1913 &  cname_hold_temp=="boston elevated" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="worcester" if invname_hold_temp=="worcester five cent savings bank" & book_year_hold==1908 &  cname_hold_temp=="boston revere beach and lynn" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="woonsocket" if invname_hold_temp=="wonsocket institution for savings" & book_year_hold==1908 &  cname_hold_temp=="buffalo and susquehanna railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="hartford" if invname_hold_temp=="mechanic savings bank" & book_year_hold==1908 &  cname_hold_temp=="buffalo new york and erie" & coupon_hold=="7" & mis_state==1
replace investor_city_temp="laconia" if invname_hold_temp=="laconia savings bank" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="plymouth" if invname_hold_temp=="plymouth guaranty savings bank plymouth" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="rochester" if invname_hold_temp=="monroe county savings bank rochester" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="continental insurance" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="national accident society" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="woonsocket" if invname_hold_temp=="wonsocket institution for savings woonsocket" & book_year_hold==1908 &  cname_hold_temp=="buffalo rochester and pittsburgh" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="hartford" if invname_hold_temp=="hartford steam boiler inspec and ins" & book_year_hold==1908 &  cname_hold_temp=="canada southern" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="home home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="canada southern" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="newburgh" if invname_hold_temp=="columbus trust" & book_year_hold==1908 &  cname_hold_temp=="canadian northern" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="waterville" if invname_hold_temp=="waterville savings bank" & book_year_hold==1911 &  cname_hold_temp=="central branch" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="binghamton" if invname_hold_temp=="broome county trust" & book_year_hold==1911 &  cname_hold_temp=="central leather" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="boston" if invname_hold_temp=="john hancock mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="central of georgia" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="hartford" if invname_hold_temp=="connecticut federal home fire insurance hartford" & book_year_hold==1908 &  cname_hold_temp=="central ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="boston" if invname_hold_temp=="columbia national home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="central railroad of new jersey" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="ny/england" if invname_hold_temp=="commercial union assurance" & book_year_hold==1911 &  cname_hold_temp=="central railroad of new jersey" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="york" if invname_hold_temp=="guardian trust of york" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="allentown" if invname_hold_temp=="lehigh valley trust and safe deposit" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="ny/edinburgh" if invname_hold_temp=="century ins" & book_year_hold==1913 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="wilkes barre" if invname_hold_temp=="miners savings bank of wilkes barre" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5 &5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="fire association of philadelphia" & book_year_hold==1911 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="wheeling w" if invname_hold_temp=="franklin fire insurance of wheeling" & book_year_hold==1908 &  cname_hold_temp=="chesapeake and ohio" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="matteawan" if invname_hold_temp=="matteawan savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and alton railroad" & coupon_hold=="3" & mis_state==1
replace investor_city_temp="portland" if invname_hold_temp=="freestone savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and alton railroad" & coupon_hold=="3" & mis_state==1
replace investor_city_temp="waterbury" if invname_hold_temp=="dime savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and alton railroad" & coupon_hold=="3" & mis_state==1
replace investor_city_temp="middletown" if invname_hold_temp=="farmers and mechanic savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and indiana coal" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="norwich" if invname_hold_temp=="chelseu savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago and indiana coal" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="saco" if invname_hold_temp=="saco and birddeford savings institution" & book_year_hold==1911 &  cname_hold_temp=="chicago and north michigan" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="syracuse" if invname_hold_temp=="people mutual life ins association and league" & book_year_hold==1911 &  cname_hold_temp=="chicago and north michigan" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="lockport" if invname_hold_temp=="farmers and mechanic savings bank" & book_year_hold==1911 &  cname_hold_temp=="chicago burlington and quincy" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="hartford" if invname_hold_temp=="hartford steam boiler inspection and insurance series and and b" & book_year_hold==1913 &  cname_hold_temp=="chicago railways" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="st petersburg" if invname_hold_temp=="rossia insurance" & book_year_hold==1908 &  cname_hold_temp=="cincinnati indianapolis st louis and chicago" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="colusa county" if invname_hold_temp=="colusa county bank colusa county" & book_year_hold==1911 &  cname_hold_temp=="coast counties light and power" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="columbus" if invname_hold_temp=="georgia home insurance" & book_year_hold==1911 &  cname_hold_temp=="columbus manufacturing (georgia)" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="dover" if invname_hold_temp=="strafford savings bank" & book_year_hold==1913 &  cname_hold_temp=="concord and montreal" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="exeter" if invname_hold_temp=="peter banking" & book_year_hold==1908 &  cname_hold_temp=="concord and montreal" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="portland" if invname_hold_temp=="union mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="connecticut railway and lighting" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="chicago" if invname_hold_temp=="illinois home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="crosstown street railway of buffalo" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="danbury" if invname_hold_temp=="savings bank of danbury" & book_year_hold==1908 &  cname_hold_temp=="danbury and norwalk" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="pawtucket" if invname_hold_temp=="provident county savings bank" & book_year_hold==1913 &  cname_hold_temp=="des moines electric" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="wakefield" if invname_hold_temp=="wakefield trust" & book_year_hold==1913 &  cname_hold_temp=="east ohio gas" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="toronto" if invname_hold_temp=="london mutual fire insurance of canada toronto" & book_year_hold==1913 &  cname_hold_temp=="electrical development ltd (ontario can)" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="london/new york" if invname_hold_temp=="london guaranty and accident" & book_year_hold==1908 &  cname_hold_temp=="erie and pittsburgh" & coupon_hold=="3.5" & mis_state==1
replace investor_city_temp="pittsburgh" if invname_hold_temp=="people savings bank of pittsburgh pittsburgh" & book_year_hold==1911 &  cname_hold_temp=="exited states glass" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="pittsburgh" if invname_hold_temp=="union trust" & book_year_hold==1913 &  cname_hold_temp=="frick coke (h c)" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="cranford" if invname_hold_temp=="cranford trust" & book_year_hold==1913 &  cname_hold_temp=="german american car" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="" if invname_hold_temp=="delaware county trust safe deposit and title insurance" & book_year_hold==1911 &  cname_hold_temp=="gogebic service" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="indiana" if invname_hold_temp=="savings and trust of indiana" & book_year_hold==1908 &  cname_hold_temp=="greenwich coal and coke" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="harrisburg" if invname_hold_temp=="mechanic bank harrisburg" & book_year_hold==1908 &  cname_hold_temp=="halifax electric tramway ltd" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="doylestown" if invname_hold_temp=="doylestown trust" & book_year_hold==1911 &  cname_hold_temp=="harrisburg light heat and power" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="fidelity mutual home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="harrisburg light heat and power" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="equitable life assurance society" & book_year_hold==1911 &  cname_hold_temp=="hudson and manhattan" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="continental insurance" & book_year_hold==1911 &  cname_hold_temp=="illinois central" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="jersey city" if invname_hold_temp=="new jersey title guaranty and trust" & book_year_hold==1911 &  cname_hold_temp=="international paper" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="spokane" if invname_hold_temp=="western empire insurance" & book_year_hold==1911 &  cname_hold_temp=="interstate telephone" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="des moines" if invname_hold_temp=="hawkeye and des moines fire insurance" & book_year_hold==1911 &  cname_hold_temp=="iowa central" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="guaranty trust and safe deposit tts" & book_year_hold==1913 &  cname_hold_temp=="lehigh and wilkes barre coal" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="philadelphia/perth" if invname_hold_temp=="federal accident fire and life assur" & book_year_hold==1913 &  cname_hold_temp=="lehigh valley railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="ny/edinburgh" if invname_hold_temp=="century insurance" & book_year_hold==1913 &  cname_hold_temp=="louisville and nashville" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="rockport" if invname_hold_temp=="maiden savings bank" & book_year_hold==1911 &  cname_hold_temp=="maine water" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="norristown" if invname_hold_temp=="pennsylvania trust norristown" & book_year_hold==1911 &  cname_hold_temp=="manufacturers coal and coke" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="syracuse" if invname_hold_temp=="trust and deposit of onondaza" & book_year_hold==1911 &  cname_hold_temp=="marquette and south eastern" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="dover" if invname_hold_temp=="piscataquis savings bank dover" & book_year_hold==1908 &  cname_hold_temp=="masonic building association (biddeford maine)" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="morristown" if invname_hold_temp=="morristown trust" & book_year_hold==1911 &  cname_hold_temp=="metropolitan street" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="pwad�iphio" if invname_hold_temp=="ttohfiosifprp tnj^jt" & book_year_hold==1911 &  cname_hold_temp=="missouri pacific" & coupon_hold=="3" & mis_state==1
replace investor_city_temp="syracuse" if invname_hold_temp=="trust and deposit of onondaza" & book_year_hold==1911 &  cname_hold_temp=="missouri pacific" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="reading" if invname_hold_temp=="commercial trust of reading" & book_year_hold==1908 &  cname_hold_temp=="mountain city water" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="monogabela" if invname_hold_temp=="monongabela city trust" & book_year_hold==1911 &  cname_hold_temp=="national glass" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="new orleans" if invname_hold_temp=="mechanic and traders insurance" & book_year_hold==1911 &  cname_hold_temp=="new orleans railway and light" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="new york home fire insurance and trust new york new york" & book_year_hold==1911 &  cname_hold_temp=="new york and harlem" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="central trust" & book_year_hold==1913 &  cname_hold_temp=="new york gas electric light heat and power" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="morton trust new york" & book_year_hold==1908 &  cname_hold_temp=="north american" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="manchester" if invname_hold_temp=="manchester savings bank" & book_year_hold==1908 &  cname_hold_temp=="northern pacific" & coupon_hold=="3" & mis_state==1
replace investor_city_temp="lewiston" if invname_hold_temp=="audroscoggin county savings bank" & book_year_hold==1908 &  cname_hold_temp=="omaha street" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="pawtucket" if invname_hold_temp=="stater trust" & book_year_hold==1911 &  cname_hold_temp=="oneonta light and power" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="arroyo grande" if invname_hold_temp=="bank of arroyo grande" & book_year_hold==1913 &  cname_hold_temp=="pacific telephone and telegraph" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="oakland" if invname_hold_temp=="california bank oakland" & book_year_hold==1908 &  cname_hold_temp=="palm fruit stock" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="jersey city" if invname_hold_temp=="people safe deposit and trust" & book_year_hold==1908 &  cname_hold_temp=="passaic water" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="passaic" if invname_hold_temp=="people bank and trust" & book_year_hold==1908 &  cname_hold_temp=="passaic water" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="pawtucket" if invname_hold_temp=="pawtucket institution for savings" & book_year_hold==1908 &  cname_hold_temp=="pawtucket electrict ompany" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="wilkes barre" if invname_hold_temp=="wyoming valley trust wilkes barre" & book_year_hold==1908 &  cname_hold_temp=="pennsylvania central brewing" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="philadelphia trust safe deposit and insurance" & book_year_hold==1913 &  cname_hold_temp=="pennsylvania railroad" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="eastport" if invname_hold_temp=="eastport savings bank eastport" & book_year_hold==1913 &  cname_hold_temp=="pere marquette railroad of indiana" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="allentown" if invname_hold_temp=="lehigh valley trust" & book_year_hold==1913 &  cname_hold_temp=="perkiomen" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="" if invname_hold_temp=="for holders of securities of this see industrial and misc section" & book_year_hold==1913 &  cname_hold_temp=="philadelphia" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="county fire insurance" & book_year_hold==1911 &  cname_hold_temp=="philadelphia baltimore and washington" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="freeport" if invname_hold_temp=="freeport bank of freeport pennsylvania t" & book_year_hold==1911 &  cname_hold_temp=="pittsburgh buffalo" & coupon_hold=="3" & mis_state==1
replace investor_city_temp="hartford" if invname_hold_temp=="national fire insurance of hartford" & book_year_hold==1911 &  cname_hold_temp=="potomac electric power" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="" if invname_hold_temp=="for holders of securities of this see street railway section" & book_year_hold==1913 &  cname_hold_temp=="public works (bangor maine)" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="see industrial and miscellaneous section" if invname_hold_temp=="for holders of securities of this" & book_year_hold==1913 &  cname_hold_temp=="rochester railway and light" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="toronto" if invname_hold_temp=="independent order of foresters supreme court" & book_year_hold==1913 &  cname_hold_temp=="rogers lumber (arkansas)" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="saratoga springs" if invname_hold_temp=="adirondack trust" & book_year_hold==1908 &  cname_hold_temp=="santa paula building and loan association (california)" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="hartford" if invname_hold_temp=="orient insurance" & book_year_hold==1913 &  cname_hold_temp=="savannah florida and western" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="new haven" if invname_hold_temp=="security insurance" & book_year_hold==1908 &  cname_hold_temp=="second national bank" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="san bernardino" if invname_hold_temp=="bank of san bernardino" & book_year_hold==1911 &  cname_hold_temp=="southern pacific railroad o (california)" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="chester" if invname_hold_temp=="delaware county trust safe deposit and insurance" & book_year_hold==1911 &  cname_hold_temp=="springfield consolidated water" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="pennsylvania" if invname_hold_temp=="spring lake and sea girt stock" & book_year_hold==1911 &  cname_hold_temp=="springfield water (pennsylvania)" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="middletown" if invname_hold_temp=="middletown savings bank" & book_year_hold==1908 &  cname_hold_temp=="st louis iron mountain and southern" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="metropolitan home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="st louis iron mountain and southern" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="jersey city" if invname_hold_temp=="jersey city trust" & book_year_hold==1911 &  cname_hold_temp=="st louis iron mountain and southern" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="essex" if invname_hold_temp=="essex savings bank" & book_year_hold==1908 &  cname_hold_temp=="st paul minneapolis and manitoba" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="pittsfield" if invname_hold_temp=="berkshire home fire insurance" & book_year_hold==1911 &  cname_hold_temp=="sunset telephone and telegraph" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="toledo and ohio central" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="pennsylvania mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="toledo and ohio central" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="port chester" if invname_hold_temp=="mutual trust of w chester county" & book_year_hold==1908 &  cname_hold_temp=="toledo and ohio central" & coupon_hold=="4" & mis_state==1
replace investor_city_temp="baltimore" if invname_hold_temp=="maryland casualty" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="london/new york" if invname_hold_temp=="sun insurance office" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="middletown" if invname_hold_temp=="orange county trust" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="norristown" if invname_hold_temp=="pennsylvania trust" & book_year_hold==1908 &  cname_hold_temp=="toledo st louis and western" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="woonsocket" if invname_hold_temp=="people savings bank" & book_year_hold==1911 &  cname_hold_temp=="topeka edison" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="real estate title insurance and trust" & book_year_hold==1911 &  cname_hold_temp=="trappe and limerick electric" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="rockland" if invname_hold_temp=="rockland savings" & book_year_hold==1908 &  cname_hold_temp=="trenton passenger" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="lloyds plate glass insurance of new york" & book_year_hold==1911 &  cname_hold_temp=="union typewriter" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="aldine trust" & book_year_hold==1908 &  cname_hold_temp=="united railways investment" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="concord" if invname_hold_temp=="concord mutual fire insurance concord" & book_year_hold==1911 &  cname_hold_temp=="united states rubber" & coupon_hold=="N/A" & mis_state==1
replace investor_city_temp="baltimore" if invname_hold_temp=="united states fidelity and guaranty" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="baltimore" if invname_hold_temp=="maryland home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="bridgeton" if invname_hold_temp=="cumberland trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="brooklyn" if invname_hold_temp=="brooklyn trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="brooklyn" if invname_hold_temp=="franklin trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="carbondale" if invname_hold_temp=="carbondale miners and mechanic savings bank" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="detroit" if invname_hold_temp=="standard life ft accident insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="freeland" if invname_hold_temp=="citizens bank of freeland" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="hartford" if invname_hold_temp=="national fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="hingham" if invname_hold_temp=="hingham mutual fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="jenkintown" if invname_hold_temp=="jenklntown trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="lancaster" if invname_hold_temp=="northern trust k savings" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="lock haven" if invname_hold_temp=="lock haven trust and safe deposit" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="new london" if invname_hold_temp=="mariners savings bank" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="new york" if invname_hold_temp=="united states trust of new york" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="newburyport" if invname_hold_temp=="newbury port mutual fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="newport" if invname_hold_temp=="newport trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="manayunk trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="frankford trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="finance of pennsylvania" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="philadelphia" if invname_hold_temp=="jefferson fire insurance of philadelphia" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="portland" if invname_hold_temp=="union mutual home fire insurance" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="rochester" if invname_hold_temp=="rochester trust and safe deposit" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="rochester" if invname_hold_temp=="genessee valley trust" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="rochester" if invname_hold_temp=="security trust of rochester" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="sayre" if invname_hold_temp=="modern protective association" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="4.5" & mis_state==1
replace investor_city_temp="sunbury" if invname_hold_temp=="sunbury trust and safe deposit" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="syracuse" if invname_hold_temp=="trust and deposit of onondaza" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="wilkesbarre" if invname_hold_temp=="wilkes barre deposit and savings bank" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="wilkesbarre" if invname_hold_temp=="people bank of wilkes barre" & book_year_hold==1908 &  cname_hold_temp=="wabash railroad" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="toronto" if invname_hold_temp=="confederation life association toronto" & book_year_hold==1911 &  cname_hold_temp=="west kootenay power and light" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="baltimore" if invname_hold_temp=="maryland motor car insurance" & book_year_hold==1913 &  cname_hold_temp=="western maryland" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="newark" if invname_hold_temp=="prudential insurance" & book_year_hold==1913 &  cname_hold_temp=="western maryland" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="reading" if invname_hold_temp=="pennsylvania trust" & book_year_hold==1913 &  cname_hold_temp=="western maryland" & coupon_hold=="5" & mis_state==1
replace investor_city_temp="chester" if invname_hold_temp=="delaware county trust safe dep and title insurance" & book_year_hold==1913 &  cname_hold_temp=="western north carolina" & coupon_hold=="6" & mis_state==1
replace investor_city_temp="ny" if invname_hold_temp=="mutual home fire insurance" & book_year_hold==1913 &  cname_hold_temp=="wha and michigan" & coupon_hold=="4.5" & mis_state==1
cap drop mis_state
replace investor_state_temp= ustrfix(investor_state_temp, "")
replace investor_state_temp=subinword(investor_state_temp,"branch","",.)
replace investor_state_temp=strtrim(investor_state_temp)
replace investor_state_temp=stritrim(investor_state_temp)

* split state & revise
cap drop investor_state_1 investor_state_2 investor_state_3

split investor_state_temp, p("/") gen(investor_state_)
foreach i in "temp" "1" "2" "3"{
global x="investor_state_`i'"
do statelist.do
}

*Dummy that help to revise state
gen temp_d=0
replace temp_d=1 if investor_state_1=="alabama"
replace temp_d=1 if investor_state_1=="albany"
replace temp_d=1 if investor_state_1=="arizona"
replace temp_d=1 if investor_state_1=="arkansas"
replace temp_d=2 if investor_state_1=="auckland"
replace temp_d=3 if investor_state_1=="australia"
replace temp_d=3 if investor_state_1=="austria"
replace temp_d=2 if investor_state_1=="baltimore"
replace temp_d=23 if investor_state_1=="bavaria"
replace temp_d=2 if investor_state_1=="boston"
replace temp_d=4 if investor_state_1=="boston massachusetts"
replace temp_d=2 if investor_state_1=="brooklyn"
replace temp_d=2 if investor_state_1=="buffalo"
replace temp_d=3 if investor_state_1=="bulgaria"
replace temp_d=4 if investor_state_1=="bulgariaconn"
replace temp_d=1 if investor_state_1=="cal"
replace temp_d=1 if investor_state_1=="california"
replace temp_d=14 if investor_state_1=="california shares"
replace temp_d=3 if investor_state_1=="canada"
replace temp_d=4 if investor_state_1=="canada illinois"
replace temp_d=24 if investor_state_1=="canada school dist"
replace temp_d=3 if investor_state_1=="canadan"
replace temp_d=3 if investor_state_1=="canadian"
replace temp_d=1 if investor_state_1=="ccnn"
replace temp_d=2 if investor_state_1=="chester"
replace temp_d=2 if investor_state_1=="chicago"
replace temp_d=4 if investor_state_1=="chicago illinois"
replace temp_d=3 if investor_state_1=="china"
replace temp_d=1 if investor_state_1=="colorado"
replace temp_d=2 if investor_state_1=="concord"
replace temp_d=1 if investor_state_1=="connecticut"
replace temp_d=2 if investor_state_1=="danbury"
replace temp_d=1 if investor_state_1=="debentures"
replace temp_d=1 if investor_state_1=="delaware"
replace temp_d=1 if investor_state_1=="dist. of columbia"
replace temp_d=23 if investor_state_1=="edinbnrgh"
replace temp_d=23 if investor_state_1=="edinburgh"
replace temp_d=2 if investor_state_1=="elmira"
replace temp_d=34 if investor_state_1=="engcan"
replace temp_d=34 if investor_state_1=="engcanada"
replace temp_d=3 if investor_state_1=="england"
replace temp_d=34 if investor_state_1=="england canada"
replace temp_d=34 if investor_state_1=="england land"
replace temp_d=34 if investor_state_1=="england massachusetts"
replace temp_d=34 if investor_state_1=="england new york"
replace temp_d=34 if investor_state_1=="england ontcan"
replace temp_d=3 if investor_state_1=="england u s"
replace temp_d=34 if investor_state_1=="englandn y"
replace temp_d=34 if investor_state_1=="engmontreal"
replace temp_d=34 if investor_state_1=="engn y"
replace temp_d=34 if investor_state_1=="engny"
replace temp_d=34 if investor_state_1=="exeter new hampshire"
replace temp_d=2 if investor_state_1=="fall river"
replace temp_d=1 if investor_state_1=="florida"
replace temp_d=3 if investor_state_1=="france"
replace temp_d=1 if investor_state_1=="georgia"
replace temp_d=3 if investor_state_1=="germ"
replace temp_d=3 if investor_state_1=="germa"
replace temp_d=3 if investor_state_1=="german y"
replace temp_d=3 if investor_state_1=="german y u s"
replace temp_d=3 if investor_state_1=="germany"
replace temp_d=3 if investor_state_1=="germany many"
replace temp_d=3 if investor_state_1=="germany u s"
replace temp_d=3 if investor_state_1=="germanyn"
replace temp_d=23 if investor_state_1=="gothenburg"
replace temp_d=3 if investor_state_1=="great britain"
replace temp_d=3 if investor_state_1=="great itain"
replace temp_d=3 if investor_state_1=="greatbrit"
replace temp_d=3 if investor_state_1=="greatbritain"
replace temp_d=3 if investor_state_1=="gt britain"
replace temp_d=3 if investor_state_1=="gt itain"
replace temp_d=2 if investor_state_1=="hartford"
replace temp_d=1 if investor_state_1=="hawah"
replace temp_d=1 if investor_state_1=="hawaii"
replace temp_d=3 if investor_state_1=="holand"
replace temp_d=3 if investor_state_1=="holland"
replace temp_d=1 if investor_state_1=="i north dakota"
replace temp_d=1 if investor_state_1=="illinois"
replace temp_d=1 if investor_state_1=="indiana"
replace temp_d=3 if investor_state_1=="indianapolis"
replace temp_d=1 if investor_state_1=="iowa"
replace temp_d=3 if investor_state_1=="japan"
replace temp_d=2 if investor_state_1=="jersey cit"
replace temp_d=1 if investor_state_1=="kansas"
replace temp_d=2 if investor_state_1=="keene"
replace temp_d=1 if investor_state_1=="kentucky"
replace temp_d=2 if investor_state_1=="knoxville"
replace temp_d=23 if investor_state_1=="liverpool"
replace temp_d=23 if investor_state_1=="london"
replace temp_d=1 if investor_state_1=="louisiana"
replace temp_d=2 if investor_state_1=="lynchburg"
replace temp_d=1 if investor_state_1=="maas"
replace temp_d=2 if investor_state_1=="maccabees"
replace temp_d=1 if investor_state_1=="maine"
replace temp_d=4 if investor_state_1=="maine common"
replace temp_d=4 if investor_state_1=="maine preferred"
replace temp_d=4 if investor_state_1=="maine rapid transit"
replace temp_d=34 if investor_state_1=="man canada"
replace temp_d=1 if investor_state_1=="maryland"
replace temp_d=1 if investor_state_1=="massachusetts"
replace temp_d=1 if investor_state_1=="massl"
replace temp_d=1 if investor_state_1=="masss"
replace temp_d=1 if investor_state_1=="michigan"
replace temp_d=14 if investor_state_1=="michigan sewer"
replace temp_d=1 if investor_state_1=="michn"
replace temp_d=1 if investor_state_1=="minnesota"
replace temp_d=1 if investor_state_1=="mississippi"
replace temp_d=1 if investor_state_1=="missouri"
replace temp_d=1 if investor_state_1=="mnss"
replace temp_d=2 if investor_state_1=="montana"
replace temp_d=23 if investor_state_1=="montreal"
replace temp_d=1 if investor_state_1=="n vermont"
replace temp_d=1 if investor_state_1=="nebraska"
replace temp_d=1 if investor_state_1=="nevada"
replace temp_d=1 if investor_state_1=="new hamphire"
replace temp_d=1 if investor_state_1=="new hampshire"
replace temp_d=1 if investor_state_1=="new jersey"
replace temp_d=1 if investor_state_1=="new york"
replace temp_d=1 if investor_state_1=="new york c"
replace temp_d=2 if investor_state_1=="new york city"
replace temp_d=4 if investor_state_1=="new york england"
replace temp_d=3 if investor_state_1=="new zealand"
replace temp_d=2 if investor_state_1=="newburyport"
replace temp_d=4 if investor_state_1=="newburyport massachusetts"
replace temp_d=1 if investor_state_1=="newyork"
replace temp_d=3 if investor_state_1=="newzealand"
replace temp_d=1 if investor_state_1=="nor th carolina"
replace temp_d=1 if investor_state_1=="nor th dakota"
replace temp_d=1 if investor_state_1=="north carolina"
replace temp_d=1 if investor_state_1=="north dakota"
replace temp_d=4 if investor_state_1=="obispo california"
replace temp_d=1 if investor_state_1=="ohio"
replace temp_d=1 if investor_state_1=="oklahoma"
replace temp_d=2 if investor_state_1=="omaha"
replace temp_d=23 if investor_state_1=="ont"
replace temp_d=34 if investor_state_1=="ont canada"
replace temp_d=23 if investor_state_1=="onta"
replace temp_d=23 if investor_state_1=="ontan"
replace temp_d=23 if investor_state_1=="ontario"
replace temp_d=34 if investor_state_1=="ontcan"
replace temp_d=1 if investor_state_1=="oregon"
replace temp_d=34 if investor_state_1=="out canada"
replace temp_d=34 if investor_state_1=="outcan"
replace temp_d=1 if investor_state_1=="pennsylvania"
replace temp_d=2 if investor_state_1=="phia"
replace temp_d=2 if investor_state_1=="phila"
replace temp_d=2 if investor_state_1=="philadelphia"
replace temp_d=4 if investor_state_1=="provincetown massachusetts"
replace temp_d=2 if investor_state_1=="pt huron"
replace temp_d=4 if investor_state_1=="pt huron michigan"
replace temp_d=23 if investor_state_1=="quebec"
replace temp_d=1 if investor_state_1=="r l"
replace temp_d=1 if investor_state_1=="rhode island"
replace temp_d=3 if investor_state_1=="russia"
replace temp_d=3 if investor_state_1=="russia u s"
replace temp_d=3 if investor_state_1=="russua"
replace temp_d=2 if investor_state_1=="saco"
replace temp_d=23 if investor_state_1=="saxony"
replace temp_d=3 if investor_state_1=="scot"
replace temp_d=34 if investor_state_1=="scot canada"
replace temp_d=34 if investor_state_1=="scot connecticut"
replace temp_d=34 if investor_state_1=="scot head off indiana canada"
replace temp_d=34 if investor_state_1=="scot head office indiana canada"
replace temp_d=34 if investor_state_1=="scot head office indiana canada montreal"
replace temp_d=3 if investor_state_1=="scot land"
replace temp_d=3 if investor_state_1=="scotl"
replace temp_d=3 if investor_state_1=="scotlan"
replace temp_d=3 if investor_state_1=="scotland"
replace temp_d=34 if investor_state_1=="scotland canada"
replace temp_d=34 if investor_state_1=="scotland head office"
replace temp_d=34 if investor_state_1=="scotland head office indiana canada"
replace temp_d=34 if investor_state_1=="scotlandcanada"
replace temp_d=34 if investor_state_1=="scotlandmontreal"
replace temp_d=34 if investor_state_1=="scotlandny"
replace temp_d=34 if investor_state_1=="scotn y"
replace temp_d=3 if investor_state_1=="sotland"
replace temp_d=1 if investor_state_1=="south carolina"
replace temp_d=1 if investor_state_1=="south dakota"
replace temp_d=3 if investor_state_1=="spain"
replace temp_d=2 if investor_state_1=="springfield"
replace temp_d=23 if investor_state_1=="suffolk"
replace temp_d=3 if investor_state_1=="sweden"
replace temp_d=3 if investor_state_1=="switzerl"
replace temp_d=3 if investor_state_1=="switzerland"
replace temp_d=2 if investor_state_1=="syracuse"
replace temp_d=1 if investor_state_1=="tennessee"
replace temp_d=1 if investor_state_1=="texas"
replace temp_d=23 if investor_state_1=="toronto"
replace temp_d=1 if investor_state_1=="utah"
replace temp_d=1 if investor_state_1=="vermont"
replace temp_d=1 if investor_state_1=="virginia"
replace temp_d=1 if investor_state_1=="w virginia"
replace temp_d=1 if investor_state_1=="washington"
replace temp_d=2 if investor_state_1=="waterbury"
replace temp_d=23 if investor_state_1=="waterloo"
replace temp_d=1 if investor_state_1=="west virginia"
replace temp_d=2 if investor_state_1=="wilmington"
replace temp_d=1 if investor_state_1=="wisconsin"
replace temp_d=1 if investor_state_1=="w is"
replace temp_d=2 if investor_state_1=="woonsocket"
replace temp_d=23 if investor_state_1=="zur ich"
replace temp_d=23 if investor_state_1=="connecticut"


*Easy Revise of State_i
forv i=1/3{
replace investor_state_`i'="bulgaria connecticut" if investor_state_`i'=="bulgariaconn"
replace investor_state_`i'="california" if investor_state_`i'=="cal"
replace investor_state_`i'="california" if investor_state_`i'=="california shares"
replace investor_state_`i'="canada" if investor_state_`i'=="canadian"
replace investor_state_`i'="connecticut" if investor_state_`i'=="ccnn"
replace investor_state_`i'="connecticut" if investor_state_`i'=="cnnn"
replace investor_state_`i'="connecticut" if investor_state_`i'=="coan"
replace investor_state_`i'="connecticut" if investor_state_`i'=="cohn"
replace investor_state_`i'="connecticut" if investor_state_`i'=="con"
replace investor_state_`i'="connecticut" if investor_state_`i'=="conu"
replace investor_state_`i'="connecticut" if investor_state_`i'=="coun"
replace investor_state_`i'="edinburgh" if investor_state_`i'=="edinbnrgh"
replace investor_state_`i'="england canada" if investor_state_`i'=="engcanada"
replace investor_state_`i'="england" if investor_state_`i'=="england u s"
replace investor_state_`i'="england new york" if investor_state_`i'=="englandn y"
replace investor_state_`i'="england montral" if investor_state_`i'=="engmontreal"
replace investor_state_`i'="england new york" if investor_state_`i'=="engn y"
replace investor_state_`i'="england new york" if investor_state_`i'=="engny"
replace investor_state_`i'="germany" if investor_state_`i'=="germ"
replace investor_state_`i'="germany" if investor_state_`i'=="germa"
replace investor_state_`i'="germany" if investor_state_`i'=="german y"
replace investor_state_`i'="germany" if investor_state_`i'=="german y u s"
replace investor_state_`i'="germany" if investor_state_`i'=="germany"
replace investor_state_`i'="germany" if investor_state_`i'=="germany many"
replace investor_state_`i'="germany" if investor_state_`i'=="germany u s"
replace investor_state_`i'="germany" if investor_state_`i'=="germanyn"
replace investor_state_`i'="great britain" if investor_state_`i'=="great britain"
replace investor_state_`i'="great britain" if investor_state_`i'=="great itain"
replace investor_state_`i'="great britain" if investor_state_`i'=="greatbrit"
replace investor_state_`i'="great britain" if investor_state_`i'=="greatbritain"
replace investor_state_`i'="great britain" if investor_state_`i'=="gt britain"
replace investor_state_`i'="great britain" if investor_state_`i'=="gt itain"
replace investor_state_`i'="hawaii" if investor_state_`i'=="hawah"
replace investor_state_`i'="holland" if investor_state_`i'=="holand"
replace investor_state_`i'="north dakota" if investor_state_`i'=="i north dakota"
replace investor_state_`i'="massachusetts" if investor_state_`i'=="maas"
replace investor_state_`i'="massachusetts" if investor_state_`i'=="massl"
replace investor_state_`i'="massachusetts" if investor_state_`i'=="masss"
replace investor_state_`i'="michigan" if investor_state_`i'=="michn"
replace investor_state_`i'="massachusetts" if investor_state_`i'=="mnss"
replace investor_state_`i'="vermont" if investor_state_`i'=="n vermont"
replace investor_state_`i'="new hampshire" if investor_state_`i'=="new hamphire"
replace investor_state_`i'="new york" if investor_state_`i'=="new york c"
replace investor_state_`i'="new york" if investor_state_`i'=="newyork"
replace investor_state_`i'="new zealand" if investor_state_`i'=="newzealand"
replace investor_state_`i'="north carolina" if investor_state_`i'=="nor th carolina"
replace investor_state_`i'="north dakota" if investor_state_`i'=="nor th dakota"
replace investor_state_`i'="ontario" if investor_state_`i'=="ont"
replace investor_state_`i'="ont canada" if investor_state_`i'=="ont canada"
replace investor_state_`i'="ontario" if investor_state_`i'=="onta"
replace investor_state_`i'="ontario" if investor_state_`i'=="ontan"
replace investor_state_`i'="ont canada" if investor_state_`i'=="ontcan"
replace investor_state_`i'="philadelphia" if investor_state_`i'=="phia"
replace investor_state_`i'="philadelphia" if investor_state_`i'=="phila"
replace investor_state_`i'="rhode island" if investor_state_`i'=="r l"
replace investor_state_`i'="russia" if investor_state_`i'=="russia u s"
replace investor_state_`i'="russia" if investor_state_`i'=="russua"
replace investor_state_`i'="scotland" if investor_state_`i'=="scot"
replace investor_state_`i'="scotland canada" if investor_state_`i'=="scot canada"
replace investor_state_`i'="scotland" if investor_state_`i'=="scot land"
replace investor_state_`i'="scotland" if investor_state_`i'=="scotl"
replace investor_state_`i'="scotland" if investor_state_`i'=="scotlan"
replace investor_state_`i'="scotland canada" if investor_state_`i'=="scotlandcanada"
replace investor_state_`i'="scotland montreal" if investor_state_`i'=="scotlandmontreal"
replace investor_state_`i'="scotland new york" if investor_state_`i'=="scotlandny"
replace investor_state_`i'="scotland new york" if investor_state_`i'=="scotn y"
replace investor_state_`i'="scotland" if investor_state_`i'=="sotland"
replace investor_state_`i'="switzerland" if investor_state_`i'=="switzerl"
replace investor_state_`i'="west virginia" if investor_state_`i'=="w virginia"
replace investor_state_`i'="zurich" if investor_state_`i'=="zur ich"
replace investor_state_`i'="w is" if investor_state_`i'=="wisconsin"
replace investor_state_`i'="gerny" if investor_state_`i'=="germany"
}

*generating dummy for every sub location
cap drop investor_state_temp2
gen investor_state_temp2=investor_state_1
replace investor_state_temp2=investor_state_temp2+"/"+investor_state_2 if investor_state_2!=""
replace investor_state_temp2=investor_state_temp2+"/"+investor_state_3 if investor_state_3!=""
replace investor_state_temp2=regexr(investor_state_temp2,"n[/]y$","new york")
replace investor_state_temp2=regexr(investor_state_temp2,"[/]n$","/new york")
replace investor_state_temp2=regexr(investor_state_temp2,"[/]u(s)?$","")
replace investor_state_temp2=regexr(investor_state_temp2,"[/]u (s)?$","")

replace investor_state_temp2="germany" if investor_state_temp2=="gerny"
replace investor_state_temp2="new york" if investor_state_temp2=="n yi"
replace investor_state_temp2="new jersey" if investor_state_temp2=="n/j"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="muss"
replace investor_state_temp2="canada" if investor_state_temp2=="br/canada"
replace investor_state_temp2="scotland/connecticut" if investor_state_temp2=="scot connecticut"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="majss"
replace investor_state_temp2="sweden/new york" if investor_state_temp2=="swollen/new york"
replace investor_state_temp2="ontario/canada" if investor_state_temp2=="ont canada"
replace investor_state_temp2="connecticut" if investor_state_temp2=="coon"
replace investor_state_temp2="englang/new york" if investor_state_temp2=="england new york"
replace investor_state_temp2="england/canada" if investor_state_temp2=="england canada"
replace investor_state_temp2="england/massachusetts" if investor_state_temp2=="engmass"
replace investor_state_temp2="england/massachusetts" if investor_state_temp2=="england massachusetts"
replace investor_state_temp2="newburyport/massachusetts" if investor_state_temp2=="newburyport massachusetts"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="masb"
replace investor_state_temp2="hingham" if investor_state_temp2=="hingliam"
replace investor_state_temp2="germany/new york" if investor_state_temp2=="gerny/new york"
replace investor_state_temp2="holland/new york" if investor_state_temp2=="hol/new york"
replace investor_state_temp2="new hampshire" if investor_state_temp2=="n/h"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="mas"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="msas"
replace investor_state_temp2="scotland/new york" if investor_state_temp2=="scotland new york"
replace investor_state_temp2="germany/germany" if investor_state_temp2=="gerny/gerny"
replace investor_state_temp2="england/new york" if investor_state_temp2=="englang/new york"
replace investor_state_temp2="germany/connecticut" if investor_state_temp2=="gerny/connecticut"
replace investor_state_temp2="germany/connecticut" if investor_state_temp2=="gee/connecticut"
replace investor_state_temp2="russia/new york" if investor_state_temp2=="rus/new york"
replace investor_state_temp2="germany/illinois" if investor_state_temp2=="gerny/illinois"
replace investor_state_temp2="germany/hawaii" if investor_state_temp2=="gerny/hawaii"
replace investor_state_temp2="germany/chicago" if investor_state_temp2=="gerny/chicago"
replace investor_state_temp2="england/montreal" if investor_state_temp2=="england montral"
replace investor_state_temp2="wisconsin" if investor_state_temp2=="w is"

*deal with 3 sub-locations"
replace investor_state_temp2="scotland/montreal" if investor_state_temp2=="scotland/montreal/and"
replace investor_state_temp2=regexr(investor_state_temp2,"^[/]","")

cap drop investor_state_1 investor_state_2 investor_state_3
split investor_state_temp2, parse("/") gen(investor_state_)
forv i=1/3{
cap drop temp_d`i'
gen temp_d`i'=0
replace temp_d`i'=1 if investor_state_`i'=="alabama"
replace temp_d`i'=1 if investor_state_`i'=="albany"
replace temp_d`i'=1 if investor_state_`i'=="arizona"
replace temp_d`i'=1 if investor_state_`i'=="arkansas"
replace temp_d`i'=2 if investor_state_`i'=="auckland"
replace temp_d`i'=3 if investor_state_`i'=="australia"
replace temp_d`i'=3 if investor_state_`i'=="austria"
replace temp_d`i'=2 if investor_state_`i'=="baltimore"
replace temp_d`i'=23 if investor_state_`i'=="bavaria"
replace temp_d`i'=2 if investor_state_`i'=="boston"
replace temp_d`i'=4 if investor_state_`i'=="boston massachusetts"
replace temp_d`i'=2 if investor_state_`i'=="brooklyn"
replace temp_d`i'=2 if investor_state_`i'=="buffalo"
replace temp_d`i'=3 if investor_state_`i'=="bulgaria"
replace temp_d`i'=4 if investor_state_`i'=="bulgariaconn"
replace temp_d`i'=1 if investor_state_`i'=="cal"
replace temp_d`i'=1 if investor_state_`i'=="california"
replace temp_d`i'=14 if investor_state_`i'=="california shares"
replace temp_d`i'=3 if investor_state_`i'=="canada"
replace temp_d`i'=4 if investor_state_`i'=="canada illinois"
replace temp_d`i'=24 if investor_state_`i'=="canada school dist"
replace temp_d`i'=3 if investor_state_`i'=="canadan"
replace temp_d`i'=3 if investor_state_`i'=="canadian"
replace temp_d`i'=1 if investor_state_`i'=="ccnn"
replace temp_d`i'=2 if investor_state_`i'=="chester"
replace temp_d`i'=2 if investor_state_`i'=="chicago"
replace temp_d`i'=4 if investor_state_`i'=="chicago illinois"
replace temp_d`i'=3 if investor_state_`i'=="china"
replace temp_d`i'=1 if investor_state_`i'=="colorado"
replace temp_d`i'=2 if investor_state_`i'=="concord"
replace temp_d`i'=1 if investor_state_`i'=="connecticut"
replace temp_d`i'=2 if investor_state_`i'=="danbury"
replace temp_d`i'=1 if investor_state_`i'=="debentures"
replace temp_d`i'=1 if investor_state_`i'=="delaware"
replace temp_d`i'=1 if investor_state_`i'=="dist. of columbia"
replace temp_d`i'=23 if investor_state_`i'=="edinbnrgh"
replace temp_d`i'=23 if investor_state_`i'=="edinburgh"
replace temp_d`i'=2 if investor_state_`i'=="elmira"
replace temp_d`i'=34 if investor_state_`i'=="engcan"
replace temp_d`i'=34 if investor_state_`i'=="engcanada"
replace temp_d`i'=3 if investor_state_`i'=="england"
replace temp_d`i'=34 if investor_state_`i'=="england canada"
replace temp_d`i'=34 if investor_state_`i'=="england land"
replace temp_d`i'=34 if investor_state_`i'=="england massachusetts"
replace temp_d`i'=34 if investor_state_`i'=="england new york"
replace temp_d`i'=34 if investor_state_`i'=="england ontcan"
replace temp_d`i'=3 if investor_state_`i'=="england u s"
replace temp_d`i'=34 if investor_state_`i'=="englandn y"
replace temp_d`i'=34 if investor_state_`i'=="engmontreal"
replace temp_d`i'=34 if investor_state_`i'=="engn y"
replace temp_d`i'=34 if investor_state_`i'=="engny"
replace temp_d`i'=34 if investor_state_`i'=="exeter new hampshire"
replace temp_d`i'=2 if investor_state_`i'=="fall river"
replace temp_d`i'=1 if investor_state_`i'=="florida"
replace temp_d`i'=3 if investor_state_`i'=="france"
replace temp_d`i'=1 if investor_state_`i'=="georgia"
replace temp_d`i'=3 if investor_state_`i'=="germ"
replace temp_d`i'=3 if investor_state_`i'=="germa"
replace temp_d`i'=3 if investor_state_`i'=="german y"
replace temp_d`i'=3 if investor_state_`i'=="german y u s"
replace temp_d`i'=3 if investor_state_`i'=="germany"
replace temp_d`i'=3 if investor_state_`i'=="germany many"
replace temp_d`i'=3 if investor_state_`i'=="germany u s"
replace temp_d`i'=3 if investor_state_`i'=="germanyn"
replace temp_d`i'=23 if investor_state_`i'=="gothenburg"
replace temp_d`i'=3 if investor_state_`i'=="great britain"
replace temp_d`i'=3 if investor_state_`i'=="great itain"
replace temp_d`i'=3 if investor_state_`i'=="greatbrit"
replace temp_d`i'=3 if investor_state_`i'=="greatbritain"
replace temp_d`i'=3 if investor_state_`i'=="gt britain"
replace temp_d`i'=3 if investor_state_`i'=="gt itain"
replace temp_d`i'=2 if investor_state_`i'=="hartford"
replace temp_d`i'=1 if investor_state_`i'=="hawah"
replace temp_d`i'=1 if investor_state_`i'=="hawaii"
replace temp_d`i'=3 if investor_state_`i'=="holand"
replace temp_d`i'=3 if investor_state_`i'=="holland"
replace temp_d`i'=1 if investor_state_`i'=="i north dakota"
replace temp_d`i'=1 if investor_state_`i'=="illinois"
replace temp_d`i'=1 if investor_state_`i'=="indiana"
replace temp_d`i'=3 if investor_state_`i'=="indianapolis"
replace temp_d`i'=1 if investor_state_`i'=="iowa"
replace temp_d`i'=3 if investor_state_`i'=="japan"
replace temp_d`i'=2 if investor_state_`i'=="jersey cit"
replace temp_d`i'=1 if investor_state_`i'=="kansas"
replace temp_d`i'=2 if investor_state_`i'=="keene"
replace temp_d`i'=1 if investor_state_`i'=="kentucky"
replace temp_d`i'=2 if investor_state_`i'=="knoxville"
replace temp_d`i'=23 if investor_state_`i'=="liverpool"
replace temp_d`i'=23 if investor_state_`i'=="london"
replace temp_d`i'=1 if investor_state_`i'=="louisiana"
replace temp_d`i'=2 if investor_state_`i'=="lynchburg"
replace temp_d`i'=1 if investor_state_`i'=="maas"
replace temp_d`i'=2 if investor_state_`i'=="maccabees"
replace temp_d`i'=1 if investor_state_`i'=="maine"
replace temp_d`i'=4 if investor_state_`i'=="maine common"
replace temp_d`i'=4 if investor_state_`i'=="maine preferred"
replace temp_d`i'=4 if investor_state_`i'=="maine rapid transit"
replace temp_d`i'=34 if investor_state_`i'=="man canada"
replace temp_d`i'=1 if investor_state_`i'=="maryland"
replace temp_d`i'=1 if investor_state_`i'=="massachusetts"
replace temp_d`i'=1 if investor_state_`i'=="massl"
replace temp_d`i'=1 if investor_state_`i'=="masss"
replace temp_d`i'=1 if investor_state_`i'=="michigan"
replace temp_d`i'=14 if investor_state_`i'=="michigan sewer"
replace temp_d`i'=1 if investor_state_`i'=="michn"
replace temp_d`i'=1 if investor_state_`i'=="minnesota"
replace temp_d`i'=1 if investor_state_`i'=="mississippi"
replace temp_d`i'=1 if investor_state_`i'=="missouri"
replace temp_d`i'=1 if investor_state_`i'=="mnss"
replace temp_d`i'=2 if investor_state_`i'=="montana"
replace temp_d`i'=23 if investor_state_`i'=="montreal"
replace temp_d`i'=1 if investor_state_`i'=="n vermont"
replace temp_d`i'=1 if investor_state_`i'=="nebraska"
replace temp_d`i'=1 if investor_state_`i'=="nevada"
replace temp_d`i'=1 if investor_state_`i'=="new hamphire"
replace temp_d`i'=1 if investor_state_`i'=="new hampshire"
replace temp_d`i'=1 if investor_state_`i'=="new jersey"
replace temp_d`i'=1 if investor_state_`i'=="new york"
replace temp_d`i'=1 if investor_state_`i'=="new york c"
replace temp_d`i'=2 if investor_state_`i'=="new york city"
replace temp_d`i'=4 if investor_state_`i'=="new york england"
replace temp_d`i'=3 if investor_state_`i'=="new zealand"
replace temp_d`i'=2 if investor_state_`i'=="newburyport"
replace temp_d`i'=4 if investor_state_`i'=="newburyport massachusetts"
replace temp_d`i'=1 if investor_state_`i'=="newyork"
replace temp_d`i'=3 if investor_state_`i'=="newzealand"
replace temp_d`i'=1 if investor_state_`i'=="nor th carolina"
replace temp_d`i'=1 if investor_state_`i'=="nor th dakota"
replace temp_d`i'=1 if investor_state_`i'=="north carolina"
replace temp_d`i'=1 if investor_state_`i'=="north dakota"
replace temp_d`i'=4 if investor_state_`i'=="obispo california"
replace temp_d`i'=1 if investor_state_`i'=="ohio"
replace temp_d`i'=1 if investor_state_`i'=="oklahoma"
replace temp_d`i'=2 if investor_state_`i'=="omaha"
replace temp_d`i'=23 if investor_state_`i'=="ont"
replace temp_d`i'=34 if investor_state_`i'=="ont canada"
replace temp_d`i'=23 if investor_state_`i'=="onta"
replace temp_d`i'=23 if investor_state_`i'=="ontan"
replace temp_d`i'=23 if investor_state_`i'=="ontario"
replace temp_d`i'=34 if investor_state_`i'=="ontcan"
replace temp_d`i'=1 if investor_state_`i'=="oregon"
replace temp_d`i'=34 if investor_state_`i'=="out canada"
replace temp_d`i'=34 if investor_state_`i'=="outcan"
replace temp_d`i'=1 if investor_state_`i'=="pennsylvania"
replace temp_d`i'=2 if investor_state_`i'=="phia"
replace temp_d`i'=2 if investor_state_`i'=="phila"
replace temp_d`i'=2 if investor_state_`i'=="philadelphia"
replace temp_d`i'=4 if investor_state_`i'=="provincetown massachusetts"
replace temp_d`i'=2 if investor_state_`i'=="pt huron"
replace temp_d`i'=4 if investor_state_`i'=="pt huron michigan"
replace temp_d`i'=23 if investor_state_`i'=="quebec"
replace temp_d`i'=1 if investor_state_`i'=="r l"
replace temp_d`i'=1 if investor_state_`i'=="rhode island"
replace temp_d`i'=3 if investor_state_`i'=="russia"
replace temp_d`i'=3 if investor_state_`i'=="russia u s"
replace temp_d`i'=3 if investor_state_`i'=="russua"
replace temp_d`i'=2 if investor_state_`i'=="saco"
replace temp_d`i'=23 if investor_state_`i'=="saxony"
replace temp_d`i'=3 if investor_state_`i'=="scot"
replace temp_d`i'=34 if investor_state_`i'=="scot canada"
replace temp_d`i'=34 if investor_state_`i'=="scot connecticut"
replace temp_d`i'=34 if investor_state_`i'=="scot head off indiana canada"
replace temp_d`i'=34 if investor_state_`i'=="scot head office indiana canada"
replace temp_d`i'=34 if investor_state_`i'=="scot head office indiana canada montreal"
replace temp_d`i'=3 if investor_state_`i'=="scot land"
replace temp_d`i'=3 if investor_state_`i'=="scotl"
replace temp_d`i'=3 if investor_state_`i'=="scotlan"
replace temp_d`i'=3 if investor_state_`i'=="scotland"
replace temp_d`i'=34 if investor_state_`i'=="scotland canada"
replace temp_d`i'=34 if investor_state_`i'=="scotland head office"
replace temp_d`i'=34 if investor_state_`i'=="scotland head office indiana canada"
replace temp_d`i'=34 if investor_state_`i'=="scotlandcanada"
replace temp_d`i'=34 if investor_state_`i'=="scotlandmontreal"
replace temp_d`i'=34 if investor_state_`i'=="scotlandny"
replace temp_d`i'=34 if investor_state_`i'=="scotn y"
replace temp_d`i'=3 if investor_state_`i'=="sotland"
replace temp_d`i'=1 if investor_state_`i'=="south carolina"
replace temp_d`i'=1 if investor_state_`i'=="south dakota"
replace temp_d`i'=3 if investor_state_`i'=="spain"
replace temp_d`i'=2 if investor_state_`i'=="springfield"
replace temp_d`i'=23 if investor_state_`i'=="suffolk"
replace temp_d`i'=3 if investor_state_`i'=="sweden"
replace temp_d`i'=3 if investor_state_`i'=="switzerl"
replace temp_d`i'=3 if investor_state_`i'=="switzerland"
replace temp_d`i'=2 if investor_state_`i'=="syracuse"
replace temp_d`i'=1 if investor_state_`i'=="tennessee"
replace temp_d`i'=1 if investor_state_`i'=="texas"
replace temp_d`i'=23 if investor_state_`i'=="toronto"
replace temp_d`i'=1 if investor_state_`i'=="utah"
replace temp_d`i'=1 if investor_state_`i'=="vermont"
replace temp_d`i'=1 if investor_state_`i'=="virginia"
replace temp_d`i'=1 if investor_state_`i'=="w virginia"
replace temp_d`i'=1 if investor_state_`i'=="washington"
replace temp_d`i'=2 if investor_state_`i'=="waterbury"
replace temp_d`i'=23 if investor_state_`i'=="waterloo"
replace temp_d`i'=1 if investor_state_`i'=="west virginia"
replace temp_d`i'=2 if investor_state_`i'=="wilmington"
replace temp_d`i'=1 if investor_state_`i'=="wisconsin"
replace temp_d`i'=1 if investor_state_`i'=="wisconsin"
replace temp_d`i'=2 if investor_state_`i'=="woonsocket"
replace temp_d`i'=23 if investor_state_`i'=="zur ich"
replace temp_d`i'=2 if investor_state_`i'=="hingham"
replace temp_d`i'=2 if investor_state_`i'=="bridgton"
replace temp_d`i'=23 if investor_state_`i'=="zurich"
replace temp_d`i'=2 if investor_state_`i'=="providence"

}

*saveold Holdings_Investor_temp.dta, replace
*/
*Pre-Clean 2

*use Holdings_Investor_temp.dta, clear

*Detailed-clean of State
replace investor_state_temp2="pennsylvania" if investor_city_temp=="" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="amesdury" &  investor_state_temp=="mara" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maryland" if investor_city_temp=="baltimore" &  investor_state_temp=="mil" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maryland" if investor_city_temp=="baltimore" &  investor_state_temp=="aid" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maryland" if investor_city_temp=="baltimore" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maryland" if investor_city_temp=="baltimore" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maine" if investor_city_temp=="bangor" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="california" if investor_city_temp=="bank" &  investor_state_temp=="napa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maine" if investor_city_temp=="belfast" &  investor_state_temp=="main" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="bftigfcamton" &  investor_state_temp=="y" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="binghamton" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="brooklyn" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="brooklyn" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="buffalo" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="buffalo" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="canton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cantoni" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="carbondale" &  investor_state_temp=="pji" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="carlisle" &  investor_state_temp=="pal" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="centreville" &  investor_state_temp=="rj" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="charlestown" &  investor_state_temp=="w" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="charlestown" &  investor_state_temp=="wya" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="chester" &  investor_state_temp=="p" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="chester" &  investor_state_temp=="ppa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="illinois" if investor_city_temp=="chicago" &  investor_state_temp=="i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="illinois" if investor_city_temp=="chicago" &  investor_state_temp=="iu" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="illinois" if investor_city_temp=="chisago" &  investor_state_temp=="iu" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinatti" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cincinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cinncinnati" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cleveland" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="cleveland" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="concord" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="concord" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="concord" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="conton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="connecticut" if investor_city_temp=="court" &  investor_state_temp=="cour" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="indiana" if investor_city_temp=="crawfordsville" &  investor_state_temp=="lnd" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="dayton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="dayton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="dayton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="dayton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="dayton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="dayton" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="michigan" if investor_city_temp=="detroit" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="dover" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="dover" &  investor_state_temp=="j" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maine" if investor_city_temp=="dover" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="doylestown" &  investor_state_temp=="pn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="doylestown" &  investor_state_temp=="pn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="east orange" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="east orange" &  investor_state_temp=="j" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="eastharapton" &  investor_state_temp=="maes" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="scotland/canada" if investor_city_temp=="edinburgh/can" &  investor_state_temp=="sec/montreal" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="scotland/connecticut" if investor_city_temp=="edinburgh scot" &  investor_state_temp=="hart/connecticut" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="exeter" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="exeter" &  investor_state_temp=="hh" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="fall river" &  investor_state_temp=="mafis" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="scotland/pennsylvania" if investor_city_temp=="fire & life assurance corporation" &  investor_state_temp=="ltd" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="fishkill" &  investor_state_temp=="x y" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york/germany" if investor_city_temp=="frankfort/new york" &  investor_state_temp=="new york/gerny" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="illinois" if investor_city_temp=="freeport" &  investor_state_temp=="l i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="gardner" &  investor_state_temp=="maes" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="gorham" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="greenville" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="halifax" &  investor_state_temp=="n s" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="halifax" &  investor_state_temp=="n s" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="halifax" &  investor_state_temp=="ns" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="indiana" if investor_city_temp=="hammond" &  investor_state_temp=="lnd" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="harrlsburg" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="connecticut" if investor_city_temp=="hartford" &  investor_state_temp=="c" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="connecticut" if investor_city_temp=="hartford" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="connecticut" if investor_city_temp=="hartford" &  investor_state_temp=="com" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="hazleton" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="hillsborough" &  investor_state_temp=="bridge" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="honesdale" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="httsfcurga" &  investor_state_temp=="a" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="indiana" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="ithaca" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="jamaica" &  investor_state_temp=="l i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="jamaica" &  investor_state_temp=="li" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="jenkintown" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="jersey city" &  investor_state_temp=="c" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="jersey city" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="kingston" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="kittanning" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="laconia" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="lakewood" &  investor_state_temp=="n t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="lancaster" &  investor_state_temp=="im" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="lebanon" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="leroy" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="perth/philadelphia" if investor_city_temp=="limited" &  investor_state_temp=="perth/philadelphia" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="lnkewood" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="lock haven" &  investor_state_temp=="pav" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="california" if investor_city_temp=="lodi" &  investor_state_temp=="cnl" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="england/montreal" if investor_city_temp=="london/canada" &  investor_state_temp=="england/monstreal" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="england/new york" if investor_city_temp=="london/n y" &  investor_state_temp=="england/city" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="england/canada" if investor_city_temp=="london/ montreal" &  investor_state_temp=="england/que" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="england/canada" if investor_city_temp=="london/montreal" &  investor_state_temp=="england/que" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="long island city" &  investor_state_temp=="li" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="kentucky" if investor_city_temp=="louisville" &  investor_state_temp=="kv" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="england/new york" if investor_city_temp=="ltd" &  investor_state_temp=="lond" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="indiana" if investor_city_temp=="madison" &  investor_state_temp=="lnd" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="mahoning" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="manchester" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="manchester" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="mansfield" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="middletown" &  investor_state_temp=="n t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="mifflinburg" &  investor_state_temp=="pt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="mineola" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="" if investor_city_temp=="misc" &  investor_state_temp=="section" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="montclair" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="montreal" &  investor_state_temp=="cn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="moorestown" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="mount holly" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="mount vernon" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="mt vernon" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="germany/ct" if investor_city_temp=="munich" &  investor_state_temp=="gcr" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="california" if investor_city_temp=="napa" &  investor_state_temp=="sal" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="nashua" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="nashua" &  investor_state_temp=="nn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="nashua" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="city" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="kng/new york" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="np" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="maes" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="np" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="x y" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="m" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="e/massachusetts" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york city" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york n" &  investor_state_temp=="y" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="new york n" &  investor_state_temp=="y" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="newark" &  investor_state_temp=="n i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="newark" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="newark" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="newark" &  investor_state_temp=="pt j" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="newark" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="newark" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="newark" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="newburgh" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="newburyport" &  investor_state_temp=="man" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="newport" &  investor_state_temp=="r ik" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="newport" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="newport" &  investor_state_temp=="it i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="newport" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="virginia" if investor_city_temp=="norfolk" &  investor_state_temp=="ya" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="england/massachusetts" if investor_city_temp=="norwich/new york" &  investor_state_temp=="england/maa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="nyack" &  investor_state_temp=="x y" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="o" &  investor_state_temp=="j" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="illinois" if investor_city_temp=="oak park" &  investor_state_temp=="iu" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="delaware" if investor_city_temp=="odessa" &  investor_state_temp=="pel" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="passaic" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="passaic" &  investor_state_temp=="n i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="passaic" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="paterson" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="paterson" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="patterson" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="pawtucket" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="pawtucket" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="pawtucket" &  investor_state_temp=="k i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="pawtucket" &  investor_state_temp=="b i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="pbtlndoirm" &  investor_state_temp=="po" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="scotland/pennsylvania" if investor_city_temp=="perth/philadelphia" &  investor_state_temp=="stockland/pennsylvania" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="scotland/pennsylvania" if investor_city_temp=="perth" &  investor_state_temp=="perth" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="perth amboy" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="peterborough  n" &  investor_state_temp=="h" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelpha" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="gh" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="p" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="pn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="p" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="p" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="philadelphia" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="pittsburg" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="pittsburg" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="pittsburg" &  investor_state_temp=="p" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="pittsfield" &  investor_state_temp=="mat" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="pittsfield" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="pittston" &  investor_state_temp=="x j" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="plainfield" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="plainneld" &  investor_state_temp=="ni" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maine" if investor_city_temp=="portland" &  investor_state_temp=="ale" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="poughkeepsie" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="k" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r/i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r iv" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r y" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="rj" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="k" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="it i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="r t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence" &  investor_state_temp=="rt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence r" &  investor_state_temp=="i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="providence r" &  investor_state_temp=="i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="" if investor_city_temp=="pwad�iphio" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="reading" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="rochester" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="rochester" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="rochester" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="rochester" &  investor_state_temp=="n i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="rochester" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="rochester" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="illinois" if investor_city_temp=="rock island" &  investor_state_temp=="til" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="rome" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maine" if investor_city_temp=="saco" &  investor_state_temp=="mr" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="salem" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new hampshire" if investor_city_temp=="salmon falls" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="sandusky" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="scranton" &  investor_state_temp=="ta" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="scranton" &  investor_state_temp=="pn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="" if investor_city_temp=="see industrial and miscellaneous section" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="shelbourne falls" &  investor_state_temp=="maes" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="shenandoah" &  investor_state_temp=="po" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="california" if investor_city_temp=="sonora" &  investor_state_temp=="cat" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="connecticut" if investor_city_temp=="south norwalk" &  investor_state_temp=="fonn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="spencer" &  investor_state_temp=="mara" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="st clair" &  investor_state_temp=="pn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="stapleton" &  investor_state_temp=="si" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="sweden/new york" if investor_city_temp=="stockholm/new york" &  investor_state_temp=="swe/new york" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="sunbury" &  investor_state_temp=="p" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="syracuse" &  investor_state_temp=="n t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="syracuse" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="syracuse" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="toledo" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="ohio" if investor_city_temp=="toledo" &  investor_state_temp=="o" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="toronto" &  investor_state_temp=="out" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="toronto" &  investor_state_temp=="cam" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada/new york" if investor_city_temp=="toronto/ n y" &  investor_state_temp=="canada/city" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="toronto" &  investor_state_temp=="fan" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="trenton" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new jersey" if investor_city_temp=="trenton" &  investor_state_temp=="n t" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="utica" &  investor_state_temp=="n" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="canada" if investor_city_temp=="vancouver" &  investor_state_temp=="b c" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="wakefield" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="wakefield" &  investor_state_temp=="n i" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="maine" if investor_city_temp=="waterville" &  investor_state_temp=="m/e" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="west chester" &  investor_state_temp=="pn" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="west chester" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="west new brighton" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="westerly" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="westerly" &  investor_state_temp=="it" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="west virginia" if investor_city_temp=="wheeling" &  investor_state_temp=="w" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="west virginia" if investor_city_temp=="wheeling" &  investor_state_temp=="w/virginia" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="white haven" &  investor_state_temp=="pav" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="wilkesbarre" &  investor_state_temp=="p" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="wilkesbarre" &  investor_state_temp=="j" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="wilkesbarre" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="delaware" if investor_city_temp=="wilmington" &  investor_state_temp=="dei" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="man" if investor_city_temp=="winnipeg" &  investor_state_temp=="man" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="man" if investor_city_temp=="winnipeg" &  investor_state_temp=="man" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="womelsdorf" &  investor_state_temp=="n s" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="woonsocket" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="woonsocket" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="rhode island" if investor_city_temp=="woonsocket" &  investor_state_temp=="r" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="worcester" &  investor_state_temp=="man" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="worcester" &  investor_state_temp=="mam" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="massachusetts" if investor_city_temp=="worcester" &  investor_state_temp=="mara" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="new york" if investor_city_temp=="yonkers" &  investor_state_temp=="nt" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="pennsylvania" if investor_city_temp=="york" &  investor_state_temp=="fa" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="" if investor_city_temp=="" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="" if investor_city_temp=="" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_state_temp2="" if investor_city_temp=="" &  investor_state_temp=="" & (temp_d1==0|(temp_d2==0&investor_state_2!=""))
replace investor_city_temp="chester" if invname_hold_orig=="Delaware County Trust Safe Deposit & Title Insurance Company." & investor_city_temp=="" &  investor_state_temp2=="" 
replace investor_city_temp="allentown" if invname_hold_orig=="Lehigh Valley Trust & Safe Deposit Company" & investor_city_temp=="allen town" &  investor_state_temp2=="fa" 
replace investor_city_temp="binghamton" if invname_hold_orig=="Security Muruai NiLfeai^ujcao.ce~Cot!(pacy" & investor_city_temp=="bftigfcamton" &  investor_state_temp2=="y" 
replace investor_city_temp="chicago" if invname_hold_orig=="Lake View Trust & Savings Bank" & investor_city_temp=="chisago" &  investor_state_temp2=="iu" 
replace investor_city_temp="cincinnati" if invname_hold_orig=="National insurance Company" & investor_city_temp=="cincinatti" &  investor_state_temp2=="o" 
replace investor_city_temp="cincinnati" if invname_hold_orig=="German Mutual Insurance Company" & investor_city_temp=="cinncinnati" &  investor_state_temp2=="o" 
replace investor_city_temp="canton" if invname_hold_orig=="Ohio Millers' Mutual Fire Insurance Company" & investor_city_temp=="conton" &  investor_state_temp2=="o" 
replace investor_city_temp="edinburgh/montreal" if invname_hold_orig=="Standard Life Assur Co" & investor_city_temp=="edinburgh/can" &  investor_state_temp2=="sec/montreal" 
replace investor_city_temp="edinburgh/hartford" if invname_hold_orig=="Scottish Union & National Ins. Co." & investor_city_temp=="edinburgh scot" &  investor_state_temp2=="hart/connecticut" 
replace investor_city_temp="perth/philadelphia" if invname_hold_orig=="General Accident" & investor_city_temp=="fire & life assurance corporation" &  investor_state_temp2=="ltd" 
replace investor_city_temp="harrisburg" if invname_hold_orig=="Dauphin Deposit Trust Company" & investor_city_temp=="harrlsburg" &  investor_state_temp2=="fa" 
replace investor_city_temp="pittsburg" if invname_hold_orig=="Seal Estate TnNst Company" & investor_city_temp=="httsfcurga" &  investor_state_temp2=="a" 
replace investor_city_temp="indiana" if invname_hold_orig=="Savings & Trust Company of Indiana" & investor_city_temp=="indiana" &  investor_state_temp2=="fa" 
replace investor_city_temp="london/new york" if invname_hold_orig=="Commercial Union Assur,Co," & investor_city_temp=="london/n y" &  investor_state_temp2=="england/city" 
replace investor_city_temp="london/montreal" if invname_hold_orig=="London & Lancashire Life Ins. Co." & investor_city_temp=="london/ montreal" &  investor_state_temp2=="england/que" 
replace investor_city_temp="london/montreal" if invname_hold_orig=="London & Lancashire Life & General Assurance Assn., Ltd." & investor_city_temp=="london/montreal" &  investor_state_temp2=="england/que" 
replace investor_city_temp="london/new york" if invname_hold_orig=="Palatine Insurance Company" & investor_city_temp=="ltd" &  investor_state_temp2=="lond" 
replace investor_city_temp="brooklyn" if invname_hold_orig=="Na�saa County Trust Company" & investor_city_temp=="mineola" &  investor_state_temp2=="nt" 
replace investor_city_temp="munich/hartford" if invname_hold_orig=="Munich Re-insurance Co." & investor_city_temp=="munich" &  investor_state_temp2=="gcr" 
replace investor_city_temp="norwich/boston" if invname_hold_orig=="Norwich & London Accident Insurance Association" & investor_city_temp=="norwich/new york" &  investor_state_temp2=="england/maa" 
replace investor_city_temp="wilkes-barre" if invname_hold_orig=="PeopIe&^Eank />�-" & investor_city_temp=="o" &  investor_state_temp2=="j" 
replace investor_city_temp="odessa" if invname_hold_orig=="Cantwell Mutual Insurance Company" & investor_city_temp=="odessa" &  investor_state_temp2=="pel" 
replace investor_city_temp="philadelphia" if invname_hold_orig=="Industrial Trust. Title & Savings Company" & investor_city_temp=="pbtlndoirm" &  investor_state_temp2=="po" 
replace investor_city_temp="perth/philadelphia" if invname_hold_orig=="General Accident. Fire & Life Assurance Corp.. Ltd" & investor_city_temp=="perth/philadelphia" &  investor_state_temp2=="stockland/pennsylvania" 
replace investor_city_temp="perth/philadelphia" if invname_hold_orig=="General Accident Fire & Life Insurance Corp. Ltd." & investor_city_temp=="perth" &  investor_state_temp2=="perth" 
replace investor_city_temp="peterborough " if invname_hold_orig=="Peterborough Savings Bank" & investor_city_temp=="peterborough  n" &  investor_state_temp2=="h" 
replace investor_city_temp="philadelphia" if invname_hold_orig=="Manayunk Trust Company" & investor_city_temp=="philadelpha" &  investor_state_temp2=="fa" 
replace investor_city_temp="providence" if invname_hold_orig=="Firemen's Mutual Insurance Company" & investor_city_temp=="providence r" &  investor_state_temp2=="i" 
replace investor_city_temp="providence" if invname_hold_orig=="People's Savings Bank" & investor_city_temp=="providence r" &  investor_state_temp2=="i" 
replace investor_city_temp="stockholm/new york" if invname_hold_orig=="Skandia Ins. Co." & investor_city_temp=="stockholm/new york" &  investor_state_temp2=="swe/new york" 
replace investor_city_temp="toronto/new york" if invname_hold_orig=="British America Assurance Co" & investor_city_temp=="toronto/ n y" &  investor_state_temp2=="canada/city" 
replace investor_state_temp2=subinstr(investor_state_temp2,"stockland","scotland",.)
replace investor_state_temp2=subinstr(investor_state_temp2,"r/i","rhode island",.)
replace investor_state_temp2=subinstr(investor_state_temp2,"swe/","sweden/",.)
replace investor_state_temp2=subinword(investor_state_temp2,"va","virginia",.)
replace investor_state_temp2=subinword(investor_state_temp2,"wa","sweden/",.)
replace investor_state_temp2=subinword(investor_state_temp2,"wv","west virginia",.)
replace investor_state_temp2=subinword(investor_state_temp2,"w/virginia","west virginia",.)
replace investor_state_temp2=subinword(investor_state_temp2,"kng/new york","england/new york",.)
replace investor_state_temp2=subinword(investor_state_temp2,"angland land/new york","england/new york",.)
replace investor_state_temp2=subinword(investor_state_temp2,"hart/connecticut","hartford/connecticut",.)
replace investor_state_temp2="pennsylvania" if investor_state_temp2=="pa"
replace investor_state_temp2="pennsylvania" if investor_state_temp2=="fa"
replace investor_state_temp2="england/massachusetts" if investor_state_temp2=="e/massachusetts"
replace investor_state_temp2="england/new york" if investor_state_temp2=="england land/new york"
replace investor_state_temp2="england/new york" if investor_state_temp2=="new york england/new york"
replace investor_state_temp2="ohio" if investor_state_temp2=="o" & industry~="Government"
replace investor_state_temp2="connecticut" if investor_state_temp2=="c" & industry~="Government"
replace investor_state_temp2="new hampshire" if investor_state_temp2=="n" & industry~="Government"
replace investor_state_temp2=regexr(investor_state_temp2,"[/]city$","/new york city")
replace investor_state_temp2=regexr(investor_state_temp2,"[/]ct$","/connecticut")
replace investor_state_temp2=regexr(investor_state_temp2,"[/]gerny$","/germany")
replace investor_state_temp2=regexr(investor_state_temp2,"[/]que$","/quebec")
replace investor_state_temp2="canada" if investor_state_temp2=="man" & industry~="Government"
replace stock_type_hold=stock_type_hold+" common" if regexm(investor_state_temp2," common$")
replace investor_state_temp2=regexr(investor_state_temp2," common$","")
replace stock_type_hold=stock_type_hold+" preferred" if regexm(investor_state_temp2," preferred$")
replace investor_state_temp2=regexr(investor_state_temp2," preferred$","")
replace investor_state_temp2=subinstr(investor_state_temp2,"ontario","canada",.)
replace investor_state_temp2="canada" if investor_state_temp2=="man" & industry~="Government"
replace investor_city_temp="syracuse" if investor_state_temp2=="syracuse"
replace investor_city_temp="waterbury" if investor_state_temp2=="waterbury"
replace investor_city_temp="concord" if investor_state_temp2=="concord"
replace investor_city_temp="philadelphia" if investor_state_temp2=="philadelphia"
replace investor_city_temp="chester" if investor_state_temp2=="chester"
replace investor_city_temp="newburyport" if investor_state_temp2=="newburyport"
replace investor_city_temp="fall river" if investor_state_temp2=="fall river"
replace investor_city_temp="saco" if investor_state_temp2=="saco"
replace investor_city_temp="springfield" if investor_state_temp2=="springfield"
replace investor_city_temp="buffalo" if investor_state_temp2=="buffalo"
replace investor_city_temp="brooklyn" if investor_state_temp2=="brooklyn"
replace investor_city_temp="elmira" if investor_state_temp2=="elmira"
replace investor_city_temp="providence" if investor_state_temp2=="providence"
replace investor_city_temp="suffolk" if investor_state_temp2=="suffolk"
replace investor_city_temp="bridgton" if investor_state_temp2=="bridgton"
replace investor_city_temp="hingham" if investor_state_temp2=="hingham"
replace investor_city_temp="danbury" if investor_state_temp2=="danbury"
replace investor_city_temp="wilmington" if investor_state_temp2=="wilmington"
replace investor_city_temp="hartford" if investor_state_temp2=="hartford"
replace investor_city_temp="keene" if investor_state_temp2=="keene"
replace investor_state_temp2="new york" if investor_state_temp2=="syracuse"
replace investor_state_temp2="connecticut" if investor_state_temp2=="waterbury"
replace investor_state_temp2="new hempshire" if investor_state_temp2=="concord"
replace investor_state_temp2="pennsylvania" if investor_state_temp2=="philadelphia"
replace investor_state_temp2="pennsylvania" if investor_state_temp2=="chester"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="newburyport"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="fall river"
replace investor_state_temp2="maine" if investor_state_temp2=="saco"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="springfield"
replace investor_state_temp2="new york" if investor_state_temp2=="buffalo"
replace investor_state_temp2="new york" if investor_state_temp2=="brooklyn"
replace investor_state_temp2="new york" if investor_state_temp2=="elmira"
replace investor_state_temp2="rhode island" if investor_state_temp2=="providence"
replace investor_state_temp2="virginia" if investor_state_temp2=="suffolk"
replace investor_state_temp2="maine" if investor_state_temp2=="bridgton"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="hingham"
replace investor_state_temp2="connecticut" if investor_state_temp2=="danbury"
replace investor_state_temp2="delaware" if investor_state_temp2=="wilmington"
replace investor_state_temp2="connecticut" if investor_state_temp2=="hartford"
replace investor_state_temp2="new hempshire" if investor_state_temp2=="keene"
replace investor_city_temp="liverpool" if investor_state_temp2=="liverpool"
replace investor_city_temp="toronto" if investor_state_temp2=="toronto"
replace investor_city_temp="montreal" if investor_state_temp2=="montreal"
replace investor_city_temp="london" if investor_state_temp2=="london"
replace investor_city_temp="gothenburg" if investor_state_temp2=="gothenburg"
replace investor_city_temp="zurich" if investor_state_temp2=="zurich"
replace investor_city_temp="edinburgh" if investor_state_temp2=="edinburgh"
replace investor_state_temp2="england" if investor_state_temp2=="liverpool"
replace investor_state_temp2="canada" if investor_state_temp2=="toronto"
replace investor_state_temp2="canada" if investor_state_temp2=="montreal"
replace investor_state_temp2="england" if investor_state_temp2=="london"
replace investor_state_temp2="sweden" if investor_state_temp2=="gothenburg"
replace investor_state_temp2="switzerland" if investor_state_temp2=="zurich"
replace investor_state_temp2="scotland" if investor_state_temp2=="edinburgh"

*replace branches
replace investor_city_temp="london" if investor_city_temp=="london" & investor_state_temp2=="canada/canada" 
replace investor_city_temp="toronto" if investor_city_temp=="toronto" & investor_state_temp2=="canada/canada" 
replace investor_city_temp="london/montreal" if investor_city_temp=="montreal/london" & investor_state_temp2=="canada/england" 
replace investor_city_temp="london/new york" if investor_city_temp=="london/new york" & investor_state_temp2=="edinburgh/great britain/new york" 
replace investor_city_temp="london/boston" if investor_city_temp=="london" & investor_state_temp2=="england/boston" 
replace investor_city_temp="london & aberdeen/montreal" if investor_city_temp=="aberdeen" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="liverpool/montreal" if investor_city_temp=="liverpool" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="liverpool/montreal" if investor_city_temp=="liverpool / canada" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="liverpool/montreal" if investor_city_temp=="liverpool/can" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="liverpool/montreal" if investor_city_temp=="liverpool/cana" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="london/montreal" if investor_city_temp=="london" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="london/montreal" if investor_city_temp=="london/ can" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="london/montreal" if investor_city_temp=="london/canada" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="london/montreal" if investor_city_temp=="london/canadian" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="york/montreal" if investor_city_temp=="london/canadianbranch" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="york/montreal" if investor_city_temp=="york/ canada" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="york/montreal" if investor_city_temp=="york/canada" & investor_state_temp2=="england/montreal" 
replace investor_city_temp="london/new york" if investor_city_temp=="london/new york" & investor_state_temp2=="england/new york city" 
replace investor_city_temp="london/new york" if investor_city_temp=="tendon" & investor_state_temp2=="england/new york city" 
replace investor_city_temp="london/montreal" if investor_city_temp=="london/montreal" & investor_state_temp2=="england/quebec" 
replace investor_city_temp="london & edinburgh/new york" if investor_city_temp=="london/edinburgh/new york" & investor_state_temp2=="england/scotland/new york" 
replace investor_city_temp="london/toronto" if investor_city_temp=="london" & investor_state_temp2=="england/toronto" 
replace investor_city_temp="london/toronto" if investor_city_temp=="london/can" & investor_state_temp2=="england/toronto" 
replace investor_city_temp="paris/hartford" if investor_city_temp=="paris/conn" & investor_state_temp2=="france/hartford" 
replace investor_city_temp="stettin/chicago" if investor_city_temp=="stettin" & investor_state_temp2=="germany/chicago" 
replace investor_city_temp="edinburgh/hartford" if investor_city_temp=="edinburgh scot" & investor_state_temp2=="hartford/connecticut" 
replace investor_city_temp="edinburgh/hartford" if investor_city_temp=="edinburgh/ scotland" & investor_state_temp2=="hartford/connecticut" 
replace investor_city_temp="edinburgh/hartford" if investor_city_temp=="edinburgh/hartford" & investor_state_temp2=="hartford/connecticut" 
replace investor_city_temp="st petersburg/hartford" if investor_city_temp=="st petersburg/hsrtford" & investor_state_temp2=="hartford/connecticut" 
replace investor_city_temp="liverpool/hartford" if investor_city_temp=="eng/ conn" & investor_state_temp2=="liverpool/hartford" 
replace investor_city_temp="london/new york" if investor_city_temp=="london" & investor_state_temp2=="london/new york" 
replace investor_city_temp="london/toronto" if investor_city_temp=="" & investor_state_temp2=="london/toronto" 
replace investor_city_temp="edinburgh/montreal" if investor_city_temp=="edinburgh/ can" & investor_state_temp2=="montreal/scotland" 
replace investor_city_temp="london/new york" if investor_city_temp=="ny/england" & investor_state_temp2=="new york/london" 
replace investor_city_temp="newburyport" if investor_city_temp=="newburyport & vic" & investor_state_temp2=="newburyport/massachusetts" 
replace investor_city_temp="perth/philadelphia" if investor_city_temp=="limited" & investor_state_temp2=="perth/philadelphia" 
replace investor_state_temp2="germany/connecticut" if investor_state_temp2=="bavaria/connecticut"
replace investor_state_temp2="canada" if investor_state_temp2=="canada/canada"
replace investor_state_temp2="england/canada" if investor_state_temp2=="canada/england"
replace investor_state_temp2="canada/new york" if investor_state_temp2=="canada/new york city"
replace investor_state_temp2="england/new york" if investor_state_temp2=="edinburgh/great britain/new york"
replace investor_state_temp2="england/massachusetts" if investor_state_temp2=="england/boston"
replace investor_state_temp2="england/canada" if investor_state_temp2=="england/montreal"
replace investor_state_temp2="england/new york" if investor_state_temp2=="england/new york city"
replace investor_state_temp2="england/canada" if investor_state_temp2=="england/quebec"
replace investor_state_temp2="england & scotland/new york" if investor_state_temp2=="england/scotland/new york"
replace investor_state_temp2="england/canada" if investor_state_temp2=="england/toronto"
replace investor_state_temp2="france/connecticut" if investor_state_temp2=="france/hartford"
replace investor_state_temp2="germany/illinois" if investor_state_temp2=="germany/chicago"
replace investor_state_temp2="germany/new york" if investor_state_temp2=="germany/germany"
replace investor_state_temp2="scotland/connecticut" if investor_state_temp2=="hartford/connecticut"
replace investor_state_temp2="russia/connecticut" if investor_state_temp2=="hartford/connecticut"
replace investor_state_temp2="england/connecticut" if investor_state_temp2=="liverpool/hartford"
replace investor_state_temp2="england/illinois" if investor_state_temp2=="london/illinois"
replace investor_state_temp2="england/new york" if investor_state_temp2=="london/new york"
replace investor_state_temp2="england/canada" if investor_state_temp2=="london/toronto"
replace investor_state_temp2="england/new york" if investor_state_temp2=="massachusetts/new york"
replace investor_state_temp2="scotland/canada" if investor_state_temp2=="montreal/scotland"
replace investor_state_temp2="england/new york" if investor_state_temp2=="new york/london"
replace investor_state_temp2="massachusetts" if investor_state_temp2=="newburyport/massachusetts"
replace investor_state_temp2="scotland/pennsylvania" if investor_state_temp2=="perth/philadelphia"
replace investor_state_temp2="england & scotland/new york" if investor_state_temp2=="scotland/england"
replace investor_state_temp2="scotland/canada" if investor_state_temp2=="scotland/montreal"
replace investor_state_temp2="virginia" if investor_state_temp2=="suffolk/virginia"
replace investor_state_temp2="new hampshire" if investor_state_temp2=="new hempshire"
replace investor_state_temp2="illinois" if investor_state_temp2=="hawaii" & strpos(investor_state_hold,"III")
replace investor_state_temp2="canada" if investor_state_temp2=="washington" & strpos(investor_state_hold,"B")
replace investor_state_temp2=subinstr(investor_state_temp2,"hawaii","illinois",.) if strpos(investor_state_temp2,"/hawaii")
replace investor_state_temp2=subinstr(investor_state_temp2,"hawaii","illinois",.) if investor_city_temp=="providence"
replace investor_state_temp2="pennsylvania" if invname_hold_temp=="delaware county trust safe deposit and title insurance"
replace investor_state_temp2="canada" if invname_hold_temp=="sun life assurance of canada" & investor_state_temp2==""
replace investor_state_temp2="new hampshire" if investor_state_temp2=="n ii"
replace investor_state_temp2="new hampshire" if investor_state_temp2=="nii"

cap drop investor_state_1 investor_state_2 
cap drop investor_state_3
cap drop dummy_* _merge dummy
cap drop tag

split investor_state_temp2, p("/") gen(investor_state_)
cap gen dummy=""
foreach i in "1" "2"{
global x="investor_state_`i'"
replace $x=strtrim($x)
replace $x=stritrim($x)
replace $x=lower($x)
*do statelist.do
do City_State_Dummy.do
replace dummy=dummy+"/"+string(dummy_$x) if string(dummy_$x)!="."
}
replace dummy=subinstr(dummy,"12","1",.)
replace dummy="/1" if investor_state_1==investor_state_2 & dummy=="/1/1"
replace investor_state_temp2=investor_state_2+"/"+investor_state_1 if dummy=="/1/3"
replace dummy="/3/1" if dummy=="/1/3"

cap drop label state_sum temp_d* _merge
cap drop dummy
cap drop investor_state_3 dummy_investor_state_3
label var investor_state_temp "Cleaned total region (US State/Foreign Country) for investor"
label var investor_state_1 "Cleaned Primary region (US State/Foreign Country) for investor"
label var investor_state_2 "Cleaned Secondary region (US State/Canada) for investor"
label var dummy_investor_state_1 "Primary region type: domestic or foreign"
label var dummy_investor_state_2 "Secondary region type: domestic or foreign"

cap drop investor_state_temp
rename investor_state_temp2 investor_state_temp
cap drop temp_d temp_d*
cap drop var3 idu _merge
cap drop investor_state_3

cd "$root_do"
do City_Clean.do

cd "$root_data"
saveold Holdings_Investor_LocClean.dta, replace

cd "$root_do"
do Name_Clean.do

cd "$root_data"
saveold Holdings_Data_InvestorClean_dummy.dta, replace

/*
keep if industry~="Government"
keep if dummy!="/1" & dummy!="/3/1" & dummy!="/3"
duplicates drop investor_state_temp2 investor_city_temp, force
browse investor_state_temp2 investor_city_temp state_sum invname_hold_orig investor_city_temp book_year_hold cname_hold_temp industry //if dummy=="/23"
save loc_temp.dta, replace
browse investor_state_temp2 temp_d1 if temp_d2==2
*/



/*city related
split investor_city_temp, p("/") gen(investor_city_)

save temp_bfmerge.dta, replace

use temp_bfmerge.dta, clear

sort investor_city_1
merge m:n investor_city_1 using citystate.dta
drop if _merge==2
duplicates drop investor_state_temp investor_city_temp, force
sort investor_state_temp investor_city_temp
*gen lent=length(state)
*bysort investor_state_temp: egen max=max(lent)
*keep if lent==max
duplicates drop investor_state_`i', force
