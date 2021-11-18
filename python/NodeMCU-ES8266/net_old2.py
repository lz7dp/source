def do_connect():
    import network
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        print('connecting to network...')
        wlan.connect('', '')
        while not wlan.isconnected():
            pass
    print('network config:', wlan.ifconfig())
    
def my_scan():
    import network
    sta_if = network.WLAN(network.STA_IF); sta_if.active(True)
    print(sta_if.scan())
    
def brute(myssid, mypass):
    import time
    import network
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
    