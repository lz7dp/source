
f = open("names.txt","r")

## data = f.read()
## print(data)

for line in f:
    print(line)

f.close()

### second way

with open("names.txt") as f:
    data = f.read()
    print(data)

