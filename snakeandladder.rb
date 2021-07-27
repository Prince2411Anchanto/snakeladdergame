class SnakeAndLadder
    def initialize(player1, player2)
        @ladder_message = "\nHurray! You climb a ladder"
        @snake_message = "\nBitten by snake!"
        @snake_hash = {
                17=> 7, 54=> 34, 62=> 19, 64=> 60, 87=> 36, 93=> 73, 95=>75, 98=> 79
                }  
                    
        @ladders_hash = {
                1=> 38, 4=> 14, 9=> 31, 21=> 42, 28=> 84, 51=> 67, 72=>91, 80=> 99
                }
        @player1 = player1
        @player2 = player2
    end

    def play_game
        turn = 1
        puts "Welcome to snake n ladders #{@player1.name} & #{@player2.name}"
        puts "*********The game starts*********"
        #An infinte loop till player1 or player2 wins the game
        while !(@player1.position == 100 || @player2.position ==100)
            puts "\t\tSCORE-BOARD SNAKES-N-LADDERS"
            puts "#{@player1.name}: #{@player1.position}\t #{@player2.name}: #{@player2.position}"
            puts "Press enter to roll dice or \'q\' to quit the game"
            puts turn == 1 ?  "#{@player1.name}'s turn" :  "#{@player2.name}'s turn"
            response = gets.chomp
            if response.downcase != "q"
                if turn == 1
                    @player1.position = make_move(@player1.position)
                    turn = 0
                else
                    @player2.position = make_move(@player2.position)
                    turn = 1
                end
            else
                if turn == 1
                    puts "#{@player1.name} quits! \n#{@player2.name} won!"
                else
                    puts "#{@player2.name} quits! \n#{@player1.name} won!"
                end
                break
            end
        end
        puts @player1.position == 100 ? "\t#{@player1.name} won!" : @player2.position == 100 ? "\t#{@player2.name} won!": ""
        # play_again
    end

    private 
    #helper methods
    def roll_dice
        dice = Random.rand(6)+1
        puts "Dice rolled: #{dice}"
        dice
    end
    
    def climb_ladder(position, ladder_pos)
        puts @ladder_message
        puts "Tooks you up from #{position} to #{ladder_pos}"
        ladder_pos
    end
    
    def bit_by_snake(position, snake_pos)
        puts @snake_message
        puts "Tooks you down from #{position} to #{snake_pos}"
        snake_pos
    end
    
    def make_move (position=0)
        dice = roll_dice
        if position + dice >100
            puts "You just need a #{100-position}"
            return position
        end
    
        position = position + dice
        snake_pos = @snake_hash[position].to_i
        ladder_pos = @ladders_hash[position].to_i
        
        if snake_pos != 0
            position = bit_by_snake(position, snake_pos)
        elsif ladder_pos != 0
            position = climb_ladder(position, ladder_pos)
        end
        position
    end
    
    # def play_again
    #     puts "Do u want to play another game?(y for yes any key to exit)"
    #     response = gets.chomp
    
    #     if response == "y"
    #         @player1.position(0)
    #         @player2.position(0)
    #         play_game
    #     else
    #         puts "See you again!"
    #     end
    # end
end
