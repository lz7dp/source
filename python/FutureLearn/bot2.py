def do_calculation():
    print("lets " +command+ " some numbers")
    input1 = input("Number 1> ")
    input2 = input("Number 2> ")
    number1 = int(input1)
    number2 = int(input2)

    if command == "add":
        result = number1 + number2
        operator ="+"


    elif command == "subtract":
        result = number1 - number2
        operator = "-"

    elif command == "multiply":
        result = number1 * number2
        operator = "*"


    elif command == "divide":
        result = number1 / number2
        operator = "/"
    output = str(result)
    print(input1 + operator + input2 + " = " + output)

def find_average():
    how_many = input("How many numbers> ")
    how_many = int(how_many)
    total = 0
    for number_count in range(how_many):
        number = input("Enter number " + str(number_count) + "> ")
        total = total + int(number)
        result = total / how_many
    print("the average = " + str(result))

def find_total():
    how_many = input("How many numbers> ")
    how_many = int(how_many)
    total = 0
    for number_count in range(how_many):
        number = input("Enter number " + str(number_count) + "> ")
        total = total + int(number)
        result = total
    print("the total = " + str(result))

finished = False
while finished == False:
    print("Hi, I am Marvin, your personal bot.")
    command = input("How can I help? ")
    if command == "add":
        do_calculation()
    elif command == "subtract":
        do_calculation()
    elif command == "multiply":
        do_calculation()
    elif command == "divide":
        do_calculation()
    elif command == "average":
        find_average()
    elif command == "total":
        find_total()
    elif command == "bye":
        finished = True
    else:
        print("sorry I dont understand")