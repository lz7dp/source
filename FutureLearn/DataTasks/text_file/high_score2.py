### open file
try:
    with open("highscore.txt", "r") as f:
        highscore = f.read()
        highscore = int(highscore)
        print("The highscore is",highscore)

except FileNotFoundError:
    print("Creating a new highscore.txt file")
    f = open("highscore.txt", "w")
    f.write("0")
    f.close()
    highscore = 0

### game
while True:
    score = 0
    print("Welcome to the Maths Quiz")
    print("Can you answer three questions and score maximum points?")
    
    print("Question 1: What is the product of 2x2x2?")
    answer = int(input("Your answer :>> "))
    if answer == 8:
        print("Correct")
        score = score + 1
    else:
        print("Incorrect, the answer is 8")

    print("Question 2: On a clock face what is the size of the angle that the second hand turns in one second?")
    answer = int(input("Your answer :>> "))
    if answer == 6:
        print("Correct")
        score = score + 1
    else:
        print("Incorrect, the answer is 6 degrees")

    print("Question 3: What is the quotient and remainder for 8 / 3?")
    print("Please format your answer as quotient and remainder, for example the answer to 23/5 is 4r3")
    answer = input("Your answer :>> ")
    if answer == "2r2":
        print("Correct")
        score = score + 1
    else:
        print("Incorrect, the answer is 2r2")

    print("Your score is", score)

    if score > highscore:
        highscore = score
        print("You have set a new highscore")
        with open("highscore.txt", "w") as f:
            f.write(str(highscore))
    else:
        print("Better luck next time")
    
    print("The highscore is",highscore)

    
