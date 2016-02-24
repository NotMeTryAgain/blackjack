require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new([Card.new("A", "♦"), Card.new("A", "♥")]) }
  let(:hand1) { Hand.new([Card.new("J", "♦"), Card.new("K", "♥")]) }
  let(:hand2) { Hand.new([Card.new("9", "♦"), Card.new("K", "♥")]) }
  let(:hand3) { Hand.new([Card.new("4", "♦"), Card.new("A", "♥")]) }
  let(:hand4) { Hand.new([Card.new("A", "♦"), Card.new("A", "♥"), Card.new("A", "♠")]) }

  describe ".new" do
    it "should contain two cards" do
      expect(hand.cards.length).to eq(2)
    end
  end

  describe "#hand_value" do
    it "should let face cards equal 10" do
      expect(hand1.hand_value).to eq(20)
      expect(hand2.hand_value).to eq(19)
    end

    it "should let Aces equal 11" do
      expect(hand3.hand_value).to eq(15)
    end

    it "should let an ace equal 1 if there is another ace in the hand" do
      expect(hand.hand_value).to eq(12)
    end

    it "should let 3 aces equal 13" do
      expect(hand4.hand_value).to eq(13)
    end
  end

  describe "#add_card" do
    it "should add one card to the hand" do
      expect(hand.add_card([Card.new("J", "♦")]).length).to eq(3)
    end
  end
end
