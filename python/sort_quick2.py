# qsort lambda algorythm  

qsort = lambda l: l if len(l) <= 1 else qsort([x for x in l[1:] if x < l[0]]) + [l[0]] + qsort([x for x in l[1:] if x>= l[0]])

print(qsort([17, 29, 11, 97, 103, 5]))

