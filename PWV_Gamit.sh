#!/bin/bash

# Script running BASELINE GPS Process using GAMIT


echo -e $White'================================================================================'
echo -e $LightCyan' BASELINE GPS PROCESS '
echo -e $White'================================================================================'
echo -e $Black 'Script by. SINANGGA'
echo -e $White'================================================================================'
# echo -e $Black

read -p "Tahun		: " yr;
read -p "DOY1		: " doy;
read -p "DOY2		: " doy2;
#read -p "NDays		: " ndays;
read -p "EXPT		: " expt;
read -p "S / D		: " s;

uname=sinangga
ndays=$doy2-$doy+1
sd="$s"

cd /home/sinangga/.gamit/tables
sh_update_eop -series usno

mkdir /home/$uname/projectGAMIT
mkdir /home/$uname/projectGAMIT/$expt

cd /home/$uname/projectGAMIT/$expt
mkdir rinex met brdc igs

sh_setup -yr $yr -doy $doy

cd tables
echo -e $White'================================================================================'
echo -e $White'================================================================================'
echo -e $Red 'SUNTING FILE SESSION TABLE, DAN LAIN LAIN'
gedit sestbl.
echo -e $White'================================================================================'
echo -e $White'================================================================================'
echo -e $Red 'SUNTING NAMA EXPT ANDA'
gedit sites.defaults
cd ..
echo -e $White'================================================================================'
echo -e $White'================================================================================'
echo -e $Red 'COPY FILE RINEX DAN METEO KE DALAM MASING-MASING FOLDER'
echo -e $White
read -p 'JIKA SUDAH MAKA LANJUTKAN.... ENTER' enter;

#cd brdc
#sh_get_nav -yr $yr -doy $doy -ndays $ndays
#cd ../igs
#sh_get_orbits -orbit igsf -yr $yr -doy $doy1 -ndays $ndays
#cd ../



echo -e $White'================================================================================'
echo -e $LightCyan 'BASELINE GPS PROCESS '
echo -e $White'================================================================================'
if [ "$sd" == "s" ]; then
### untuk IGSF
#	sh_gamit -s $yr $doy $doy2 -met -expt $expt -press ELEV

### untuk IGSR (tambahan -ion igrg dan igsg)
	sh_gamit -s $yr $doy $doy2 -met -orbit igsr -ion corg -expt $expt -press ELEV
	echo -e $White'================================================================================'
	echo -e $Yellow 'PASTIKAN TIDAK ADA FATAL ERROR !!!'
	echo -e $Cyan 'BASELINE GPS PROCESS FINISH'
	echo -e $White'================================================================================'
	read -p 'PROSES SALIN DATA ZTD DAN EKSTRAK PWV....ENTER....(CTRL + C UNTUK MEMBATALKAN)' enter2;
	
	for (( i=$doy; i<=$doy2; i++ ))
	do
	cd $i
	cp z* o$expt*a.$i ../met/.
	cd ../met
	sh_metutil -f o$expt*a.$i -z zcpon1.$i -i 3600
	sed -i '1,4d' met_cpon.21$i
	sed -i '25d' met_cpon.21$i
	sh_metutil -f o$expt*a.$i -z zcbas1.$i -i 3600
	sed -i '1,4d' met_cbas.21$i
	sed -i '25d' met_cbas.21$i
	sh_metutil -f o$expt*a.$i -z zcktp1.$i -i 3600
	sed -i '1,4d' met_cktp.21$i
	sed -i '25d' met_cktp.21$i
	sh_metutil -f o$expt*a.$i -z zcput1.$i -i 3600
	sed -i '1,4d' met_cput.21$i
	sed -i '25d' met_cput.21$i
	rm *.log
	cd ..
	done
	
else

### untuk IGSF
#	sh_gamit -d $yr $doy -met -expt $expt -press ELEV

### untuk IGSR (tambahan -ion igrg dan igsg)
	sh_gamit -d $yr $doy -met -orbit igsr -ion corg -expt $expt -press ELEV
	echo -e $White'================================================================================'
	echo -e $Yellow 'PASTIKAN TIDAK ADA FATAL ERROR !!!'
	echo -e $Cyan 'BASELINE GPS PROCESS FINISH'
	echo -e $White'================================================================================'
	read -p 'PROSES SALIN DATA ZTD DAN EKSTRAK PWV....ENTER....(CTRL + C UNTUK MEMBATALKAN)' enter2;
	
	for (( i=$doy; i<=$doy2; i++ ))
	do
	cd $i
	cp z* o$expt*a.$i ../met/.
	cd ../met
	sh_metutil -f o$expt*a.$i -z zcpon1.$i -i 3600
	sed -i '1,4d' met_cpon.21$i
	sed -i '25d' met_cpon.21$i
	sh_metutil -f o$expt*a.$i -z zcbas1.$i -i 3600
	sed -i '1,4d' met_cbas.21$i
	sed -i '25d' met_cbas.21$i
	sh_metutil -f o$expt*a.$i -z zcktp1.$i -i 3600
	sed -i '1,4d' met_cktp.21$i
	sed -i '25d' met_cktp.21$i
	sh_metutil -f o$expt*a.$i -z zcput1.$i -i 3600
	sed -i '1,4d' met_cput.21$i
	sed -i '25d' met_cput.21$i
	rm *.log
	cd ..
	done
fi

cd met
ls met*
echo -e $White'================================================================================'
echo -e $Blue 'FILE PWV DENGAN NAMA SEPERTI LIST DI ATAS'
echo -e $White'================================================================================'
