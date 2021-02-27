print("Hi, I am Marvin, your personal bot.")
finished = False
while finished == False:
    command = input("How can I help? ")
    if command == "add":
        print("lets add some numbers")
        input1 = input("Number 1> ")
        input2 = input("Number 2> ")
        number1 = int(input1)
        number2 = int(input2)
        result = number1 + number2
        output = str(result)
        print(input1 + " + " + input2 + " = " + output)
    elif command == "subtract":
        print("lets subtract some numbers")
        input1 = input("Number 1> ")
        input2 = input("Number 2> ")
        number1 = int(input1)
        number2 = int(input2)
        result = number1 - number2
        output = str(result)
        print(input1 + " - " + input2 + " = " + output)
    elif command == "divide":
        print("lets subtract some numbers")
        input1 = input("Number 1> ")
        input2 = input("Number 2> ")
        number1 = int(input1)
        number2 = int(input2)
        result = number1 / number2
        output = str(result)
        print(input1 + " / " + input2 + " = " + output)
    elif command == "multiply":
        print("lets subtract some numbers")
        input1 = input("Number 1> ")
        input2 = input("Number 2> ")
        number1 = int(input1)
        number2 = int(input2)
        result = number1 * number2
        output = str(result)
        print(input1 + " * " + input2 + " = " + output)
    elif command == "average":
        how_many = input("How many numbers> ")
        how_many = int(how_many)
        total = 0
        for number_count in range(how_many):
            number = input("Enter number " + str(number_count) + "> ")
            total = total + int(number)
        result = total / how_many
        print("the average = " + str(result))
    elif command == "shopping":
        shopping = []
        how_many = input("how many items of shopping do you have? ")
        how_many = int(how_many)
        for item_number in range(how_many):
            item = input("what is item number " + str(item_number) + "? ")
            shopping.append(item)
        print(shopping)
        print("you have", how_many, "items in your shopping list")

        for number in range(how_many):
            print(shopping[number])
    elif command == "bye":
        finished = True
    else:
        print("sorry I dont understand")