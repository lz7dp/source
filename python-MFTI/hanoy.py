def move(n, start, finish):
    if n == 1:
        print(n, start, finish)
    else:
        tmp = 6 - start - finish
        move(n-1, start, tmp)
        print(n, start, finish)
        move(n-1, tmp, finish)
n = int(input())
move(n, 1, 3)
