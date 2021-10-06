import matplotlib.pyplot as plt
import pandas as pd
data1=pd.read_excel('hasilcpon.xlsx', 'gps_rason')

plt.plot(data1['hari'], data1['PW(mm)'], 'r', label='GPS')
plt.plot(data1['hari'], data1['rasoon'], 'g', label='RASON')

plt.xlabel('hari')
plt.ylabel('PWV (mm)')
plt.title('Perbandingan PWV GPS dengan RASON Pontianak Bulan Agustus 2021')
plt.legend(loc='lower center', frameon=False, ncol=3)
plt.show()