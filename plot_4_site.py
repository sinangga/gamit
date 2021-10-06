import matplotlib.pyplot as plt
import pandas as pd

data1=pd.read_excel('hasilcput.xlsx', 'hasilcput')
data2=pd.read_excel('hasilcpon.xlsx', 'hasilcpon')
data3=pd.read_excel('hasilcktp.xlsx', 'hasilcktp')
data4=pd.read_excel('hasilcbas.xlsx', 'hasilcbas')


plt.subplot(4,1,1)
plt.plot(data1['hari'], data1['PW(mm)'], 'r', label='Putussibau')
plt.title('PWV September 2021')
plt.ylabel('PWV (mm)')
plt.legend(loc='upper left', frameon=False)

plt.subplot(4,1,2)
plt.plot(data2['hari'], data2['PW(mm)'], 'y', label='Pontianak')
plt.ylabel('PWV (mm)')
plt.legend(loc='upper left', frameon=False)

plt.subplot(4,1,3)
plt.plot(data3['hari'], data3['PW(mm)'], 'g', label='Ketapang')
plt.ylabel('PWV (mm)')
plt.legend(loc='upper left', frameon=False)

plt.subplot(4,1,4)
plt.plot(data4['hari'], data4['PW(mm)'], 'b', label='Paloh')
plt.xlabel('Tanggal')
plt.ylabel('PWV (mm)')
plt.legend(loc='upper left', frameon=False)

plt.show()
