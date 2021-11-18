import urllib.request

fhand = urllib.request.urlopen('http://www.google.com/robots.txt')
for line in fhand:
    print(line.decode().strip())
