global root_dta "D:\Dropbox\Bond Rating\Code and Data\dta"
global root_do "D:\Dropbox\Bond Rating\Code and Data\do_issue"

cd "$root_dta"
use Holdings_Data_InvestorClean_dummy.dta, clear

replace cname_hold_temp="wessex water" if strpos(cname_hold_temp,"nessex water")
gen coupon_hold_temp=coupon_hold
replace coupon_hold_temp=strtrim(coupon_hold_temp)
replace coupon_hold_temp=stritrim(coupon_hold_temp)
replace coupon_hold_temp=subinstr(coupon_hold_temp,",","&",.)
replace coupon_hold_temp=subinstr(coupon_hold_temp," ","",.)
replace coupon_hold_temp=subinstr(coupon_hold_temp,"&&","&",.)
replace coupon_hold_temp="4.875" if coupon_hold_temp=="4.7-8"


replace coupon_hold_temp="6" if cname_hold_orig=="AMERICAN PIPE AND CONSTRUCTION COMPANY" & invname_hold_orig=="Lewisburg Trust & Safe Deposit Company" & book_year_hold==1911 & maturity_year_hold=="N/A" & par_value_clean_hold==3000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="AMERICAN PIPE AND CONSTRUCTION COMPANY" & invname_hold_orig=="Industrial Trust" & book_year_hold==1911 & maturity_year_hold=="N/A" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="AMERICAN SPIRITS MANUFACTURING COMPANY" & invname_hold_orig=="Ithaca Trust Company" & book_year_hold==1908 & maturity_year_hold=="1915" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="AMERICAN TELEPHONE AND TELEGRAPH COMPANY" & invname_hold_orig=="Capital Fire Insurance Company" & book_year_hold==1908 & maturity_year_hold=="1908" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="AMERICAN TELEPHONE AND TELEGRAPH COMPANY" & invname_hold_orig=="Columbian National Life Insurance Company" & book_year_hold==1908 & maturity_year_hold=="1907" & par_value_clean_hold==25000 & stock_type_hold=="N/A" & class_hold=="Notes"
replace coupon_hold_temp="6" if cname_hold_orig=="AWARD BOARD VIEWERS' CONSOLIDATED ICE COMPANY" & invname_hold_orig=="Workingman's Savings Bank & Trust Company" & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==14502 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BAKER AND SHEVLIN COMPANY" & invname_hold_orig=="Andirondack Trust Company" & book_year_hold==1908 & maturity_year_hold=="1911" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BAKER CONTRACT COMPANY" & invname_hold_orig=="Colonial Trust Companv" & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==115000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BARBER ASPHALT PAVING COMPANY" & invname_hold_orig=="Ridge Avenue Bank" & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==4400 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BATCHELOR TIMBER COMPANY" & invname_hold_orig=="United States Health & Accident Insurance Co." & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==95000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BELL TELEPHONE COMPANY" & invname_hold_orig=="Jenkintown Trust Company" & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==10012 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BELLEVUE WATER COMPANY" & invname_hold_orig=="Countv Savings Bank" & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==2000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BERGNER AND EXCEL BREWING COMPANY" & invname_hold_orig=="Mutual Fire Insurance Company of Germantown" & book_year_hold==1908 & maturity_year_hold=="1021" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BERGNER AND EXCEL BREWING COMPANY" & invname_hold_orig=="Union Trust Companv" & book_year_hold==1908 & maturity_year_hold=="1021" & par_value_clean_hold==9900 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BERGNER AND EXCEL BREWING COMPANY" & invname_hold_orig=="Fidelity Mutual Life Insurance Company" & book_year_hold==1908 & maturity_year_hold=="1021" & par_value_clean_hold==31534 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BLISS (E W ) COMPANY" & invname_hold_orig=="People's Trust Company" & book_year_hold==1908 & maturity_year_hold=="1932" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BOSTON BUILDING (Denver, Col )" & invname_hold_orig=="Holyoke Mutual Fire Insurance Comoany" & book_year_hold==1908 & maturity_year_hold=="1908" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BRADDOCK GAS AND LIGHT COMPANY" & invname_hold_orig=="People's Savings Bank of Pittsburg" & book_year_hold==1908 & maturity_year_hold=="1908" & par_value_clean_hold==1000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BRADDOCK GAS AND LIGHT COMPANY" & invname_hold_orig=="Pittsburgh Insurance Company" & book_year_hold==1908 & maturity_year_hold=="1908" & par_value_clean_hold==3500 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BRIGHTON BEACH DEVELOPMENT COMPANY" & invname_hold_orig=="Long Island Loan & Trust Company" & book_year_hold==1908 & maturity_year_hold=="1908-12" & par_value_clean_hold==25000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="BRIGHTON BEACH DEVELOPMENT COMPANY" & invname_hold_orig=="Columbia Trust Company" & book_year_hold==1908 & maturity_year_hold=="1908-12" & par_value_clean_hold==40000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4.5" if cname_hold_orig=="PORTLAND (ME) RAILROAD" & invname_hold_orig=="Penobscot Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1913" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4.5" if cname_hold_orig=="PORTLAND (ME) RAILROAD" & invname_hold_orig=="Franklin County Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1913" & par_value_clean_hold==4000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4.5" if cname_hold_orig=="PORTLAND (ME) RAILROAD" & invname_hold_orig=="Brunswick Savings Institution" & book_year_hold==1911 & maturity_year_hold=="1913" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4.5" if cname_hold_orig=="PORTLAND (ME) RAILROAD" & invname_hold_orig=="Portland Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1913" & par_value_clean_hold==100000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="2-5" if cname_hold_orig=="ST LOUIS ELECTRIC TERMINAL" & invname_hold_orig=="Sun Life Assurance Company of Canada" & book_year_hold==1913 & maturity_year_hold=="1929" & par_value_clean_hold==1724000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4.5" if cname_hold_orig=="ST LOUIS MEMPHIS AND SOUTHEASTERN" & invname_hold_orig=="American Central Insurance Company" & book_year_hold==1908 & maturity_year_hold=="1909" & par_value_clean_hold==97086 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4.875" if cname_hold_orig=="DOMINION REALTY LTD" & invname_hold_orig=="Mutual Life Assurance Company" & book_year_hold==1913 & maturity_year_hold=="1912-24" & par_value_clean_hold==47729 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Real Estate Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="People's Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="American National Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==21000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Kennebunk Savings Bank," & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==6000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Laconia Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Guaranty Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==56000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Fidelity Title & Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Norway Plains Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Bath Savings Institution" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="People's Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==3000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Loan & Trust Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Portland Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==60000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Equitable Fire and Marine Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Producers' Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Baltimore Life Insurance Company of Baltimore" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==100000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Loan & Trust Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Union Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==107000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Shrewsbury Savings Institution" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Minneapolis Mutual Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20700 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="City Trust Company of Newark" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Aetna Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==75000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Ithaca Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Union Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==49000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Integrity Title Insurance & Safe Deposit Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Pittsburg Life & Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Saint Paul Fire & Marine Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==25000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Dartmouth Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="People's National Fire Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Savings Bank of Newport" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Maryland Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==15000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Conn.ecticut Fire Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==21000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Waterville Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Provident Life & Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==172000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Plttsfield Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Bridgton Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Conn.ecticut Fire Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==90000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Orient Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Brunswick Savings Institution" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="merrimack Mutual Fire Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==3000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Laconia Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Rhode Island Hospital Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="National Life Insurance Company of U S A" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==24300 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Rockland Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==16000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Agricultural Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="metropolitan Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==500000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Penn Mutual Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==120000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Summit Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Hartford Steam Boiler Inspection & Insurance Co" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Maine Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==136000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Easton Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==35000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Providence Institution for Savings" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==40000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Bristol Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==6000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="New England Mutual Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==130000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="State Mutual Life Assurance Company of Worcester" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Millers' National Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="American Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Portland Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==90000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="New York Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==30000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="People's Safe Deposit & Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Bangor Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==18000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Bucks County Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Union Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==157000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Deposit and Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Alta Friendly Society" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Industrial Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==100000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Phoenix Mutual Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==13000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Albany Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==25000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Lumber Mutual Fire Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Columbian National Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==25000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Western Assurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Travelers' Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==100000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="International Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==15000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="New Hampshire Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="American Central Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Union Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==120000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Woonsocket Institution for Savings" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==25000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="merrimack County Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="United States Fidelity & Guaranty Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==15000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Allison HIll. Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==3000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Wakefield Institution for Savings" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Dubuque Fire & Marine Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==85000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Norway Plains Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==15000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Bangor Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==43000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Land Title & Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Iona Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Chemung Canal Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==25000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Morristown Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==200000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Phoenix Mutual Life Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==13000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Piscataquis Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==3000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Doylestown Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Loan & Trust Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Gorham Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==4000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Saco Biddeford Savings Institution" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Montgomery Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Savings Fund Society of Germantown & its Vicinity" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==30000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Providence Institution for Savings" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Auburn Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Wakefield Trust Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Hope Mutual Fire Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Inland Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5/4" if cname_hold_orig=="CHICAGO RAILWAYS" & invname_hold_orig=="Thomaston Savings Bank" & book_year_hold==1911 & maturity_year_hold=="1927/1912" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5&4" if cname_hold_orig=="GAS COMPANY OF MONTGOMERY COUNTY" & invname_hold_orig=="Norristown Trust Company" & book_year_hold==1913 & maturity_year_hold=="1961" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5&5.5" if cname_hold_orig=="LA CROSSE WATER POWER COMPANY" & invname_hold_orig=="Milers' Mutual Fire Insurance Co.." & book_year_hold==1911 & maturity_year_hold=="N/A" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="Bonds"
replace coupon_hold_temp="4&5" if cname_hold_orig=="PHILADELPHIA AND EASTON ELECTRIC" & invname_hold_orig=="City Bank of York" & book_year_hold==1913 & maturity_year_hold=="1927" & par_value_clean_hold==4000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4&5" if cname_hold_orig=="PHILADELPHIA,WILMINGTON AND BALTIMORE" & invname_hold_orig=="Philadelphia Savings Fund Society" & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==28000 & stock_type_hold=="N/A" & class_hold=="N/A"
*replace coupon_hold_temp="5.1-5.5" if cname_hold_orig=="NORTHERN LIBERTY MARKET ASSOCIATION, (Washington, D C )" & invname_hold_orig=="Trust Company of North America." & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==15000 & stock_type_hold=="" & class_hold=="N/A"
replace coupon_hold_temp="5&5.4" if cname_hold_orig=="FRIEIIOEFER VIENNA BAKING COMPANY" & invname_hold_orig=="Girard Fire & Marine Insurance Company" & book_year_hold==1911 & maturity_year_hold=="1914" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5" if cname_hold_orig=="BALTIMORE COUNTY WATER AND ELECTRIC COMPANY" & invname_hold_orig=="Columbus Trust Company" & book_year_hold==1908 & maturity_year_hold=="1946" & par_value_clean_hold==5000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5" if cname_hold_orig=="BALTIMORE COUNTY WATER AND ELECTRIC COMPANY" & invname_hold_orig=="German Fire Insurance Company" & book_year_hold==1908 & maturity_year_hold=="1946" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="5" if cname_hold_orig=="BALTIMORE COUNTY WATER AND ELECTRIC COMPANY" & invname_hold_orig=="G erman-American Fire Insurance Company" & book_year_hold==1908 & maturity_year_hold=="1946" & par_value_clean_hold==10000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4&5" if cname_hold_orig=="PHILADELPHIA AND EASTON ELECTRIC" & invname_hold_orig=="Hamilton Trust Company" & book_year_hold==1913 & maturity_year_hold=="1927" & par_value_clean_hold==7700 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4&5" if cname_hold_orig=="PHILADELPHIA AND EASTON ELECTRIC" & invname_hold_orig=="Northern Trust a Savings Company" & book_year_hold==1913 & maturity_year_hold=="1927" & par_value_clean_hold==28000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="6" if cname_hold_orig=="FORT PITT GAS COMPANY" & invname_hold_orig=="New Kensington Bank" & book_year_hold==1908 & maturity_year_hold=="N/A" & par_value_clean_hold==10238 & stock_type_hold=="" & class_hold=="N/A"
replace coupon_hold_temp="3" if cname_hold_orig=="STURGIS, GOSHEN AND ST LOUIS" & invname_hold_orig=="New England Mutual Life Insurance Company" & book_year_hold==1913 & maturity_year_hold=="1989" & par_value_clean_hold==50000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="3" if cname_hold_orig=="STURGIS, GOSHEN AND ST LOUIS" & invname_hold_orig=="College Point Savings Bank" & book_year_hold==1913 & maturity_year_hold=="1989" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="3" if cname_hold_orig=="STURGIS, GOSHEN AND ST LOUIS" & invname_hold_orig=="Mechanics' Savings Bank" & book_year_hold==1913 & maturity_year_hold=="1989" & par_value_clean_hold==20000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4-5" if coupon_hold_temp=="5-Apr"
replace coupon_hold_temp="6" if coupon_hold_temp=="6-Jan"
replace coupon_hold_temp="4.5" if coupon_hold_temp=="0.5"
replace coupon_hold_temp="6" if cname_hold_orig=="NORTH SIDE REAL ESTATE COMPANY" & book_year_hold==1908 & invname_hold_orig=="Dollar Savings Fund & Trust Company"
replace coupon_hold_temp="6" if cname_hold_orig=="SWISS FEDERAL RAILROAD" & book_year_hold==1908 & invname_hold_orig=="New York Life Insurance Company"
replace coupon_hold_temp="6" if cname_hold_orig=="FORTY-SECOXD STREET MANHATTANSVTLLE AND ST NICHOLAS AVENUE" & book_year_hold==1911 & invname_hold_orig=="Central Trust Company"
replace coupon_hold_temp="6" if cname_hold_orig=="NESSEX WATER COMPANY, Series" & book_year_hold==1908 & invname_hold_orig=="Pennsylvania Trust Company"
replace coupon_hold_temp="5/6" if cname_hold_temp=="richmond and danville" & invname_hold_orig=="Eutaw Savings Bank" & book_year_hold==1913
replace maturity_year_hold="1927/1915" if cname_hold_temp=="richmond and danville" & invname_hold_orig=="Eutaw Savings Bank" & book_year_hold==1913


