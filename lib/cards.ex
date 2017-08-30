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
      case File.read(filename) do
        {:ok, binary} -> :erlang.binary_to_term binary
        {:error, _reason} -> "That file doesn't exist"
      end

      #File.read return a tuple {:ok, saved deck in binary}
      #and we pattern match it to {status, binary}
      
      #{status, binary} = File.read(filename)
      #now we can simply access status or binary variables. 
      #wrong file name will return a tuple of error {:error, :enoent} enoent = error no entity 

      #case status do        
      #:ok -> :erlang.binary_to_term binary
      #:error -> "That file doesn't exist"  
      #end
      

    end

    def create_hand(hand_size) do
      Cards.create_deck
      |>Cards.shuffle
      |>Cards.deal(hand_size)
    end

end
