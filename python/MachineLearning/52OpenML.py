from sklearn.datasets import fetch_openml

X, y = fetch_openml('mnist_784', version=1, return_X_y=True)

print(X.shape, y.shape)

print(np.min(X), np.max(X))

print(y[0:5])

""" Output:
(70000, 784) (70000,)

0.0 255.0

['5' '0' '4' '1' '9'] """

mlp=MLPClassifier(

  hidden_layer_sizes=(6,), 

  max_iter=200, alpha=1e-4,

  solver='sgd', random_state=2)



mlp.fit(X5, y5)

#############################

MLPClassifier Coefficients 
print(mlp.coefs_)

print(len(mlp.coefs_))

print(mlp.coefs_[0].shape)


#######################################3

