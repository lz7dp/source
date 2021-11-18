import sqlite3
from random import randint
from time import time


conn = sqlite3.connect("computer_cards.db")

def read_all_cards():
    result = conn.execute("SELECT * FROM computer")
    return result.fetchall()

def pick_card():
    cards = read_all_cards()
    last_picked_card = read_last_picked()
    
    random_card = cards[randint(0, len(cards) - 1)]
    while random_card[0] == last_picked_card[0]:
        random_card = cards[randtint(0, len(cards) -1)]
    
    insert_picked(random_card[0])
    return random_card

def insert_picked(name):
    insert_sql = f"INSERT INTO picked(name, time) VALUES ( '{name}', {time()} )"
    conn.execute(insert_sql)
    conn.commit()

# new code
def insert_card_played(card_p1, card_p2, the_winner):
    # function to write the the 'results' table containing card1, card2, winner
    insert_sql = f"INSERT INTO result(card1, card2, winner) VALUES ('{card_p1}', '{card_p2}', '{the_winner}')"
    
    conn.execute(insert_sql)
    conn.commit()

# new code
def update_card_played(won, card):
    # gets last two card picked, check who has what, update who has won.
    cards_in_play = read_card_just_played()
    
    if cards_in_play[0][0] == card:
        if won:
            insert_card_played(card, cards_in_play[1][0], card)
        else:
            insert_card_played(card, cards_in_play[1][0], cards_in_play[1][0])
    else:
        if won:
            insert_card_played(card, cards_in_play[0][0], card)
        else:
            insert_card_played(card, cards_in_play[0][0], cards_in_play[0][0])  
            

def read_last_picked():
    result = conn.execute("SELECT name FROM picked ORDER BY time DESC")
    return result.fetchone()

#new code, new the use of fetchmany.  Grab the last two new entries from picked.
def read_card_just_played():
    result = conn.execute("SELECT name FROM picked ORDER BY time DESC")
    return result.fetchmany(2)
    
def display_card(card_text):
    #need to fix borders at a later date
    print(f"+----------------------------+\n| {card_text[0]} |\n|                         |\n|   Cores            {card_text[1]}       |\n|   CPU speed      {card_text[2]} GHz   |\n|   RAM           {card_text[3]} MB    |\n|   Cost           ${card_text[4]}       |\n|                            |\n+----------------------------+\n")
    
def play_game():
    print("Welcome to Top Trump Computers")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")
    
    player = input("Are you player (1) or player (2)?>")
    name = input("What is your name? >")
    
    choosing_player = "1"   # traking who goes first

    score = [0,0]
    for round in range(5):
        input("Both players ready? Press Enter to pick card a card. >")
        card = pick_card()  # picks card, and checks it's not already picked
        card_text = f"{card[0]}, cores={card[1]}, speed={card[2]}GHz, RAM={card[3]}MB, cost={card[4]}$"
        print(display_card(card))
        
        print(f"Player {choosing_player} picks.")
        winner = input("Did you win? (Y)es, (N)o, (D)raw >").lower()
    
       # new code, updates played cards (only if player1), increases score
        if winner == "y":
            choosing_player = player
            if player =="1":  #Ternary operator didn't work here ?
                score[0] += 1
                update_card_played("won", card[0]) # only Player_1 updates the database
            else:
                score[1] += 1
            
        elif winner == "n":
            choosing_player = "2" if player == "1" else "1"  #using a Ternary operaor  
            if player =="1":
                score[1] += 1
                update_card_played("lost", card[0])
            else:
                score[0] += 1
        
            
    print(f"Player 1 Scored {score[0]}")
    print(f"Player 2 Scored {score[1]}")

play_game()
conn.close()