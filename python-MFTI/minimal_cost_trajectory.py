def count_min_cost(N, price:list):
    """ found minimal cost trajectory between all trajectories
        in only 2 variant jumps - +1 and +2
    """

    C = [float("-inf"), price[1], price[1] + price[2]] + [0]*(N-2)
    for i in range(3, N+1):
        C[i] = price[i] + min(C[i-1], C[i-2])
    return C[N]

x = 9
B = [2, 1, 2, 1, 2, 1, 2, 1, 2, 1]
print(count_min_cost(x, B))
