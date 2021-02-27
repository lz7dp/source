from guizero import App, Text, ButtonGroup, Combo, PushButton, TextBox, Box
app = App(title="Hero-o-matic", width=300, bg="red")

message1 = Text(app, text="Choose an adjective")
bgp_adjective = ButtonGroup(app, options=["Amazing", "Bonny", "Charming", "Delightful"], selected="Amazing")

message2 = Text(app, text="Choose a colour")
txt_colour = TextBox(app)
message2.text_color = "blue"

message3 = Text(app, text="Pick an animal")
cmb_animal = Combo(app, options=["Aardvark", "Badger", "Cat", "Dolphin", "Velociraptor"], selected="Aardvark", width=20)

# create a box
box = Box(app)

# modify each widget so it is now housed in the box
btn_make_name = PushButton(box, text='Make me a hero')
lbl_output = Text(box, text="Your hero name will appear here")

# now change the properties of the box
box.bg = "white"
box.text_size = 12

app.display()


app.display()