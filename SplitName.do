*This file generates the STATA do-file code to correct original ?????????????????
clear
cd "C:\Users\Kellogg\Desktop\Bond Rating\Holding_Data"
import excel using Clean_Issuer_checklist.xlsx, sh(Checklist) first
destring Correct_Indicator Dubious_Indicator, replace
*drop special of dubious cases since they are unnecessary in generating "replace dofile"
keep if Dubious_Indicator==0
keep cname_hold_temp Correct_Indicator Dubious_Indicator group fuzzy_match_count
split cname_hold_temp, gen(name)
gsort group -Correct_Indicator
export excel using preclean.xlsx, first(var) replace

 
/*Check for correctness
bysort group: egen total=total( Correct_Indicator)
tab total
