require_relative "human_player"
require_relative "board"
require_relative "display"
require "byebug"
Dir["./piece/*.rb"].each {|file| require file }

class Game
    attr_reader :board
    def initialize
        @board = Board.new
        @board.place_pieces
        @players = {"Player1" => HumanPlayer.new(:black, Display.new(@board)), "Player2" => HumanPlayer.new(:white, Display.new(@board)), }
        @current_player = @players["Player1"]
    end

    def play
        until @board.checkmate?(:black) || @board.checkmate?(:white) 
            system("clear")
            begin
                puts "#{@current_player.color} make your move using WASD and confirm with space or enter"
                sleep(1.5)
                @current_player.make_move(@board) 
                swap_player
            rescue => e
                puts e
                retry
            end
        end
        puts "Congratulation, #{current_player} you won!"
    end

    protected

    def swap_player
        @players["Player1"] == @current_player ? @current_player = @players["Player2"] : @current_player = @players["Player1"] 
    end

end