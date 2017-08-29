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
  end

end
