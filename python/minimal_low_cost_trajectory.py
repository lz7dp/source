def stoimost(n, Price):
	C = [float('inf'), Price[1]] + [None]*(n-1)
	for i in range(2,n+1):
		C[i] = Price[i] + min(C[i-1], C[i-2])
    return C

def shortest_path(n, Costs):
	path = [n]
	while path[-1] != 1:
		k = path[-1]
		if Costs[k-1] < Costs[k-2]:
			path.append(k-1)
		else:
			path.append(k-2)
	path[:] = path[::-1]
	return path
	
n = int(input())
Price = [None] + [int(x) for x in input().split]
Costs = stoimost(n, Price)
path = shortest_path(n, Costs)
print(path)
