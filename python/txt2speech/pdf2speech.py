import pyttsx3
import PyPDF2

path = open('python4everybody.pdf', 'rb')
pdfReader = PyPDF2.PdfFileReader(path)

for i in range(0, 244):
    from_page = pdfReader.getPage(i)
    text = from_page.extractText()
    speak = pyttsx3.init()
    speak.say(text)
    speak.runAndWait()



