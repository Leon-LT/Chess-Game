require_relative "piece"
require_relative "stepable"
class King < Piece
    include Stepable

    def symbol
        case @color
        when :white
            "♚".white
        else 
            "♚".light_black
        end
    end

    protected

    def move_diffs
        [[1,0], [0,1], [1,1], [-1,0], [0,-1], [-1,-1], [1,-1], [-1, 1]]
    end
end