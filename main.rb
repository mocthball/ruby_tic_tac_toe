#!/usr/bin/env ruby

class Person
  def initialize(name, token)
    @name = name
    @token = token
    end

  def token
    @token
  end
end

class Game
  def initialize(person1, person2)
    @p1 = person1
    @p2 = person2
    @game_array = Array.new(9,' ')
  end

  def PrintGameBoard()
    @game_array.each_slice(3) do |row|
        puts row.join('|') # Print each row as a comma-separated list
    end
  end

  def InsertPlay(index, player)
    if @game_array[index] == ' '
      @game_array[index] = player
    else
      puts 'Error!, best try again'
    end
  end

  def WinCheck()
    3.times do |i|
      if @game_array[i] == @game_array[1] && @game_array[1] == @game_array[2]
        WinConfirmation(game_array[i])
      end
      i += 3
    end
  end
 
  def WinConfirmation(winners_token)
    if winners_token == @p1.token
      puts "#{@p1.name} WINNNNSSSSS"
    elsif winners_token == @p2.token
      puts "#{@p2.name} WINNNNSSSSS"
    end
  end
end

player1 = Person.new('Mitch', '0')
player2 = Person.new('Kirst', 'X')

game = Game.new(player1, player2)

game.InsertPlay(1,player1.token)

game.PrintGameBoard()

game.WinCheck()