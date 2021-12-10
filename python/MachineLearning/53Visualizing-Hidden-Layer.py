fig, axes = plt.subplots(2, 3, figsize=(5, 4))

for i, ax in enumerate(axes.ravel()):

    coef = mlp.coefs_[0][:, i]

    ax.matshow(coef.reshape(28, 28), cmap=plt.cm.gray)

    ax.set_xticks(())

    ax.set_yticks(())

    ax.set_title(i + 1)

plt.show()