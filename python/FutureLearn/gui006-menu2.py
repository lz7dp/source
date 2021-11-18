# Don't forget to add Menubar to list of imports
from guizero import App, TextBox, PushButton, Box, Combo, CheckBox, Slider, MenuBar

def open_file():
    with open(file_name.value, "r") as f:
        editor.value = f.read()

def save_file():
    with open(file_name.value, "w") as f:
        f.write(editor.value)
        save_button.disable()

def enable_save():
    save_button.enable()

# A new function that closes the app
def exit_app():
    app.destroy()

# This is where any additional functions needed to run your script go

app = App(title="textzero")

# The new MenuBar
menubar = MenuBar(app,
                  toplevel=["File", "Find"],
                  options=[
                  [["open",open_file],["save",save_file],["exit",exit_app]],
                  [["Find",open_file]]
                  ])

file_controls = Box(app, align="top", width="fill", border=True)
file_name = TextBox(file_controls, text="text_file.txt", width=50, align="left")

save_button = PushButton(file_controls, text="Save", command=save_file, align="right")
open_button = PushButton(file_controls, text="Open", command=open_file, align="right")

editor = TextBox(app, multiline=True, height="fill", width="fill", command=enable_save)

# This is where your additional features go

app.display()