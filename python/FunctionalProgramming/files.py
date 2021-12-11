try:
  f = open("/usercode/files/books.txt")
  cont = f.read()
  print(cont)
finally:
 f.close()


### 
with open("/usercode/files/books.txt") as f:
  print(f.read())

###
file = open("newfile.txt", "w")
file.write("This has been written to a file")
file.close()

file = open("newfile.txt", "r")
print(file.read())
file.close()

###

file = open("/usercode/files/books.txt", "a")

file.write("\nThe Da Vinci Code")
file.close()

file = open("/usercode/files/books.txt", "r")
print(file.read())
file.close()

###

msg = "Hello world!"
file = open("newfile.txt", "w")
amount_written = file.write(msg)
print(amount_written)
file.close()