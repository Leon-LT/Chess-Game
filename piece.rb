require "singleton"
module Slidable
    HORIZONTAL_DIRS = [[0,1], [1,0], [0, -1], [-1, 0]]]
    DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]


end

class Piece
    attr_reader :color, :symbol
    def initialize(board, pos, color)
        @board, @pos, @color, @symbol = board, pos, color, nil
    end
    #to_s, #empty?
    def pos=(val)
        @board[@pos] = val
    end

    def valid_moves
        
    end

    private

    def move_into_check?(end_pos)
        piece = @board[end_pos]
        return true if piece.symbol == :king && piece.color != self.color 
        false
    end
end

class Rook < Piece
    include Slidable
    def initialize(board, pos, color)
        super
        @symbol = :rook
    end

    private

    def move_dirs
        
    end
end

class Bishop < Piece
    include Slidable
    def initialize(board, pos, color)
        super
        @symbol = :Bishop
    end

    private

    def move_dirs
        
    end
end

class Queen < Piece
    include Slidable
    def initialize(board, pos, color)
        super
        @symbol = :queen
    end

    private

    def move_dirs
        
    end
end

class Knight < Piece
    include Stepable
    def initialize(board, pos, color)
        super
        @symbol = :knight
    end

    protected

    def move_dirs
        
    end
end

class King < Piece
    include Stepable
    def initialize(board, pos, color)
        super
        @symbol = :king
    end

    protected

    def move_dirs
        
    end
end

class Pawn < Piece
    def initialize(board, pos, color)
        super
        @symbol = :pawn
    end

    private

end

class NullPiece < Piece
    include Singleton
    def initialize(board, pos, color)
        super
        @symbol = :null
    end

    
end