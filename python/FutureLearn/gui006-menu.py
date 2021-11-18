from guizero import App, MenuBar

# These are the functions that are called by selecting options from each submenu
def file_function():
    print("File option")

def edit_function():
    print("Edit option")

app = App()

menubar = MenuBar(app,
                  # These are the menu options
                  toplevel=["File", "Edit"],
                  # The options are recorded in a nested lists, one list for each menu option
                  # Each option is a list containing a name and a function
                  options=[
                      [ ["File option 1", file_function], ["File option 2", file_function] ],
                      [ ["Edit option 1", edit_function], ["Edit option 2", edit_function] ]
                  ])
app.display()