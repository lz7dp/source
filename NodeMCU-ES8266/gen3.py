import itertools

characters = "ABCDE"
length = 5
done = False

while True:
    def pw_guess():
        res = itertools.permutations('ABCDE' ,5)
        for guess in res:
            yield guess

    #Make generator object
    guess_generator = pw_guess()

    for guess in guess_generator:
         if guess == ('A', 'B', 'C', 'D', 'E'):
            print()
            print("Password acquired: " + str(guess))
            done = True
            break
    if done:
        break
