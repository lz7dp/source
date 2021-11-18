def invert_array(A:list, N:int):
    """ array from 0 to N-1
        return index elem. X from array A or -1 if not.
    """

    for x in range(N//2):
        A[x],A[(N-1-x)] = A[(N-1-x)], A[x]
    print(A)
    

def test_invert_array():
    A1 = [1, 2, 3, 4, 5]
    invert_array(A1,5)
    if A1 == [5, 4, 3, 2, 1]:
        print("#test1 - ok")
    else:
        print("#test1 - fail")
        

    A2 = [0, 0, 0, 0, 0, 0, 0, 10]
    invert_array(A2,8)
    if A2 == [10, 0, 0, 0, 0, 0, 0, 0]:
        print("#test2 - ok")
    else:
        print("#test2 - fail")

test_invert_array()
