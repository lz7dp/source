from guizero import App, Text, ButtonGroup, Combo, PushButton, TextBox, CheckBox

import time
app = App(title = "Hero-O-Matic", width = 300)

def make_hero_name():
    lbl_output.value = "You are " + cmb_adjective.value + " with " + text_colour.value + " " + cmb_animal.value + " and " + choice.value


message1 = Text(app, text="Choose an adjective")
cmb_adjective = Combo(app, options= ["Amazing", "Wonderful", "Charming", "Delightful"], selected="Amazing")

message2 = Text(app, text="Enter a colour")
text_colour = TextBox(app)

message3 = Text(app, text="Pick an animal")
cmb_animal = Combo(app, options= ["Ardvaark", "Bird", "Dog", "Cat", "Badger", "Dolphin"], selected = "Ardvaark")

message4 = Text(app, text="Tick superpower(s)")
choice = ButtonGroup(app, options=["Invisability", "Super Strength", "Lazer Eyes", "Mega Speed"])

btn_make_name = PushButton(app, text="Make me a super hero!", command=make_hero_name)
lbl_output = Text(app, text="A hero's name will appear here:")


app.display()