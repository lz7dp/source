from guizero import App, TextBox, PushButton, Text, info

app = App()

def btn_go_clicked():
    info("Greetings","Hello, " + txt_name.value + " - I hope you're having a nice day")

lbl_name = Text(app, text="Hello. What's your name?")
txt_name = TextBox(app)
btn_go = PushButton(app, command=btn_go_clicked, text="Done")

app.display()