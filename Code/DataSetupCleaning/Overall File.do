global root_dropbox "D:\Dropbox"
set more off
clear
cd "$root_dropbox\Bond Rating\Code and Data\do"
do Clean_IssuerName_01.do
cd "$root_dropbox\Bond Rating\Code and Data\do_investor_PreClean"
do InvName_Clean_01.do
cd "$root_dropbox\Bond Rating\Code and Data\do_investor_loc"
do State_Clean.do
