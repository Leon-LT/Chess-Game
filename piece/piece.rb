class Piece
    attr_reader :color, :symbol
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
        @board[@pos] = val
    end

    def valid_moves
        moves.select { |move| !move_into_check?(move)}
    end

    private

    def move_into_check?(end_pos)
        piece = @board[end_pos]
        return true if piece.symbol == :king && piece.color != self.color 
        false
    end
end
