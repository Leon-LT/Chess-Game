module Slideable
    HORIZONTAL_VERTICAL_DIRS = [[0,1], [1,0], [0, -1], [-1, 0]]
    DIAGONAL_DIRS = [[1,1], [-1,1], [1,-1], [-1,-1]]

    def horizontal_vertical_dirs
        HORIZONTAL_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves_arr = []
        move_dirs.each do |pos|
            x, y = pos
            moves_arr += grow_unblocked_moves_in(x, y)
        end
        moves_arr
    end

    private 

    def move_dirs
        raise NotImplemented
    end

    def grow_unblocked_moves_in(x, y)
        coor_x, coor_y = @pos
        coor_x += x
        coor_y += y
        moves = []
        until !@board.valid_pos?([coor_x, coor_y])
            piece = @board[[coor_x,coor_y]]
            break if piece.color != self.color && !piece.is_a?(NullPiece)
            moves << [coor_x, coor_y]
            coor_x, coor_y = coor_x + x, coor_y + y
        end 
        moves
    end
end