# make a board class

class TicTacToeBoard
    @@board = Array.new(9, '-')

    def display
        puts "#{@@board[0]}#{@@board[1]}#{@@board[2]}"
        puts "#{@@board[3]}#{@@board[4]}#{@@board[5]}"
        puts "#{@@board[6]}#{@@board[7]}#{@@board[8]}\n\n"
    end
    
    def change(num_spot, piece)
       if @@board[num_spot] == '-'
            @@board[num_spot] = piece 
        else
            false
        end 
    end

end

class Player
    attr_reader :piece

    def initialize(piece)
        @piece = piece
    end

    def ask
        puts "Enter your answer 1-9"
        answer = gets.to_i
        #char returns 0, so increase the acceptable numbers by 1
        if !answer.between?(1,9)
            puts "error"
            self.ask
        else 
            answer    
        end
    end 
end 

board = TicTacToeBoard.new
board.display
player1 = Player.new('x')
player2 = Player.new('o')
player1Answer = player1.ask

    while !board.change(player1Answer-1, player1.piece)
        player1Answer = player1.ask
    end
    board.display
    player2Answer = player2.ask
    while !board.change(player2Answer-1, player2.piece)
        player2Answer = player2.ask
    end
    board.display