require_relative "player"
class HumanPlayer < Player
    def make_move(board)
        cursor_positions = [nil, nil]

        cursor_positions.each_with_index do |pos, i|
            until cursor_positions[i].is_a?(Array)
                system("clear")
                @display.render
                cursor_positions[i] = @display.cursor.get_input
            end
        end
        board.move_piece!(@color, cursor_positions[0], cursor_positions[1])
        rescue => e
            puts e
            sleep(1)
            retry
    end

end