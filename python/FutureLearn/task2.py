from guizero import App, TextBox, PushButton, Text, info
app = App(title="Login")

def btn_result():
    info("Result","Hello, " + input_box1.value + " you have got a " + input_box2.value)

def btn_login():
    if txt_password1.value == txt_password2.value:
        info("Login","Wellcome!")
    else:
        info("Login failed","Login failed!")

lbl_password1 = Text(app, "password:")
txt_password1 = TextBox(app)
lbl_password2 = Text(app, "match password:")
txt_password2 = TextBox(app)
btn_login = PushButton(app, command=btn_login, text="Logon")

message1 = Text(app, text="Please, fill information:")
input_box1 = TextBox(app, text="Your name", width=20,)
input_box2 = TextBox(app, text="Your pet", width=20,)
btn_result = PushButton(app, command=btn_result, text="Enter")

app.display()