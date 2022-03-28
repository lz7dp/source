# importing the module 
from pytube import YouTube 
  
# where to save 
SAVE_PATH = "c:/temp/" #to_do 
  
# link of the video to be downloaded 
# https://www.youtube.com/watch?v=HwnoyF4JKic
link = input('Enter the link: ')
yt = YouTube(link)

try: 
    # object creation using YouTube
    # which was imported in the beginning 
    yt = YouTube(link) 
except: 
    print("Connection Error") #to handle exception 

ys = yt.streams.get_highest_resolution()  
  
# get the video with the extension and
# resolution passed in the get() function 

try: 
    # downloading the video
    print("Downloading...")
    ys.download(SAVE_PATH) 
except: 
    print("Some Error!") 
print('Task Completed!') 
