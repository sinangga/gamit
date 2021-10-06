import matplotlib.pyplot as plt
import pandas as pd
site = raw_input("Site = ")
data1=pd.read_excel('HASIL.xlsx', 'Sheet1')

plt.plot(data1['JAM'], data1[site+'364'], 'r', label='364')
plt.plot(data1['JAM'], data1[site+'365'], 'g', label='365')
plt.plot(data1['JAM'], data1[site+'1'], 'b', label='001')

plt.xlabel('JAM (UTC)')
plt.ylabel('PWV (mm)')
plt.title('PWV '+site+' DOY 364 365 001')
plt.legend(loc='lower center', frameon=False, ncol=3)
plt.show()