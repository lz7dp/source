import pandas as pd
from sklearn.datasets import load_wine
from sklearn.preprocessing import StandardScaler
import numpy as np
import matplotlib.pyplot as plt
data = load_wine()
wine = pd.DataFrame(data.data, columns=data.feature_names)

X = wine 

scale = StandardScaler()
scale.fit(X)
X_scaled = scale.transform(X)


from sklearn.cluster import KMeans
# calculate distortion for a range of number of cluster
inertia = []
for i in np.arange(1, 11):
    km = KMeans(
        n_clusters=i 
        )
    km.fit(X_scaled) 
    inertia.append(km.inertia_)
plt.plot(np.arange(1, 11), inertia, marker='o')
plt.xlabel('Number of clusters')
plt.ylabel('Inertia')
plt.title("all features")
plt.savefig("plot.png")
plt.show()

#####################

k_opt = 3
kmeans = KMeans(k_opt)
kmeans.fit(X_scaled)
y_pred = kmeans.predict(X_scaled)
print(y_pred)