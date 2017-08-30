defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]


    # Nested comprehension
    # Get all lists into one list
    # Solution 1 - Flattens the given list of nested lists, many lists moved into one list

    #cards = for value <- values do
    #  for suit <- suits do
    #    "#{value} of #{suit}"
    #  end
    #end        
    #List.flatten(cards)

      # Solution 2 - Passing both lists on the same comprehension, loop? 

      for suit <- suits, value <- values do
        "#{value} of #{suit}"
      end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end



  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
      # Returns a tuple, first element list of cards in hand second element remaining cards in deck
      # Patern matthing used for variable assignement - [color1, color2] = ["red", blue] result = color1 = "red", color2 = "blue"
    end

    # Save method, turn a list of strings into binary object
    def save(deck, filename) do
      binary = :erlang.term_to_binary(deck)
      File.write(filename, binary)
    end

    def load(filename) do
      {status, binary} = File.read(filename)
      
      case status do        
      :ok -> :erlang.binary_to_term binary
      :error -> "That file doesn't exist"  
      end

    end

end
