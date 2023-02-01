class BOARD
    def initialize()
        @guess_rows = Array.new(10){Array.new(8,0)}
        @key_row = Array.new(4,0)
    end 

    def draw()
        @guess_rows.each do |a|
            print a 
            puts
        end
        print @key_row
        puts
    end 
end 


mastermind = BOARD.new()
mastermind.draw
