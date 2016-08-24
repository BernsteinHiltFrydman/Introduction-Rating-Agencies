
******
* Unique Bond Identifiers Code for Firm Effects of Introduction of Securities Ratings
*
* Last Updated by Asaf Bernstein on 3/11/2014
*
*
*****

cd "C:\Dropbox\RatingAgencies\Data_Programs\Data\"

***************		

insheet using "FirstBatchAllCleanData_20140127_v4_VersionAsaf.csv", comma clear
	
	gen class_orig = class
	gen class_cleaned = class
	replace class_cleaned = subinstr(class_cleaned, ".", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, ",", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "-", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "~", " ", .)
	replace class_cleaned = subinstr(class_cleaned, ":", " ", .)
	replace class_cleaned = subinstr(class_cleaned, ";", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "$", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "#", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "!", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "*", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "(", " ", .)
	replace class_cleaned = subinstr(class_cleaned, ")", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "+", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "&", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "'", " ", .)
	
	replace class_cleaned = lower(class_cleaned)
	
	replace class_cleaned = " " + class_cleaned + " "
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .)
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .)

	* Uncomment this later
	duplicates drop class_cleaned, force
	sort class_cleaned
	
	replace class_cleaned = subinstr(class_cleaned, " 1srt ", " 1st ", .)
	replace class_cleaned = subinstr(class_cleaned, " 1s t ", " 1st ", .)
	replace class_cleaned = subinstr(class_cleaned, " 1s ", " 1st ", .)
	replace class_cleaned = subinstr(class_cleaned, " 1 st ", " 1st ", .)	

	* Uncomment this later
	duplicates drop class_cleaned, force
	sort class_cleaned	
	
	replace class_cleaned = subinstr(class_cleaned, " 2d ", " 2nd ", .)
	replace class_cleaned = subinstr(class_cleaned, " 2 ", " 2nd ", .)
	replace class_cleaned = subinstr(class_cleaned, " 2st ", " 1st ", .)

	* Uncomment this later
	duplicates drop class_cleaned, force
	sort class_cleaned	
	
	replace class_cleaned = subinstr(class_cleaned, " 3d ", " 3rd ", .)
	
	* Uncomment this later
	duplicates drop class_cleaned, force
	sort class_cleaned

	replace class_cleaned = subinstr(class_cleaned, " 3d ", " 3rd ", .)
	
	* Uncomment this later
	duplicates drop class_cleaned, force
	sort class_cleaned	
	
	replace class_cleaned = subinstr(class_cleaned, " conv ", " convertible ", .)
	replace class_cleaned = subinstr(class_cleaned, " cv ", " convertible ", .) 
	replace class_cleaned = subinstr(class_cleaned, " covn ", " convertible ", .) 	
	
	replace class_cleaned = subinstr(class_cleaned, " consid ", " consolidated ", .) 
	replace class_cleaned = subinstr(class_cleaned, " consld ", " consolidated ", .) 
	replace class_cleaned = subinstr(class_cleaned, " cons ", " consolidated ", .) 
	replace class_cleaned = subinstr(class_cleaned, " consol ", " consolidated ", .) 
	replace class_cleaned = subinstr(class_cleaned, " consal ", " consolidated ", .)
	replace class_cleaned = subinstr(class_cleaned, " cosole ", " consolidated ", .)
	
	gen consolidated = 1 if strmatch(class_cleaned, "*consolidated*")
	gen convertible = 1 if strmatch(class_cleaned, "*convertible*")
	bys issuer_id: egen cnt_consolidated = sum(consolidated)
	bys issuer_id: egen cnt_convertible = sum(convertible)
	

	
	
	
	replace class_cleaned = subinstr(class_cleaned, " ref ", " refunding ", .)
		
	replace class_cleaned = subinstr(class_cleaned, " ajd ", " adjustment ", .) 
	replace class_cleaned = subinstr(class_cleaned, " a dj ", " adjustment ", .) 
	replace class_cleaned = subinstr(class_cleaned, " adjust ", " adjustment ", .) 
	replace class_cleaned = subinstr(class_cleaned, " ad just ", " adjustment ", .) 
	replace class_cleaned = subinstr(class_cleaned, " aj ", " adjustment ", .) 
	replace class_cleaned = subinstr(class_cleaned, " adj ", " adjustment ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " ad stamped", " adjustment stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " adjustment stemped", " adjustment stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " adjustment stempad", " adjustment stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " a s", " adjustment stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " adjustment stapd ", " adjustment stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " adjustment stp ", " adjustment stamped ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " reg ", " registered ", .) 
	replace class_cleaned = subinstr(class_cleaned, " rg ", " registered ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " stpd ", " stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " st p d ", " stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " stampd ", " stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " stapd ", " stamped ", .)
	replace class_cleaned = subinstr(class_cleaned, " stamp ", " stamped ", .)
	replace class_cleaned = subinstr(class_cleaned, " sta ", " stamped ", .) 
	replace class_cleaned = subinstr(class_cleaned, " st ", " stamped ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " pd ", " paid ", .) 
	replace class_cleaned = subinstr(class_cleaned, " rull ", " full ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " deb ", " debenture ", .) 
	replace class_cleaned = subinstr(class_cleaned, " debt ", " debenture ", .) 
	replace class_cleaned = subinstr(class_cleaned, " debeure ", "debenture ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " div l", " divisional ", .) 
	replace class_cleaned = subinstr(class_cleaned, " div ", " divisional ", .) 
	replace class_cleaned = subinstr(class_cleaned, " divi ", " divisional ", .) 
	replace class_cleaned = subinstr(class_cleaned, " divil ", " divisional ", .) 
	replace class_cleaned = subinstr(class_cleaned, " divl ", " divisional ", .) 
	replace class_cleaned = subinstr(class_cleaned, " divd ", " divisional ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " imp ", " improvements ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " ext ", " extension ", .) 
	replace class_cleaned = subinstr(class_cleaned, " extd ", " extension ", .) 
	replace class_cleaned = subinstr(class_cleaned, " extended ", " extension ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " s f ", " sinking fund ", .) 
	replace class_cleaned = subinstr(class_cleaned, " sf ", " sinking fund ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " w i ", " when issued ", .) 
	replace class_cleaned = subinstr(class_cleaned, " wi ", " when issued ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " mtge ", " mortgage ", .) 
	replace class_cleaned = subinstr(class_cleaned, " mtgo ", " mortgage ", .) 
	replace class_cleaned = subinstr(class_cleaned, " mtg ", " mortgage ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " coup ", " coupon ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " oft ", " off ", .)
	
	* "jt" could also be "junction"
	*replace class_cleaned = subinstr(class_cleaned, " jt ", " joint ", .)
	replace class_cleaned = subinstr(class_cleaned, " jiont ", " joint ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " cfts ", " certificates ", .)
	replace class_cleaned = subinstr(class_cleaned, " ctfs ", " certificates ", .) 
	replace class_cleaned = subinstr(class_cleaned, " ctfc ", " certificates ", .) 
	replace class_cleaned = subinstr(class_cleaned, " cfs ", " certificates ", .) 
	replace class_cleaned = subinstr(class_cleaned, " cefts ", " certificates ", .) 
	
	replace class_cleaned = subinstr(class_cleaned, " gen ", " general ", .) 
	replace class_cleaned = subinstr(class_cleaned, " gn ", " general ", .)
	replace class_cleaned = subinstr(class_cleaned, " genl ", " general ", .)
	replace class_cleaned = subinstr(class_cleaned, " genral ", " general ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " col ", " collateralized ", .)
	replace class_cleaned = subinstr(class_cleaned, " coll ", " collateralized ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " tax ex ", " tax exempt ", .)
	replace class_cleaned = subinstr(class_cleaned, " tax exemp ", " tax exempt ", .)
	replace class_cleaned = subinstr(class_cleaned, " tax exampt ", " tax exempt ", .)
	replace class_cleaned = subinstr(class_cleaned, " tax exmpt ", " tax exempt ", .)
	replace class_cleaned = subinstr(class_cleaned, " tex exempt ", " tax exempt ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " p c ", " per cent ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " f p ", " full paid ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " rcts ", " receipts ", .)
	replace class_cleaned = subinstr(class_cleaned, " rects ", " receipts ", .)
	replace class_cleaned = subinstr(class_cleaned, " rec ", " receipts ", .)
	replace class_cleaned = subinstr(class_cleaned, " receipt ", " receipts ", .)
	*replace class_cleaned = subinstr(class_cleaned, " r ", " receipts ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " reor ", " reorganization ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " reund ", " refunding ", .)
	replace class_cleaned = subinstr(class_cleaned, " rf ", " refunding ", .)
	replace class_cleaned = subinstr(class_cleaned, " rfdg ", " refunding ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " tmp ", " temp ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " ter ", " terminal ", .)
	replace class_cleaned = subinstr(class_cleaned, " term ", " terminal ", .)
	replace class_cleaned = subinstr(class_cleaned, " tem ", " terminal ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " inst ", " installment ", .)
	replace class_cleaned = subinstr(class_cleaned, " instal ", " installment ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " equip ", " equipment ", .)
	replace class_cleaned = subinstr(class_cleaned, " eq ", " equipment ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " and ", " ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " serics ", " series ", .)
	
	*replace class_cleaned = subinstr(class_cleaned, " t ", " trust ", .)
	replace class_cleaned = subinstr(class_cleaned, " t r ", " trust receipts ", .)
	replace class_cleaned = subinstr(class_cleaned, " tr r ", " trust receipts ", .)
	replace class_cleaned = subinstr(class_cleaned, " tr ", " trust ", .)
	*replace class_cleaned = subinstr(class_orig, " of t ", " of t ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " inc ", " income ", .)
	replace class_cleaned = subinstr(class_cleaned, " in come ", " income ", .)
	replace class_cleaned = subinstr(class_cleaned, " incme ", " income ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " gtd ", " guaranteed ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " ser ", " series ", .)
	replace class_cleaned = subinstr(class_cleaned, " serie ", " series ", .)
	replace class_cleaned = subinstr(class_cleaned, " sreies ", " series ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " perior ", " prior ", .)
	replace class_cleaned = subinstr(class_cleaned, " pr ", " prior ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " prior 1 ", " prior lien ", .)
	replace class_cleaned = subinstr(class_cleaned, " prior l ", " prior lien ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " pf ", " preferred ", .)
	replace class_cleaned = subinstr(class_cleaned, " pref ", " preferred ", .)
	
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	replace class_cleaned = subinstr(class_cleaned, "  ", " ", .) 
	
	*duplicates drop class_cleaned, force
	sort class_cleaned
	
	save tmp9, replace
	
	* This code puts all words in alphabetical order (maybe not that useful... I don't know...helps with 38 duplicates)
	use tmp9, clear
	
	split class_cleaned, gen(class_cleaned_word)
	
	forvalues i = 1(1)10 {
		forvalues j = 1(1)10 {
			gen cmpr_`i'_`j' = class_cleaned_word`i' > class_cleaned_word`j' 
		}
	}
	
	
	forvalues i = 1(1)10 {
	gen sum_cmpr_`i' = 0
		forvalues j = 1(1)10 {
			replace sum_cmpr_`i' = sum_cmpr_`i' + cmpr_`i'_`j'
		}
	}
	
	gen class_cleaned_alph = ""
	forvalues i = 1(1)10 {
		forvalues j = 1(1)10 {
			replace class_cleaned_alph = class_cleaned_alph + " " + class_cleaned_word`j' if sum_cmpr_`j'==`i'
		}		
	}	
	
	replace class_cleaned_alph = subinstr(class_cleaned_alph, "  ", " ", .) 
	replace class_cleaned_alph = subinstr(class_cleaned_alph, "  ", " ", .) 
	replace class_cleaned_alph = subinstr(class_cleaned_alph, "  ", " ", .)
	
	drop sum_cmpr_* class_cleaned_word* cmpr_*
	
	*duplicates drop class_cleaned_alph, force
	sort class_cleaned_alph
	
	drop  class_cleaned
	rename class_cleaned_alph class_cleaned
	
	save tmp10, replace
	
	use tmp10, clear
	
	gen class_orig2 = class_orig
	drop class_orig
	rename class_orig2 class_orig
	
	replace class_cleaned = " " + class_cleaned + " "
	
	replace class_cleaned = subinstr(class_cleaned, " tmp ", " temp ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " bonds ", " bond ", .)
	
	*replace class_cleaned = subinstr(class_cleaned, " cent ", " central ", .)
	*replace class_cleaned = subinstr(class_cleaned, " cen ", " central ", .)
	
	replace class_cleaned = subinstr(class_cleaned, " ract ", " receipts ", .)
	replace class_cleaned = subinstr(class_cleaned, " rcts receipts ", " receipts ", .)
	
	gen class_cleaned_convertible = subinstr(class_cleaned, " con ", " convertible ", .)
	gen class_cleaned_consolidated = subinstr(class_cleaned, " con ", " consolidated ", .)
	
	replace class_cleaned = class_cleaned_convertible if strmatch(class_cleaned, "*con*") & cnt_convertible>=10 & cnt_consolidated<5
	replace class_cleaned = class_cleaned_consolidated if strmatch(class_cleaned, "*con*") & cnt_convertible<5 & cnt_consolidated>=10
	
	drop class_cleaned_consolidated class_cleaned_convertible
	
	bys issuer_id class_cleaned coupon maturityyear: egen cnt_obs = count(year)
	duplicates drop issuer_id class_cleaned coupon maturityyear, force
	
	duplicates drop class_cleaned, force
	
	*****
	
	* "con" could be "consolidated" or "convertible"
	* "g" could be "gold" or "general" or "guaranteed"
	* Should break them up into words first and then put in alphanumeric order
	* I can't handle this "1st, inc, st' p' d" correctly
	
