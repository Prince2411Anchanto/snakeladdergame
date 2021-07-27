require_relative 'player'
require_relative 'snakeandladder'
puts "\t\tSNAKE AND LADDERS GAME"
puts "Enter your name"
puts "Player 1:"
player1 = Player.new("Player1")
player1.name = gets.chomp
puts "Player 2:"
player2 = Player.new("Player2")
player2.name = gets.chomp

game = SnakeAndLadder.new(player1, player2)
game.play_game

