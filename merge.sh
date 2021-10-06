#!/bin/bash

read -p "EXPT		: " expt;
read -p "SITE		: " site;

cd /home/sinangga/projectGAMIT/$expt/met
cat met_$site.21{244..273} > hasil$site
sed -i '1i\Yr Doy Hr Mn Sec Total_Zen Wet_Zen Sig_Zen PW(mm) Sig_PW(mm) Press_(hPa) Temp_(K) ZHD_(mm) Grad_NS Sig_NS Grad_EW Sig_EW_(mm)' hasil$site
ssconvert hasil$site hasil$site.xlsx
