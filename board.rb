require_relative "./piece/piece"
class Board
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) { Array.new(8, @null_piece) }
    end

    # def place_pieces
    #     place_pawns
    # end

    # def place_pawns
    #     y = 1
    #     16.times do |i|
    #         y = 6 if i > 7
    #         new_pos = [i % 8, y]
    #         p new_pos
    #         self[new_pos] = Pawn.new(self, new_pos, :white)
    #     end
    # end

    # def 
        
    # end

    def [](pos)
        return nil if !valid_pos?(pos)
        x, y = pos
        @rows[y][x]
    end

    def []=(pos, val)        
        return nil if !valid_pos?(pos)
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

    def valid_pos?(pos)
        coor_x, coor_y = pos
        return false if !coor_x.between?(0,7) || !coor_y.between?(0,7)
        true
    end
end