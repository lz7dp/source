### start

import requests
import os

apod_api_request = requests.get("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
apod = apod_api_request.json()
print(apod)

picture_url = apod["url"]
print(picture_url)

os.system("start \"\" {}".format(picture_url))
