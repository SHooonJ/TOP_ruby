# make a board class

class TicTacToeBoard
    @@board = Array.new(9, '-')
    @@WIN_CONDITION = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    def display
        @@board.each_index do |index|
            if ((index+1) % 3 == 0)
                puts "#{@@board[index]}"
            else
                print "#{@@board[index]}"
            end
        end
    end
    
    def change(num_spot, piece)
       if @@board[num_spot] == '-'
            @@board[num_spot] = piece 
        else
            false
        end 
    end

    def win?(piece)
        track = 0
        @@WIN_CONDITION.each_index do |index|
            @@WIN_CONDITION[index].each do |spot|
                if @@board[spot] == piece
                    track += 1
                end
            end
            if track == 3
                return true
            else
                track = 0
            end 
        end
        return false 
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

while 1
    while !board.change(player1Answer-1, player1.piece)
        player1Answer = player1.ask
    end
    board.display
    if board.win?(player1.piece)
        puts "#{player1.piece} is the winner"
        break
    end
    player2Answer = player2.ask
    while !board.change(player2Answer-1, player2.piece)
        player2Answer = player2.ask
    end
    board.display
    if board.win?(player2.piece)
        puts "#{player2.piece} is the winner"
        break
    end
end 

