require_relative "piece"
require_relative "stepable"
class Knight < Piece
    include Stepable

    def symbol
        case @color
        when :white
            "♞".white
        else 
            "♞".light_black
        end
    end

    protected

    def move_dirs
        [[1,2], [2,1], [2,-1], [-1,2], [1,-2], [-2,1], [-1,-2], [-2,-1]]
    end
end