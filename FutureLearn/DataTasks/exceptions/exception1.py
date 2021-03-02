try:
    print("Hello!" + 777)
    
except TypeError as error:
    print(type(error))
    print(error)
    print("Oh dear! A string and integer cannot be concatenated")
