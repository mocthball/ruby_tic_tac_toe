#!/usr/bin/env ruby

def prompt(*args)
  print(*args)
  gets.chomp.to_i
end

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
  def initialize()
    @players = [Person.new('Player1', "X"), Person.new('Player2','O')]
    @game_array = Array.new(9,' ')
    @current_player_index = 0
  end

  def print_game_board()
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
    @game_array.each do |row|
    end

    3.times do |i|
      if @game_array[i] == @game_array[1] && @game_array[1] == @game_array[2]
        WinConfirmation(game_array[i])
        return true
      end
      i += 3 #Work on proper loop method
    end
    return false
  end
 
  def WinConfirmation(winners_token)
    if winners_token == @p1.token
      puts "#{@p1.name} WINNNNSSSSS"
    elsif winners_token == @p2.token
      puts "#{@p2.name} WINNNNSSSSS"
    end
  end

  def GameRound()
    rounds = 0
    until rounds = 4
      player1_index = prompt "#{player1.name} Choose your move(index 0-8): "
      game.InsertPlay(player1_index,player1.token)
      player2_index = prompt "#{player2.name} Choose your move(index 0-8): "
      game.InsertPlay(player2_index,player2.token)
    end
  end

  def switch_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def play
    9.times do
      current_player = @players[@current_player_index]
      loop do
        position_index = prompt "#{current_player.name} Choose your move(index 0-8): "
        break if @game_array[position_index] == ' '
        puts "Error with input, Try Again between 0-8 Index"
      end
      if WinCheck == true
        puts "Game Completed"
      end
  end


end

def GamePlay()
  game = Game.new()
  game.GameRound()
  game.print_game_board
end

GamePlay()