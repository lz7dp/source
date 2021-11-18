import matplotlib.pyplot as plot
print("matplotlib imported")


# Deal with input
print("Loading high scores")
scores = []
names = []

try:
    with open("highscores.txt", "r") as f:
        for line in f:
            line = line.strip("\n")
            line = line.split(" ")
            names.append(line[0])
            scores.append(int(line[1]))
        plot.bar(names, scores)
        plot.title("Maths game high scores")
        plot.ylabel("Score")
        plot.xlabel("Player")
        plot.show()
            
except FileNotFoundError:
    print("No high scores file found")
    
while True:

    # display the highscores
    print("Highscores")
    for pos in range(len(names)):
        print(pos + 1, names[pos], scores[pos])

    score = 0
    print("Welcome to the Maths Quiz")
    print("Can you answer three questions and score maximum points?")
    name = input("Whats your name? ")
    
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

    # add the new score to the highscores
    position = 0
    for compare_score in scores:
        if score < compare_score:
            position = position + 1
    scores.insert(position, score)
    names.insert(position, name)

    scores = scores[:10]
    names = names[:10]

    # output the new highscore
    print("Saving highscores")
    with open("highscores.txt", 'w') as f:
        for pos in range(len(names)):
            f.write(names[pos] + " " + str(scores[pos]) + "\n")

            
