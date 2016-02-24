require_relative 'deck'
require_relative 'card'
require'pry'

class Hand
  attr_accessor :cards, :add_card
  def initialize(cards)
    @cards = cards
  end

  def hand_value
    sum = 0
    cards.each do |card|
        if sum > 10 && card.rank == "A"
          sum += card.value - 10
        else
          sum += card.value
        end
    end
    sum
  end

  def add_card(card)
    @cards += card
  end
end

#binding.pry
