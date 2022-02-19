module Stepable
    def moves
        moves_arr = []
        move_diffs.each do |move|
            next_move = [move[0] + @pos[0], move[1] + @pos[1]]
            moves_arr << next_move if @board.valid_pos?(next_move)
        end
        moves_arr
    end

    private

    def move_diffs(x, y)
        raise NotImplemented
    end
end