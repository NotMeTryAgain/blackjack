require "spec_helper"

RSpec.describe Card do
  let(:card) { Card.new(10, "♦") }
  let(:card2) { Card.new("Q", "♦") }
  let(:card3) { Card.new("A", "♦") }
  let(:card4) { Card.new(4, "♦") }

  describe "#new" do
    it "should have a rank" do
      expect(card.rank).to eq(10)
    end

    it "should have a suit" do
      expect(card.suit).to eq("♦")
    end
  end

  describe "#calculate_card" do
    it "should calculate the value from the rank" do
      expect(card.calculate_card).to eq(10)
      expect(card2.calculate_card).to eq(10)
      expect(card3.calculate_card).to eq(11)
      expect(card4.calculate_card).to eq(4)
    end
  end
end
