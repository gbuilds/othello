# Game file

class Game
end

class Board
	attr_accessor :rows, :cols, :board_grid

	def initialize(rows=8, cols=8)
		@rows = rows
		@cols = cols
		@board_grid = Array.new(rows) do |row|
					  	Array.new(cols) do |col|
					  		Space.new(col, row)
					  	end
					  end

 	end
end

class Piece
	attr_accessor :color

	def intialize(color)
		@color = color
	end

	def flip
		@color = @color == "black" ? "white" : "black";
	end
end

class Space
		attr_accessor :piece, :x, :y

	def initialize(y=0, x=0)
		@x = x
		@y = y
		@piece = nil
	end

	def empty?
		@piece.nil
	end

	def occupied?
		!empty?
	end
end