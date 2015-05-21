# Game file

class Game
end

class Board
	attr_accessor :rows, :cols, :board_grid

	def initialize
		@rows = 8
		@cols = 8
		@board_grid = Array.new(rows, 
			Array.new(cols, Space.new))
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
		attr_accessor :piece

	def initialize
		@piece = nil
	end

	def empty?
	end
end