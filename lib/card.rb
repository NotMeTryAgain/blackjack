require_relative "deck"

class Card
  attr_accessor :rank, :suit
  attr_reader :value, :name

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @name = "#{rank}#{suit}"
    @value = calculate_card
  end

  def calculate_card
    card_value = 0
    if["J", "Q", "K"].include?(@rank)
      @card_value = 10
    elsif @rank == "A"
      @card_value = 11
    else
      @card_value = rank.to_i
    end
  end
end
