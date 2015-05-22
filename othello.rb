# Game file

class Game
	GAME_DIMENSIONS = { rows: 8, cols: 8 }

	# return coordinates for player's move
	# ABCDEFGH
	# 12345678
	# chessboard style coordinates

	def get_move
	end

	# You can't move onto an existing piece
	# Each move must have an adjacent piece
	# Each move must cause a piece to flip over
	# Diagonally, horizontally, or vertically
end

class Board
	attr_accessor :rows, :cols, :spaces, :board_grid

	def initialize(rows=Game::GAME_DIMENSIONS[:rows], 
				   cols=Game::GAME_DIMENSIONS[:cols])
		@rows = rows
		@cols = cols
		@spaces = []

		# Create an array within array
		# board_grid[row][col] = board_grid[space.y][space.x]
		@board_grid = Array.new(rows) do |row|
					  	Array.new(cols) do |col|
					  		space = Space.new(col, row)
					  		@spaces << space
					  		space
					  	end
				  end
		self.setup_pieces
 	end

 	def setup_pieces
 		# Create 4 pieces in board center to start game
 		space = board_grid[3][3]
 		space.piece = Piece.new("black")
 		space = board_grid[3][4]
 		space.piece = Piece.new("white")
 		space = board_grid[4][4]
 		space.piece = Piece.new("black")
 		space = board_grid[4][3]
 		space.piece = Piece.new("white")
 	end

 	# get the neighboring space in directions y, x from space
 	def get_neighbor(space, change_y, change_x)
 		board_grid[space.y + change_y][space.x + change_x]
 	end

end

class Piece
	attr_accessor :color

	def initialize(color="black")
		@color = color
	end

	# Flip the color of a piece between black and white
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
		@piece.nil?
	end

	def occupied?
		!empty?
	end
end