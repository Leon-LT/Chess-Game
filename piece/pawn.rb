require_relative "piece"
class Pawn < Piece

    def symbol
        case @color
        when :white
            "♟︎".white
        else 
            "♟︎".light_black
        end
    end

    def moves
        forward_steps + side_attacks
    end

    private

    def at_start_row?
        coor_y = @pos[0]
        return true if coor_y == 1 || coor_y == 6
        false
    end

    def forward_dir
        @color == :white ? -1 : 1
    end

    def forward_steps
        steps = []
        next_step = [@pos[0] + forward_dir, @pos[1]]
        return steps if !@board.valid_pos?(next_step)
        steps << next_step 

        second_next_step = [@pos[0] + 2 * forward_dir, @pos[1]]
        steps << second_next_step if at_start_row?
        steps
    end

    def side_attacks
        y, x = @pos

        side_moves = [[y + forward_dir, x - 1], [y + forward_dir, x + 1]]

        side_moves.select do |new_pos|
        next false unless @board.valid_pos?(new_pos)
        next false if @board[new_pos].empty?

        threatened_piece = @board[new_pos]
        threatened_piece && threatened_piece.color != color
        end
    end
end