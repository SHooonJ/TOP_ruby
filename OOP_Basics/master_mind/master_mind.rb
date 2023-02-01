COLORS = ["red","blue","green","yellow","orange","pink"]
PEGS   = ["black","white"]

class BOARD
    attr_accessor :guess_rows, :key_row
    attr_reader :colors, :pegs

    @@colors = ["red","blue","green","yellow","orange","pink"]
    @@pegs = ["black","white"]

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

class MASTERMIND
    def createKey()
        puts "Enter the key"
        (0..3).each do |i|
            puts "Enter key for index #{i}"
            key_input = gets.chomp
            check_input(key_input)
        end 
    end

    def check_input(input)
        COLORS.include?(input)
    end
end 


mastermind_board = BOARD.new()
mastermind_board.draw

mastermind = MASTERMIND.new()
mastermind.createKey
