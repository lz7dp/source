from tkinter import *

from tkinter import Menu

def do_something1():
    print("menu1-new11")
    lbl1 = Label(text= 'label1')
    lbl1.grid(column=0, row=0)

window = Tk()

window.title("Welcome to LikeGeeks app")

menu = Menu(window)

new_item1 = Menu(menu)
new_item2 = Menu(menu)
new_item3 = Menu(menu)

new_item1.add_command(label='New11', command=do_something1)
new_item1.add_command(label='New12')
new_item1.add_command(label='New13')

new_item2.add_command(label='New21')

new_item3.add_command(label='New3')

menu.add_cascade(label='File', menu=new_item1)
menu.add_cascade(label='Edit', menu=new_item2)
menu.add_cascade(label='Tools', menu=new_item3)

window.config(menu=menu)

window.mainloop()
