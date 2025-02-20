from __future__ import print_function
from datetime import date, datetime, timedelta
import requests
from bs4 import BeautifulSoup
import mysql.connector

cnx = mysql.connector.connect(user='***', password='***',
                              host='127.0.0.1',
                              database='cryptodb')

cursor = cnx.cursor()

todayData = datetime.now().date()
hNow = datetime.now().time()

add_priceBCN = ("INSERT INTO BCN "
              "(price_id, price_date, price_time, price) "
               "VALUES (%s, %s, %s, %s)")

#add_priceBTC = ("INSERT INTO BTC "
#              "(price_id, price_date, price_time, price) "
#               "VALUES (%s, %s, %s, %s)")

add_priceXMR = ("INSERT INTO XMR "
              "(price_id, price_date, price_time, price) "
               "VALUES (%s, %s, %s, %s)")

add_priceTNC = ("INSERT INTO TNC "
              "(price_id, price_date, price_time, price) "
               "VALUES (%s, %s, %s, %s)")

add_priceSTORJ = ("INSERT INTO STORJ "
              "(price_id, price_date, price_time, price) "
               "VALUES (%s, %s, %s, %s)")

#add_priceETH = ("INSERT INTO ETH "
#               "(price_id, price_date, price_time, price) "
#               "VALUES (%s, %s, %s, %s)")

add_priceXRP = ("INSERT INTO XRP "
              "(price_id, price_date, price_time, price) "
               "VALUES (%s, %s, %s, %s)")

URL = "https://www.gate.io/trade/BCN_USDT"
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
results = soup.find("span", class_="tempPrice").get_text()
price2 = float(results)
price_no = cursor.lastrowid
data_BCN = (price_no, todayData, hNow, price2)
cursor.execute(add_priceBCN, data_BCN)

#URL = "https://www.gate.io/trade/BTC_USDT"
#page = requests.get(URL)
#soup = BeautifulSoup(page.content, "html.parser")
#results = soup.find("span", class_="tempPrice").get_text()
#price2 = float(results)
#price_no = cursor.lastrowid
#data_BTC = (price_no, todayData, hNow, price2)
#cursor.execute(add_priceBTC, data_BTC)

URL = "https://www.gate.io/trade/XMR_USDT"
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
results = soup.find("span", class_="tempPrice").get_text()
price2 = float(results)
price_no = cursor.lastrowid
data_XMR = (price_no, todayData, hNow, price2)
cursor.execute(add_priceXMR, data_XMR)

URL = "https://www.gate.io/trade/TNC_USDT"
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
results = soup.find("span", class_="tempPrice").get_text()
price2 = float(results)
price_no = cursor.lastrowid
data_TNC = (price_no, todayData, hNow, price2)
cursor.execute(add_priceTNC, data_TNC)

URL = "https://www.gate.io/trade/STORJ_USDT"
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
results = soup.find("span", class_="tempPrice").get_text()
price2 = float(results)
price_no = cursor.lastrowid
data_STORJ = (price_no, todayData, hNow, price2)
cursor.execute(add_priceSTORJ, data_STORJ)

#URL = "https://www.gate.io/trade/ETH_USDT"
#page = requests.get(URL)
#soup = BeautifulSoup(page.content, "html.parser")
#results = soup.find("span", class_="tempPrice").get_text()
#price2 = float(results)
#price_no = cursor.lastrowid
#data_ETH = (price_no, todayData, hNow, price2)
#cursor.execute(add_priceETH, data_ETH)

URL = "https://www.gate.io/trade/XRP_USDT"
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
results = soup.find("span", class_="tempPrice").get_text()
price2 = float(results)
price_no = cursor.lastrowid
data_XRP = (price_no, todayData, hNow, price2)
cursor.execute(add_priceXRP, data_XRP)


# Make sure data is committed to the database
cnx.commit()

cursor.close()
cnx.close()


