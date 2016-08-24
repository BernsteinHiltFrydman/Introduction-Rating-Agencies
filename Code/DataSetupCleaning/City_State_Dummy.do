rename $x std_name
sort std_name
cap drop _merge
merge m:n std_name using city_state_list.dta
drop if _merge==2
replace tag=0 if _merge==1
replace tag=. if std_name==""
label def tag_citystate 0 "Invalid Name" 1 "US State" 2 "US City" 3 "Foreign State" 12 "US State or City (New York)" 23 "Foreign City" 123 "US or Foreign City (Perth)", modify
label values tag tag_citystate
rename std_name $x
rename tag dummy_$x
