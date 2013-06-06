require_relative 'tic.rb'
class Game
	include Singleton
	def initialize
		@game = TicTacToe.instance
	end

	def play
		while true
			@game.draw_board
			@game.player_turn
			break if @game.finished?
		end
		@game.draw_board
		print @game.tie? ?  "It's a tie" : "Winner is : #{@game.winner}"

	end
end
tic = Game.instance
tic.play