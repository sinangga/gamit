#!/bin/bash

# Script running BASELINE GPS Process using GAMIT

expt=sept
cd /home/sinangga/projectGAMIT/$expt
for (( i=244; i<=273; i++ ))
do
cd $i
cp z* *a.$i ../met/.
cd ../met
sh_metutil -f o$expt*.$i -z zcpon1.$i -i 3600
sed -i '1,4d' met_cpon.21$i
sed -i '25d' met_cpon.21$i
sh_metutil -f o$expt*.$i -z zcbas1.$i -i 3600
sed -i '1,4d' met_cbas.21$i
sed -i '25d' met_cbas.21$i
sh_metutil -f o$expt*.$i -z zcktp1.$i -i 3600
sed -i '1,4d' met_cktp.21$i
sed -i '25d' met_cktp.21$i
sh_metutil -f o$expt*.$i -z zcput1.$i -i 3600
sed -i '1,4d' met_cput.21$i
sed -i '25d' met_cput.21$i
rm *.log
cd ..
done
