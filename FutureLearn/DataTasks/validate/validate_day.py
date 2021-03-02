months_of_the_year = {"January":31, "February":28,"March":31, "April":30, "May":31, "June":30, "July":31, "August":31, "September":30, "October":31, "November":30, "December":31}


year=0
while year<1900 or year>2100:
	year = int(input ("Enter the year "))

print ("You selected ", year)
if year%4 ==0:
	print("This is a leap year")
	months_of_the_year["February"]=29

choose_month=""
while choose_month not in months_of_the_year:
	choose_month = input ("Enter the month ")

print("You selected ", choose_month)

choose_day= 0
while choose_day <1 or choose_day > months_of_the_year[choose_month]:
	choose_day = int(input ("Enter the day of the month"))


print("You selected ", choose_day)
