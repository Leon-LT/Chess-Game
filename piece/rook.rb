require_relative "piece"
require_relative "slideable"
class Rook < Piece
    include Slideable
    
    def symbol
        case @color
        when :white
            "♜".white
        else 
            "♜".light_black
        end
    end

    private

    def move_dirs
        horizontal_vertical_dirs
    end
end