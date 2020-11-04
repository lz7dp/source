def find(number, A):
    """ search for number in A return True if found
        False if not found
    """
    
    flag = False
    for x in A:
        if number == x:
            flag = True
            break
    return flag

def generate_permutations(N:int, M:int=-1, prefix=None):
    """ generation all with N digits in M positions
        with prefix = prefix
    """
    M = N if M == -1 else M
    prefix = prefix or []
    if M == 0:
#       print(prefix)
#       print(*prefix)
        print("")
        for i in range(0, N):
            print(prefix[i], end="")
        return

    for number in range(1, N+1):
        if find(number, prefix):
            continue
        prefix.append(number)
        generate_permutations(N, M-1, prefix)
        prefix.pop()


generate_permutations(4)



