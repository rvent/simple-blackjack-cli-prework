def welcome
  # code #welcome here
  puts "Welcome to the Blackjack Table"
end

def player_hand
  # code for the dealt hand of a player
  initial_round
end

def deal_card
  # code #deal_card here
  rand(1..11)
end

def deal_another(hand)
  card_sum = hand
  next_card = deal_card
  display_card_value(next_card)
  card_sum += next_card
  display_card_total(card_sum)
  card_sum
end

def display_card_value(card)
  # code #display_card_total here
  puts "The card's value is #{card}"
end

def display_card_total(card_total)
  # code #display_card_total here
  puts "Your cards add up to #{card_total}"
end

def display_board_total(dealer_card_total, player_card_total)
  # code #display_card_total here
  puts "Dealer's cards add up to #{dealer_card_total}"
  puts "Player's cards add up to #{player_card_total}"
end

def prompt_user
  # code #prompt_user here
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  # code #get_user_input here
  gets.chomp
end

def initial_round
  # code #initial_round here
  card_one = deal_card
  card_two = deal_card
  card_total = card_one + card_two
  # account for two 11's
  if card_total == 22
    card_total = 12
  end
  card_total
end

def hit?(card_total)
  # code hit? here
  card_sum = card_total
  puts "--------------------------------------"
  prompt_user
  user_input = get_user_input
  if user_input == "h"
    card_sum = deal_another(card_sum)
    if  card_sum <= 21
      hit?(card_sum)
    else
      puts "Better luck next_time"
      return card_sum
    end
  elsif user_input == "s"
    return card_sum
  else
    invalid_command
    hit?(card_sum)
  end
end

def invalid_command
  # code invalid_command here
  puts "Please enter a valid command"
end

def dealer_moves(hand_total)
  sum = hand_total
  while sum <= 16
    sum = deal_another(sum)
    puts "--------------------------------------"
  end
  sum 
end

def end_game
  # code #end_game here
  puts "Sorry, you lost. Thanks for playing!"
end

def win_game(card_total)
  # code #win_game here
  puts "Congratulations! You win with #{card_total}. Thanks for playing!"
end

def tie_game(card_total)
  puts "It's a tie, you and the dealer both have #{card_total}. Thanks for playing!"
end

def scoring(dealer_score, player_score)
  if dealer_score == player_score
    tie_game(player_score)
  elsif ((player_score > dealer_score) && (player_score <= 21)) || (dealer_score > 21)
    win_game(player_score)
  else
    end_game
  end
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  # code runner here
  welcome
  dealer_score = player_hand
  player_score = player_hand
  display_board_total(dealer_score, player_score)
  if dealer_score < 21
    player_score = hit?(player_score)
    if player_score <= 21
      puts "--------------------------------------"
      puts "Dealer's move:"
      dealer_score = dealer_moves(dealer_score)
    end
  end
  puts "--------------------------------------"
  display_board_total(dealer_score, player_score)
  scoring(dealer_score, player_score)
end
