flag=True
N=int(input())
for i in range(N):
    x=int(input())
    flag=(flag and x%10==0)
print(flag)
