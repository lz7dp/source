from guizero import App, Text, Box

# this time we have not set the layout to auto as it is default
app = App()

# Divide the flag into two sections, a top layer containing the cross and a red block
# and a bottom, red layer.

top = Box(app, align="top", width="fill")
bottom = Box(app, width="fill", height="fill")

# Create a box to contain the cross, aligned left in the top layer.
cross = Box(top, align="left")

# Two boxes are needed to construct the cross.
flag = Box(cross)
# Set the background to white.
flag.bg = "white"
# Make the upper parts of the cross out of four equal sized, red blocks.
first = Text(flag, bg="red", align="top", height=1, width=3)
second = Text(flag, bg="red", align="left", height=1, width=3)
third = Text(flag, bg="red", align="left", height=1, width=3)
fourth = Text(flag, bg="red", align="left", height=1, width=3)
# Create the second box directly below the first, so that the final piece
# of the cross will be added to the bottom of the cross. Try running the
# program without this box to see where it would automatically be placed.
flag_cont = Box(cross)
# Set the background to white
flag_cont.bg = "white"
# Complete the flag
fifth = Text(flag_cont, height=1, width=3, align="bottom", bg="red")

# Fill in the rest of the flag red
fill = Text(top, align="left", height="fill", width="fill", bg="red")
fill_cont = Text(bottom, height="fill", width="fill", bg="red")

app.display()