import json
import requests

# requesting data indonesian COVID-19
covid_data = requests.get("https://lintangwisesa.github.io/Indonesia-Covid19-Maps/data/provinsi/all.json") 

# parsing the data 
response = covid_data.json() 

#print(response) 

#print all data covid-19 according province 

for covid in response: 
    print(f"=> Data covid-19 in the province {covid['Provinsi']} :") 
    print(f"@ Positive: {covid['Confirmed']}") 
    print(f"$ Cured: {covid['Recovered']}") 
    print(f"! Death: {covid['Deaths']}") 
    print(f"! Active case: {covid['Active cases']}") 
