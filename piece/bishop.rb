require_relative "piece"
require_relative "slideable"
class Bishop < Piece
    include Slideable

    def symbol
        case @color
        when :white
            "♝".white
        else 
            "♝".light_black
        end
    end

    private

    def move_dirs
        diagonal_dirs
    end

end