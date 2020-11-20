a = [[1, 2, 3, 4], [5, 6], [7, 8, 9]]
for row in a:
    for elem in row:
        print(elem, end=' ')
    print()

for row in a:
    print(' '.join([str(elem) for elem in row]))

s = 0
for i in range(len(a)):
    for j in range(len(a[i])):
        s += a[i][j]
print(s)

s = 0
for row in a:
    for elem in row:
        s += elem
print(s)

n = 3
m = 4
a = [[0] * m] * n
a[0][0] = 5
print(a[0][0])

n = 3
m = 4
a = [[0] * m for i in range(n)]
a[0][0] = 6
print(a[0][0])

# the first line of input is the number of rows of the array
#n = int(input()) 
#a = [[int(j) for j in input().split()] for i in range(n)]

#
n = 4
a = [[0] * n for i in range(n)]
for i in range(n):
    for j in range(n):
        if i < j:
            a[i][j] = 0
        elif i > j:
            a[i][j] = 2
        else:
            a[i][j] = 1
for row in a:
    print(' '.join([str(elem) for elem in row]))

