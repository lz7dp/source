def hoare_sort(A):
    if len(A) <= 1:
        return
    barrier = A[0]
    L = []
    M = []
    R = []
    for x in A:
        if x < barrier:
            L.append(x)
        elif x == barrier:
            M.append(x)
        else:
            R.append(x)

    hoare_sort(L)
    hoare_sort(R)

    k = 0
    for x in L + M + R:
        A[k] = x
        k += 1

def check_sorted(A, ascending=True):
    """ sort check list A
        O(len(A))
    """
    flag = True
    s = 2*int(ascending)-1
    for i in range(0, len(A)-1):
        if (s*A[i]) > (s*A[i+1]):
            flag = False
            break
    return flag
        
B = [3, 4, 1, 8, 5, 0, 4, 6, 7, 9]
hoare_sort(B)
print(*B)
print(check_sorted(B))



