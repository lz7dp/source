from guizero import App, TextBox, PushButton, Box, Combo, CheckBox, Slider

def open_file():
    with open(file_name.value, "r") as f:
        editor.value = f.read()

def save_file():
    with open(file_name.value, "w") as f:
        f.write(editor.value)
    # Disable the save_button
    save_button.disable()


def change_font():
    editor.font = font.value

def change_text_size():
    editor.text_size = size.value
    editor.resize(1, 1)
    editor.resize("fill", "fill")

def enable_save():
	save_button.enable()

app = App(title="textzero")

file_controls = Box(app, align="top", width="fill", border=True)
file_name = TextBox(file_controls, text="text_file.txt", width=50, align="right")
save_button = PushButton(file_controls, text="Save", command=save_file, align="left")
open_button = PushButton(file_controls, text="Open", command=open_file, align="left")

preferences_controls = Box(app, align="top", width="fill", border=True)
font = Combo(preferences_controls, options=["courier", "times new roman", "verdana"], align="left", command=change_font)
size = Slider(preferences_controls,  align="left", start = 8, end = 42, command=change_text_size)

editor = TextBox(app, multiline=True, height="fill", width="fill", command=enable_save)

app.display()