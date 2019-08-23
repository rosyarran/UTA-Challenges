class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    arr_ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'A', 'J', 'Q', 'K']
    arr_suits = ['diamonds', 'spades', 'hearts', 'clubs']
    Card.new(arr_ranks.sample, arr_suits.sample)
  end
end

class Deck
  
  def initialize
    @cards = []
    0.upto(26) {@cards << Card.random_card}
    
#    FOR TESTING
#    @cards.each do |card|
#      card.output_card
#    end
#    puts '-----------------'
    
  end
  
  def shuffle
    @cards.shuffle!
  end
  
  def deal
    self.shuffle
    
#    FOR TESTING
#    @cards.each do |card|
#      card.output_card
#    end
#    puts "The first card is:"
    
    puts @cards[0].output_card
  end
end

deck = Deck.new
deck.deal

