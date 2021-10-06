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

mkdir /home/$uname/projectGAMIT
mkdir /home/$uname/projectGAMIT/$expt

cd /home/$uname/projectGAMIT/$expt
mkdir rinex met brdc igs

sh_update_eop -series usno

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
#	sh_gamit -s $yr $doy $doy2 -met -orbit igsf -expt $expt -press ELEV

### untuk IGSR (tambahan -ion igrg dan igsg)
	sh_gamit -s $yr $doy $doy2 -met -expt $expt -press ELEV
	echo -e $White'================================================================================'
	echo -e $Yellow 'PASTIKAN TIDAK ADA FATAL ERROR !!!'
	echo -e $Cyan 'BASELINE GPS PROCESS FINISH'
	echo -e $White'================================================================================'
	read -p 'PROSES EKSTRAKSI PWV... ENTER' enter2;
	read -p 'INTERVAL PWV DALAM DETIK		: ' int;
	read -p 'NAMA SITE1 YANG AKAN DIEKSTRAK	: ' site1;
	read -p 'NAMA SITE2 YANG AKAN DIEKSTRAK	: ' site2;
	read -p 'NAMA SITE3 YANG AKAN DIEKSTRAK	: ' site3;
	read -p 'NAMA SITE4 YANG AKAN DIEKSTRAK	: ' site4;
	
	for i in $(seq $doy $doy2)
	do
	cd /home/$uname/projectGAMIT/$expt/$i
	cp z*.$i /home/$uname/projectGAMIT/$expt/met/
	cp o$expt*a.$i /home/$uname/projectGAMIT/$expt/met/
	cd ../met
	sh_metutil -f o*a.$i -m $site1*$i*m -i $int
	sh_metutil -f o*a.$i -m $site2*$i*m -i $int	
	sh_metutil -f o*a.$i -m $site3*$i*m -i $int	
	sh_metutil -f o*a.$i -m $site4*$i*m -i $int	
	done
else
### untuk IGSF
#	sh_gamit -d $yr $doy -met -orbit igsf -expt $expt -press ELEV

### untuk IGSR (tambahan -ion igrg dan igsg)
	sh_gamit -d $yr $doy -met -ion codg -expt $expt -press ELEV
	echo -e $White'================================================================================'
	echo -e $Yellow 'PASTIKAN TIDAK ADA FATAL ERROR !!!'
	echo -e $Cyan 'BASELINE GPS PROCESS FINISH'
	echo -e $White'================================================================================'
	read -p 'PROSES EKSTRAKSI PWV... ENTER' enter2;
	read -p 'INTERVAL PWV DALAM DETIK		: ' int;
	read -p 'NAMA SITE1 YANG AKAN DIEKSTRAK	: ' site1;
	read -p 'NAMA SITE2 YANG AKAN DIEKSTRAK	: ' site2;
	read -p 'NAMA SITE3 YANG AKAN DIEKSTRAK	: ' site3;
	read -p 'NAMA SITE4 YANG AKAN DIEKSTRAK	: ' site4;
	cd /home/$uname/projectGAMIT/$expt/$doy
	cp z*.$doy /home/$uname/projectGAMIT/$expt/met/
	cp o$expt*.$doy /home/$uname/projectGAMIT/$expt/met/
	cd ../met
	sh_metutil -f o*a.$doy -m $site1*m -i $int
	sh_metutil -f o*a.$doy -m $site2*m -i $int	
	sh_metutil -f o*a.$doy -m $site3*m -i $int	
	sh_metutil -f o*a.$doy -m $site4*m -i $int	
fi

echo -e $White'================================================================================'
echo -e $Yellow 'PASTIKAN TIDAK ADA FATAL ERROR !!!'
echo -e $Cyan 'EKSTRAKSI PWV FINISH'
echo -e $White'================================================================================'
ls -l met_*
echo -e $White'================================================================================'
echo -e $Blue 'FILE PWV DENGAN NAMA SEPERTI LIST DI ATAS'
echo -e $White'================================================================================'
