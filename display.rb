require "colorize"
require_relative "cursor"

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        grid = symbol_grid
        y, x =  @cursor.cursor_pos
        if @cursor.toggled == true
            grid[y][x] = grid[y][x].colorize( :background => :yellow )
        else
            grid[y][x] = grid[y][x].colorize( :background => :green )
        end
        grid.each { |row| puts row.join("")}
        true
    end

    def color_tile(y_coor, x_coor)
        return :light_black if x_coor.even? == y_coor.even?
        :light_blue
    end


    def symbol_grid
        grid = []
        @board.rows.each_with_index do |row, y_idx|
            grid_row = []
            row.each_with_index do |piece, x_idx|
                symbol = " #{piece.symbol} "
                grid_row << symbol.colorize(:background => color_tile(y_idx, x_idx))
            end
            grid << grid_row
        end
        grid
    end
end