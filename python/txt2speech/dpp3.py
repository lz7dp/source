from tkinter import *

from tkinter.ttk import Progressbar

from tkinter import ttk

window = Tk()

window.title("Welcome to LikeGeeks app")

window.geometry('350x200')

for i in range(100):   
    for x in range(1000):
        x += 1        
    style = ttk.Style()
    style.theme_use('default')
    style.configure("black.Horizontal.TProgressbar", background='black')
    bar = Progressbar(window, length=100, style='black.Horizontal.TProgressbar')    
    bar['value'] = i
    bar.grid(column=0, row=0)
    window.mainloop()
window.mainloop() 
x = 0

