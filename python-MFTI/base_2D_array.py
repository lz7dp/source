# Python program to demonstrate that we 
# can access multidimensional list using 
# square brackets 
a = [ [2, 4, 6, 8 ],  
    [ 1, 3, 5, 7 ],  
    [ 8, 6, 4, 2 ],  
    [ 7, 5, 3, 1 ] ]  
          
for i in range(len(a)) :  
    for j in range(len(a[i])) :  
        print(a[i][j], end=" ") 
    print() 