saveold Holdings_Data_Issue_temp.dta, replace

replace coupon_hold_temp="2-5" if cname_hold_orig=="ST LOUIS ELECTRIC TERMINAL" & invname_hold_orig=="Sun Life Assurance Company of Canada" & maturity_year_hold=="1929" & par_value_clean_hold==1724000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="3.5&4&6" if cname_hold_orig=="CHICAGO, BURLINGTON AND QUINCY" & invname_hold_orig=="Bowery Savings Bank" & maturity_year_hold=="N/A" & par_value_clean_hold==2352000 & stock_type_hold=="N/A" & class_hold=="Various"
replace coupon_hold_temp="4" if cname_hold_orig=="WISCONSIN CENTRAL" & invname_hold_orig=="Franklin Trust Company" & maturity_year_hold=="1949" & par_value_clean_hold==100000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4&5" if cname_hold_orig=="GAS COMPANY OF MONTGOMERY COUNTY" & invname_hold_orig=="Pennsylvania Trust Company" & maturity_year_hold=="1962" & par_value_clean_hold==8000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4&5" if cname_hold_orig=="PHILADELPHIA AND EASTON ELECTRIC" & invname_hold_orig=="Excelsior Trust & Savings Fund Company" & maturity_year_hold=="1927" & par_value_clean_hold==16000 & stock_type_hold=="N/A" & class_hold=="N/A"
replace coupon_hold_temp="4.5&7" if cname_hold_orig=="DELAWARE, LACKAWANNA AND WESTERN* SYSTEM" & invname_hold_orig=="Broadway Savings Institution" & maturity_year_hold=="N/A" & par_value_clean_hold==319368 & stock_type_hold=="N/A" & class_hold=="Bonds."



















/*


sort co coupon_hold_temp cname_hold_orig book_year_hold
drop if industry=="Government"
duplicates drop cname_hold_temp coupon_hold book_year_hold maturity_year_hold class_hold, force
duplicates tag coupon_hold_temp, gen(co)

duplicates drop coupon_hold_temp, force
browse coupon_hold_temp cname_hold_orig invname_hold_orig book_year_hold coupon_hold_temp maturity_year_hold par_value_clean_hold stock_type_hold class_hold industry if co<10
