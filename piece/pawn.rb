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
        coor_y = @pos[1]
        return 2 if coor_y == 1 || coor_y == 6
        1
    end

    def forward_dir
        @color == :white ? 1 : -1
    end

    def forward_steps
        steps = []
        at_start_row?.times do |i|
            steps << [@pos[0], @pos[1] + forward_dir]
        end
        steps
    end

    def side_attacks
        sides = [@pos[0] + 1, @pos[1] + 1], [@pos[0] - 1, @pos[1] + 1]
        moves = []
        sides.each do |side|
            next if !@board.valid_pos?(side) || @board[side].color == self.color
            if @board.valid_pos?(side) && !@board[side].is_a?(NullPiece)
                moves << side
            end
        end
        moves
    end
end