def snake_ladder (position, dice, snake_hash, snake_message, ladders_hash, ladder_message)
    if position + dice >100
        puts "You just need a #{100-position}"
        return position
    end
    position = position + dice
    snake_pos = snake_hash[position]
    ladder_pos = ladders_hash[position]
    if snake_pos.class != NilClass
        puts snake_message
        puts "Tooks you down from #{position} to #{snake_pos}"
        position = snake_pos
    elsif ladder_pos.class != NilClass
        puts ladder_message
        puts "Tooks you up from #{position} to #{ladder_pos}"
        position = ladder_pos
    end
    position
end
#Start messages for the game
puts "\t\tSNAKE AND LADDERS GAME"
puts "Enter your name"
puts "Player 1:"
player1 = gets.chomp
if player1 == ""
    player1 = "Player1"
end
puts "Player 2:"
player2 = gets.chomp
if player2 == ""
    player2 = "Player2"
end
puts "Welcome to snake n ladders #{player1} & #{player2}"

#data to start the game
position1 = 0
position2 = 0
dice = 0
turn = 1
ladder_message = "\nHurray! You climb a ladder"
snake_message = "\nBitten by snake!"

snake_hash = {
        17=> 7, 54=> 34, 62=> 19, 64=> 60, 87=> 36, 93=> 73, 95=>75, 98=> 79
        }  
            
ladders_hash = {
        1=> 38, 4=> 14, 9=> 31, 21=> 42, 28=> 84, 51=> 67, 72=>91, 80=> 99
        }

#An infinte loop till player1 or player2 wins the game

while !(position1 == 100 || position2 ==100)
    puts "\t\tSCORE-BOARD SNAKES-N-LADDERS"
    puts "#{player1}: #{position1}\t #{player2}: #{position2}"
    puts "Press enter to roll dice or \'q\' to quit the game"
    puts turn == 1 ?  "#{player1}" :  "#{player2}"
    response = gets.chomp
    if response.downcase != "q"
        dice = Random.rand(6)+1
        puts "Dice rolled: #{dice}"
        if turn == 1
            position1 = snake_ladder(position1, dice, snake_hash,snake_message,ladders_hash,ladder_message)
            turn = 0
        else
            position2 = snake_ladder(position2, dice, snake_hash,snake_message,ladders_hash,ladder_message)
            turn = 1
        end
    else
        if turn == 1
            puts "#{player1} quits! \n#{player2} won!"
        else
            puts "#{player2} quits! \n#{player1} won!"
        end
        break
    end


end
puts position1 == 100 ? "\t#{player1} won!" : position2 == 100 ? "\t#{player2} won!": ""