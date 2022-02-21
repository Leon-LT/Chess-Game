require_relative "./piece/piece"
class Board
    attr_reader :rows
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) { Array.new(8, @null_piece) }
    end

    def place_pieces
        place_pawns
        place_remaining
    end

    def place_pawns
        y = 1
        color = :black
        16.times do |i|
            if i > 7
                y = 6 
                color = :white
            end
            new_pos = [i % 8, y]
            self[new_pos] = Pawn.new(self, new_pos, color)
        end
    end

    def place_remaining 
        pieces_pos = {
            rook:[[0,0],[7,0],[0,7],[7,7]],
            knight:[[1,0],[6,0],[1,7],[6,7]],
            bishop:[[2,0],[5,0],[2,7],[5,7]],
            king:[[4,0],[4,7]],
            queen:[[3,0],[3,7]]
        }

        pieces_pos.each_key do |piece|
            color = :white
            pieces_pos[piece].each do |pos|
                pos[1] == 7 ? color = :white : color = :black
                add_piece(piece, pos, color)
            end
        end
    end

    def add_piece(piece, pos, color)
        case piece
        when :rook
            self[pos] = Rook.new(self, pos, color)
        when :queen
            self[pos] = Queen.new(self, pos, color)
        when :king
            self[pos] = King.new(self, pos, color)
        when :bishop
            self[pos] = Bishop.new(self, pos, color)
        when :knight 
            self[pos] = Knight.new(self, pos, color)
        end
    end

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
        raise ArgumentError.new("There is no piece in the start position") if !self[start_pos].is_a? Piece
        raise ArgumentError.new("You can't kill a piece with the same color") if self[start_pos].color == self[end_pos].color
        
        @rows[start_y][start_x], @rows[end_y][end_x] = NullPiece.instance, @rows[start_y][start_x] 
        rescue ArgumentError => e
            puts e.message
    end


    def valid_pos?(pos)
        coor_x, coor_y = pos
        return false if !coor_x.between?(0,7) || !coor_y.between?(0,7)
        true
    end
end