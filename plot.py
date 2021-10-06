import matplotlib.pyplot as plt
import pandas as pd

data=pd.read_excel('hasilcput.xlsx', '6jam')
plt.plot(data['hari'], data['PW(mm)'])
plt.xlabel('Tanggal')
plt.ylabel('PWV (mm)')
plt.title('PWV Putussibau Bulan Agustus 2021')
plt.legend()
plt.show()