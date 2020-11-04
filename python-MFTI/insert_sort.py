def insert_sort(A):
    """ insert sort A
    """
    N = len(A)
    for top in range(1, N):
        k = top
        while k > 0 and A[k-1] > A[k]:
            A[k], A[k-1] = A[k-1], A[k]
            k -= 1

def choice_sort(A):
    """ choice sort A
    """
    N = len(A)
    for pos in range(0, N-1):
        for k in range(pos+1, N):
            if A[k] < A[pos]:
                A[k], A[pos] = A[pos], A[k]

def bubble_sort(A):
    """ bubble sort A
    """
    N = len(A)
    for bypass in range(1, N):
        for k in range(0, N-bypass):
            if A[k] > A[k+1]:
                A[k], A[k+1] = A[k+1], A[k]

def test_sort(sort_algorithm):
    print("test: ", sort_algorithm.__doc__)
    print("testcase #1: ", end="")
    A = [4, 2, 5, 1, 3]
    A_sorted = [1, 2, 3, 4, 5]
    sort_algorithm(A)
# 1st way:
    if A == A_sorted:
        print("OK")
    else:
        print("Fail")
# 2nd way:
    print("OK" if A == A_sorted else "Fail")

    print("testcase #2: ", end="")
    A = list(range(10, 20)) + list(range(0, 10))
    A_sorted = list(range(20))
    sort_algorithm(A)
# 1st way:
    if A == A_sorted:
        print("OK")
    else:
        print("Fail")
# 2nd way:
    print("OK" if A == A_sorted else "Fail")

    print("testcase #3: ", end="")
    A = [4, 2, 4, 2, 1]
    A_sorted = [1, 2, 2, 4, 4]
    sort_algorithm(A)
# 1st way:
    if A == A_sorted:
        print("OK")
    else:
        print("Fail")
# 2nd way:
    print("OK" if A == A_sorted else "Fail")


if __name__ == "__main__":
    test_sort(insert_sort)
    test_sort(choice_sort)
    test_sort(bubble_sort)
    
