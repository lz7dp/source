    """ greshka - da se proveri
        i osnovnata funkcia da se opravi
        
def binary_sort(a, key):
    left = -1
    right = len(a)
    
    while right - left > 1:
        middle = (right-left)//2
        print(left, right, middle)
        
        if a[middle] < key:
            left = middle
        else:
            right = middle
        
    return left
        """



def left_bound(A, key):
    left = -1
    right = len(A)
    while (right - left) > 1:
        middle = (left+right)//2
        if A[middle] < key:
            left = middle
        else:
            right = middle
    return left

def right_bound(A, key):
    left = -1
    right = len(A)
    while (right - left) > 1:
        middle = (left+right)//2
        if A[middle] <= key:
            left = middle
        else:
            right = middle
    return right

def bynary_sort(A:list):
    x = len(A)//2    
    left_bound(A, x)
    right_bound(A, x)
    print(*A)
    return

B = [7, 4, 1, 0, 7, 3, 2, 5, 6, 9, 8, 7, 1, 2, 5, 3, 4]

bynary_sort(B)

