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
            y, x = pos
            moves_arr += grow_unblocked_moves_in(y, x)
        end
        moves_arr
    end

    private 

    def move_dirs
        raise NotImplemented
    end

    def grow_unblocked_moves_in(y, x)
        coor_y, coor_x = @pos
        coor_x += x
        coor_y += y
        moves = []
        while @board.valid_pos?([coor_y, coor_x])
            pos = [coor_y, coor_x]
            if @board[pos].empty?
                moves << pos
            else
                moves << pos if @board[pos].color != color
                break
            end
            coor_y += y
            coor_x += x
        end
        moves
    end
end