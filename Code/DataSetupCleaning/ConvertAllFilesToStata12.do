cd "C:\Users\asafb\Dropbox (MIT)\RatingAgenciesPersonal\Data_Programs\Data"

local files : dir "`c(pwd)'" files "*.dta"

foreach file in `files' {
	*disp `file'
	*insheet using `file', comma clear;
	/* do your stuff here */
	use "`file'", clear
		saveold `file'_Stata12, replace
}
