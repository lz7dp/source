
def traj_num(n):
    """ traektoria na skachach - moje da skacha na +1 ili +2 pozicii samo napred
    """

    N = n
    K = [0, 1] + [0]*N
    for i in range(2, N+1):
        K[i] = K[i-2] + K[i-1]
    return K[N]

def count_trajectories(N, Allowed:list):
    K = [0,1, int(allowed[2])] + [0]*(N-3)  # None or 0
    for i in range(3, N+1):
        if allowed[i]:
            K[i] = K[i-1] + K[i-2] + K[i-3]

print(traj_num(20))

