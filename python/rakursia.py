
def matryoshka(n):
    if n == 1:
        print("Matryoshechka")
    else:
        print("Down Matryoshka n=", n)
        matryoshka(n-1)
        print("Up matryoshki n=", n)

matryoshka(5)
