require 'singleton'

class TicTacToe
	class IdiotError < Exception
	end
	include Singleton

	def initialize
		@board = [ '1', '2', '3', '4', '5', '6', '7', '8', '9']
		@player1 = true
	end

	def draw_board
		@board.each_slice(3) {|row|  
			print row.join(" | ") + "\n"
			print dashes unless row.include? ("9")
		}
	end

	def player_turn
		print "\n#{@player1? "Player 1" : "Player 2"}, enter a number _\b"
		cell = gets.chomp
		begin	
			raise IdiotError.new("\nFACEPALM\n") unless @board.include? cell || cell >'9' || cell<'1' 
			@board[cell.to_i-1] = player_mark
			rescue Exception => e
				puts e.message + "You've ran IdiotError - Congratulations!\nYour turn has ended.\n\n"
			ensure
				next_player
		end
	end
	def winner
		@player1 ? "Player 2" : "Player 1"
	end
	def finished?
		return true if tie? || win?
		false
	end

	def next_player
		@player1 = !@player1
	end

	def player_mark
		@player1? 'x' : 'o'
	end

	def dashes
		"\-"*9 + "\n"
	end

	def player1_playing?
		@player1
	end

	def strike_horizontal?
		rows.each {|line| 
			return true if line.all? {|item| item=='o'}
			return true if line.all? {|item| item=='x'}
		}
		false	
	end
	def strike_vertical?
		columns.each {|line| 
			return true if line.all? {|item| item=='o'}
			return true if line.all? {|item| item=='x'}
			
		}
		false
	end
	def strike_diagonal?
		diagonal.each {|line| 
			return true if line.all? {|item| item=='o'}
			return true if line.all? {|item| item=='x'}
		}
		false
	end

	def strikes
		strike_horizontal?|| strike_diagonal?|| strike_vertical?
	end

	def win?
		strikes
	end
	def tie?
		win? != true && @board.none? {|x| x.to_i !=0}
	end
	private
	
	def rows
		@board.each_slice(3)
	end

	def columns
		vertics = Array.new
		(0..2).each { |add|  
			vertics << [@board[0+add],@board[3+add],@board[6+add]]
		}
		return vertics
	end

	def diagonal
		diagonals = Array.new
		number = 0
		2.times {
			diagonals << [@board[0+number],@board[4],@board[8-number]]
			number=2
		}
		return diagonals
	end
end

	#def intro
	#	puts "Player 1 = x"
	#	puts "Player !2 = o"
	#	order = [ "Player 1 is first" , "Player 2 is first"]
	#	puts  order.sample
	#end
	