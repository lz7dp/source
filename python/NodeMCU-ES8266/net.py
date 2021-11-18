import network

def connect2(myssid, mypass):
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    if not wlan.isconnected():
        wlan.connect(myssid, mypass)
        while not wlan.isconnected():
            pass
    print('network config:', wlan.ifconfig())

