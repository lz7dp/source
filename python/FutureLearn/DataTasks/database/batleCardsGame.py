# battleCardGame6
import sqlite3
from random import randint
from time import time

conn= sqlite3.connect("computer_cards.db")# use conn to connect to database rather than open it as in other python programs

def insert_picked(name):#function to insert cards that have been picked into the picked table
    insert_sql = "INSERT INTO picked(name, time) VALUES ('{}', {})".format(name, time())#
    conn.execute(insert_sql)#function is executed
    conn.commit()#change committed

def read_last_picked():#function to read the very last picked card
    result=conn.execute("SELECT * FROM picked ORDER BY time DESC")
    return result.fetchone()

def lasttwopicked():#function to read the very last picked card
    result=conn.execute("SELECT * FROM picked ORDER BY time DESC")
    computers = result.fetchall() #creates variable in which the data fetched from DB using fetchall is stored - var computers is a list of lists
    card2=computers[0][0] #card2 is the the most recent card stored in picked- with indices of [0][0]
    card1=computers[1][0] #card1 is the second more recent card stored in picked - with indices of [1][0]
    return card1,card2

def read_all_cards():#function to read all cards from DB 
    result=conn.execute("SELECT * FROM computer")
    return result.fetchall()
    
def stats_on_winning_card(winner): #function to provide stats on the winning card 
    winner1=winner
    size=0
    total=conn.execute("SELECT winner FROM result")
    for x in total:
        size+=1
    n=0
    results=conn.execute("SELECT winner FROM result WHERE winner= '{}'".format(winner1))
    for i in results:
        #print(i)
        n+=1
    print(winner1," won ", n,"out of ",size," cards.")    

def pick_card():#A random card is drawn for each player.
    cards=read_all_cards()
    last_picked_card =read_last_picked()
    random_card=cards[randint(0,len(cards)-1)]
    while random_card[0]==last_picked_card[0]:
        random_card=cards[randint(0,len(cards)-1)]
    insert_picked(random_card[0])#inserts this card into the picked card DB
    return random_card

def result(card1,card2,winner): #defines the function result which expects three parameters-card2, card2, and winning card
    insert_sql="INSERT INTO result(card1,card2,winner) VALUES ('{}','{}','{}')".format(card1,card2,winner)#creates insert_sql variable which contains SQL statement
    #using .format simplifies the code- doesnt require concatenation '"+name+"', etc
    conn.execute(insert_sql) #executes the insert_sql statement
    conn.commit() #must commit changes before writing to table

player = input("Are you player (1) or (2) >")
choosing_player = "1"

rounds =input("How many rounds do you want to play?")
rounds=int(rounds)

for round in range(rounds):
        win_state=False # win state for game-  establishes whether game was won/lost or draw 
        while win_state ==False:
            input("Press enter to pick a card when both players are ready >")
            card=pick_card()#each player's computer will randomly generate card from list read_all_cards()
            card_text="{}, cores={}, speed={}GHz, RAM={}MB,cost={}$".format(card[0],card[1],card[2],card[3],card[4])
            print(card_text)
            print("Player " + choosing_player+ " picks.")
            card1,card2=lasttwopicked() #assigns value to card1 and card 2 through last two picked function
            win=input("Did you win? (Y)es, (N)o, (D)raw >").lower()#Whoever wins the round picks the statistic in the next round.
            if win=="d":#If the round is tied, both players draw a new card and the most recent winner still picks the statistic.
                win_state=False
            elif win=="y":#if winner, defines choosing player and winning card 
                choosing_player=player
                winner=card1 if card[0] == card1 else card2#if card 1 is the card drawn, the winner is card1, otherwise winner is card2 
                result(card1,card2,winner)   #to make sure that the data is not written to the DB twice during a game, only the winner will write to results DB 
                win_state=True
                stats_on_winning_card(winner)
            elif win=="n":#if player lost, change choosing player to other player
                choosing_player="2" if player =="1" else "1"
                winner=card2 if card[0]==card1 else card1
                win_state=True
                stats_on_winning_card(winner)
            
conn.close()
