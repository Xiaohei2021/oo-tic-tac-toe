require "pry"
class TicTacToe

    def initialize
        @board = Array.new(9, " ")
    end
    
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end 

    def input_to_index(input)
        input.to_i-1
    
    end

    def move(input_to_index,player)
      @board[input_to_index] = player  
    end

    def position_taken?(input_to_index)
         @board[input_to_index] == "X" || @board[input_to_index] == "O"
  

    end

    def valid_move?(input_to_index)
        !position_taken?(input_to_index) && input_to_index.between?(0,8)
    end
    

    def turn_count
       
       @board.count{ |grid| grid =="X" || grid == "O" }
       
        # count = 0
        # @board.each do |i|
        #     count += 1 if i == "X" || i == "O"
        # end
        #     # binding.pry
        # count
    end

    def current_player
        
        if turn_count.odd? 
        "O"
        else 
        "X"
        end  
    end

    def turn
        puts "Please pick a grid location, 1-9"
        call = gets.chomp
        strategy = input_to_index(call)
        # binding.pry
        if valid_move?(strategy)
            move(strategy,current_player)
            display_board
        else 
            turn
        end
    
    end
    
    def won?
    
        WIN_COMBINATIONS.detect do |winning_grid|
            @board[winning_grid[0]] == @board[winning_grid[1]] &&
            @board[winning_grid[1]] == @board[winning_grid[2]] &&
           position_taken?(winning_grid[0])
        end
    end

    def full? 
        @board.all? {|grid| grid == "X" || grid == "O"}
        
    end

    def draw?
       full? && !won?

    end

    def over?
        won? || draw?
    end

    def winner
      if wining_combo = won?
        @winner = @board[wining_combo.first]  
      end
    end

    def play
        while !over?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end

