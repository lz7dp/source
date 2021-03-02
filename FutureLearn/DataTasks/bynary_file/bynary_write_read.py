### write
data = [100,24,255]
print(data)

buffer = bytes(data)
print(buffer)

f = open("binary.txt", "bw")

f.write(buffer)
f.close()

### read
f = open("binary.txt", "br")

binary = f.read()
print(binary)

data = list(binary)
print(data)

f.close()
