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
  
  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize()
    @players = [Person.new('Player1', 'X'), Person.new('Player2', 'O')]
    @game_array = Array.new(9, ' ')
    @current_player_index = 0
  end

  def print_game_board()
    @game_array.each_slice(3) do |row|
      puts row.join('|') # Print each row as a comma-separated list
    end
  end

  def insert_play(index, player)
    if @game_array[index] == ' '
      @game_array[index] = player.token
      true
    else
      puts 'Error!, best try again'
      false
    end
  end

  def win_check()
    WINNING_COMBOS.any? do |combo|
      [@game_array[combo[0]], @game_array[combo[1]], @game_array[combo[2]]].uniq.length == 1 && @game_array[combo[0]] !=' '
    end
  end

  def win_confrimation(winners_token)
    if winners_token == @p1.token
      puts "#{@p1.name} WINNNNSSSSS"
    elsif winners_token == @p2.token
      puts "#{@p2.name} WINNNNSSSSS"
    end
  end

  def switch_player
    @current_player_index = (@current_player_index + 1) % 2
  end

  def play
    current_player = @players[@current_player_index]
    loop do
      position_index = prompt "#{@current_player} Choose your move(index 0-8): "
      break if insert_play(position_index, current_player) == true

      puts 'Error with input, Try Again between 0-8 Index'
    end
    switch_player
  end
end

def game_play()
  game = Game.new()
  9.times do
    game.play
    game.print_game_board
    if game.win_check == true
      puts 'Game Completed'
      break
    end
  end
end

game_play
