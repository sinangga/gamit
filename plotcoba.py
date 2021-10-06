import matplotlib.pyplot as plt
import pandas as pd

data=pd.read_excel('met_bako.xlsx', 'met_bako.18327')
plt.plot(data['t'], data['pwv'])
plt.xlabel('JAM (UTC)')
plt.ylabel('PWV (mm)')
plt.title('PWV BAKO 23 November 2018')
plt.legend()
plt.show()
