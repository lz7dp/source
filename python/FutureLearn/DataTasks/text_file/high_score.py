highscore = 0

with open("highscore.txt", "r") as f:
    highscore = f.read()
    highscore = int(highscore)
    print("The high score is",highscore)
    score = highscore
    
while True:
    print("Welcome to the Maths Quiz")
    print("Can you answer a questions and score maximum points?")
    print("Question 1: What is the product of 2x2x2?")

    answer = int(input("Your answer :>> "))

    if answer == 8:
        print("Correct")
        score = score + 1
        print("Your score is", score)
    else:
        print("Incorrect, the answer is 8")
        print("Your score is", score)

    if score > highscore:
        highscore = score
        print("You have set a new high score")
        with open("highscore.txt", "w") as f:
            f.write(str(highscore))
    else:
        print("Better luck next time")
