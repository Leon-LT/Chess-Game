class Piece
    attr_reader :color, :symbol, :pos
    def initialize(board, pos, color)
        @board, @pos, @color = board, pos, color
    end

    def symbol
        raise NotImplemented
    end

    def empty?
        false
    end

    def to_s
        symbol
    end

    def pos=(val)
        @pos = val
    end

    def valid_moves
        valid_moves = moves.select { |move| !move_into_check?(move) }
        return valid_moves
    end

    def move_into_check?(end_pos)
        board_copy = @board.move_piece(self.color, self.pos, end_pos)
        board_copy.in_check?(self.color)
    end
end
