require "colorize"
require_relative "cursor"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        grid = symbol_grid
        y, x =  @cursor.cursor_pos
        grid[y][x] = grid[y][x].colorize( :background => :light_blue )
        grid.each { |row| puts row.join(" ")}
        true
    end

    def test
        bo = true
        while bo
            @cursor.get_input
            render
        end
    end

    def symbol_grid
        grid = []
        @board.rows.each do |row|
            grid_row = []
            row.each do |piece|
                grid_row << piece.symbol
            end
            grid << grid_row
        end
        grid
    end
end