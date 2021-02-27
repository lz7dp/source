from guizero import App, TextBox, PushButton, Text, info

app = App()

def btn_go_clicked():
    info("Greetings","Hello, " + txt_name.value + " - I hope you're having a nice day")

def highlight():
    txt_name.bg = "light blue"

def lowlight():
    txt_name.bg = None

lbl_name = Text(app, text="Hello. What's your name?")
txt_name = TextBox(app)

# when the mouse enters the button
txt_name.when_mouse_enters = highlight

# when the mouse leaves the button
txt_name.when_mouse_leaves = lowlight

btn_go = PushButton(app, command=btn_go_clicked, text="Done")

app.display()