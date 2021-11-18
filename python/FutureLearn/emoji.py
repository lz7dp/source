import os
from random import shuffle
from guizero import App, Box, Picture, PushButton

# set the path to the emoji folder on your computer
emojis_dir = "emojis"
# create a list of the locations of the emoji images
emojis = [os.path.join(emojis_dir, f) for f in os.listdir(emojis_dir) if os.path.isfile(os.path.join(emojis_dir, f))]
# shuffle the emojis
shuffle(emojis)

# setup the app
app = App("emoji match")

# create a box to house the grids
game_box = Box(app)
# create a box to house the pictures
pictures_box = Box(game_box, layout="grid")
# create a box to house the buttons
buttons_box = Box(game_box, layout="grid")

# create the an empty lists to add the buttons and pictures to
buttons = []
pictures = []
# create 9 PushButtons with a different grid coordinate and add to the list
for x in range(0,3):
    for y in range(0,3):
        # put the pictures and buttons into the lists
        picture = Picture(pictures_box, grid=[x,y])
        pictures.append(picture)

        button = PushButton(buttons_box, grid=[x,y])
        buttons.append(button)

# for each picture and button in the list assign an emoji to its image feature
for picture in pictures:
    # make the picture a random emoji
    picture.image = emojis.pop()

for button in buttons:
	  # make the image feature of the PushButton a random emoji
	  button.image = emojis.pop()

# import the randint function
from random import randint

# choose a new emoji
matched_emoji = emojis.pop()

# select a number at random
random_picture = randint(0,8)
# change the image feature of the Picture with this index in the list of pictures to the new emoji
pictures[random_picture].image = matched_emoji

random_button = randint(0,8)
# change the image feature of the PushButton with this index in the list of buttons to the new emoji
buttons[random_button].image = matched_emoji


app.display()