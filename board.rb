require_relative "piece"
class Board
    def initialize
        @rows = Array.new(8) { Array.new(8) }
    end

    def [](pos)
        x, y = pos
        @rows[y][x]
    end

    def []=(pos, val)
        x, y = pos
        @rows[y][x] = val
    end

    def move_piece(color, start_pos, end_pos)
        start_x, start_y = start_pos
        end_x, end_y = end_pos
        raise ArgumentError.new("There is no piece in the start position") if !@rows[start_y][start_x].is_a? Piece
        
        @rows[start_y][start_x], @rows[end_y][end_x] = nil, @rows[start_y][start_x] 
        rescue ArgumentError => e
            e.message
    end
end