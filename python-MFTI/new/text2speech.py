import os
from gtts import gTTS
text = 'Welcome to python!'

lang = 'en'

myobj = gTTS(text=text, lang=lang, slow=False)
myobj.save("audio.mp3")

os.system("audio.mp3")
