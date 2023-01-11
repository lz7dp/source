from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from time import sleep

chrome_options = Options()
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')

driver = webdriver.Chrome(options=chrome_options)
driver.get("https://manual-qa-demo.softuniqa.repl.co")

sleep(3)
button = driver.find_element(By.ID, "button")
button.click()

msg = driver.find_element(By.ID, "msg")
assert msg.text == 'Button clicked'
