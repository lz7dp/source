def equal(A,B):
    if len(A) != len(B):
        return False
    for i in range(len(A)):
        if A[i] != B[i]:
            return False
    return True

A = "mliako"
B = "malko"
print (equal(A,B))

