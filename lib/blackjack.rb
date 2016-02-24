require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require'pry'

class Blackjack
  attr_accessor :deck, :player, :hand, :player_hit, :play, :hit_card
  attr_reader :dealer
  def initialize
    @deck = Deck.new
    @player = deal_player_cards
    @dealer = deal_house
  end

  def deal_player_cards
    player_cards = deck.deal(2)
    player = Hand.new(player_cards)
  end

  def player_hit
    hit_card = deck.deal(1)
    @player.add_card(hit_card)
    puts "Player was dealt: #{player.cards.last.name}"
  end

  def player_input
    player_input = ""
    while player_input.downcase != "s"
      print "Hit or Stand? (H/S)\n>"
      player_input = gets.chomp
      if player_input.downcase == "h"
        player_hit
        if player.hand_value < 21
           puts "Player score: #{player.hand_value}"
        else player.hand_value > 21
           puts "\nPlayer Busts"
           puts "Dealer Wins"
          break
        end
      end
    end
  end

  def deal_house
    if player.hand_value <= 21
      dealer_cards = deck.deal(2)
      dealer = Hand.new(dealer_cards)
    end
  end


  def dealer_hit
  while dealer.hand_value < 17
    puts "Dealer hits"
    hit_card = deck.deal(1)
    @dealer.add_card(hit_card)
    puts "Dealer was dealt: #{dealer.cards.last.name}\n\n"
  end
  @dealer.hand_value
end

  def victor
    if player.hand_value > dealer.hand_value
      puts "Player wins"
    elsif dealer.hand_value > player.hand_value && dealer.hand_value <= 21
      puts "Dealer wins"

    elsif dealer.hand_value > 21
      puts "Dealer busts"
    else
      puts "Its a tie"
    end
  end

  def play
    deal_player_cards
    @player.cards.each do |card|
      puts "Player was dealt: #{card.name}"
    end
    puts ""
    puts "Player score: #{player.hand_value}"
    puts ""
    player_input
    puts ""
    if player.hand_value <= 21
      deal_house
      @dealer.cards.each do |card|
        puts "Dealer was dealt: #{card.name}"
      end
      puts ""
      dealer_hit
      puts "Dealer score: #{dealer.hand_value}"
      victor
    end
  end
end
game = Blackjack.new
game.play
# binding.pry
