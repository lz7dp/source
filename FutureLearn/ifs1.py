phrase = input("Talk to me > ")
if phrase == "hi" or phrase == "hey":
    print("hello")
elif phrase == "whats your name" or phrase == “what’s your name”:
    print("Marvin")
else:
    print("sorry I don't understand this '" + phrase + "'")
print("bye")