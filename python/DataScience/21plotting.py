import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

presidents_df = pd.read_csv('president_heights_party.csv', index_col='name')
plt.scatter(presidents_df['height'], presidents_df['age'])
plt.savefig("plot.png")
plt.show()

plt.scatter(presidents_df['height'], presidents_df['age'],
   marker='<',
   color='b')
plt.xlabel('height'); 
plt.ylabel('age')
plt.title('U.S. presidents')
plt.savefig("plot.png")
plt.show()

presidents_df.plot(kind = 'scatter', 
  x = 'height', 
  y = 'age',
  title = 'U.S. presidents')
plt.savefig("plot.png")
plt.show()

presidents_df['height'].plot(kind='hist',
  title = 'height',
  bins=5)
plt.savefig("plot.png")
plt.show()

plt.hist(presidents_df['height'], bins=5)
plt.savefig("plot.png")
plt.show()

print(presidents_df['height'].describe())

plt.style.use('classic')
presidents_df.boxplot(column='height');
plt.savefig("plot.png")
plt.show()

party_cnt = presidents_df['party'].value_counts()
plt.style.use('ggplot')
party_cnt.plot(kind ='bar')
plt.savefig("plot.png")
plt.show()