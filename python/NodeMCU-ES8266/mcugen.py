from random import choice
#import time

sl = 8  #start length
ml = 9  #max length
list = '9876543210' # list
g = 0
tries = 0

file = open("numfile.txt",'w') #your file

for j in range(0,len(list)**4):
    while sl <= ml:
        i = 0
        while i < sl:
            file.write(choice(list))
            i += 1
#            time.sleep(.01)
        sl += 1
        file.write('\n')
        g += 1
    sl -= g
    g = 0
    print(tries)
    tries += 1


file.close()

