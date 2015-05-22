# Tests

require 'rspec'
require_relative 'othello.rb'

describe "Othello" do

	let!(:board) { Board.new }
  let!(:space) { Space.new(1, 1) }

	context "Game" do
		subject { Game.new }

		# Get player's move
		# Is the space empty?

		# Check if valid move and pieces that should be flipped
		# Is the space to the north empty, opponent or friendly
		# If empty, go next direction
		# If opponent, check next square
		# If friendly, go next direction
		# If valid flip the pieces over
		# If a player can't move the game is over
		# Whoever has the most pieces of their color wins the game
	end

	context 'Board' do
		subject { Board.new }

		it "should create a new board object" do
			expect(subject.class).to eq Board
		end
		
		it 'responds to proper methods' do
			expect(subject).to respond_to(:rows)
			expect(subject).to respond_to(:cols)
			expect(subject).to respond_to(:spaces)
			expect(subject).to respond_to(:board_grid)
		end

		it "contains a board grid" do
			expect(subject.board_grid.is_a?(Array)).to be true
			subject.board_grid.each do |row|
				expect(row.is_a?(Array)).to be true
				row.each do |col|
					expect(col.is_a?(Space)).to be true
				end
			end
		end

		it "returns a neighboring space" do
			neighbor = subject.board_grid[0][1]
			expect(subject.get_neighbor(space, -1, 0)).to eq neighbor
		end

		it "checks the value of an adjacent space" do
			neighbor = subject.board_grid[0][1]
			neighbor.piece = Piece.new("black")
			expect(subject.get_neighbor(space, -1, 0).occupied?).to be true
			expect(subject.get_neighbor(space, -1, 0).piece.color).to eq "black"
		end

		it "contains 4 starting pieces in the center spaces" do
			expect(subject.board_grid[3][3].piece.color).to eq "black"
			expect(subject.board_grid[3][4].piece.color).to eq "white"
			expect(subject.board_grid[4][4].piece.color).to eq "black"
			expect(subject.board_grid[4][3].piece.color).to eq "white"
		end

	end

	context "Piece" do
		subject { Piece.new("black") }

		it "responds to proper methods" do
			expect(subject).to respond_to(:color)
			expect(subject).to respond_to(:flip)
		end

		it "changes color when flipped" do
			subject.color = "black"
			subject.flip
			expect(subject.color).to eq "white"
			subject.flip
			expect(subject.color).to eq "black"
		end

	end

	context "Space" do
		subject { Space.new }

		it "responds to proper methods" do
			expect(subject).to respond_to(:x)
			expect(subject).to respond_to(:y)
			expect(subject).to respond_to(:piece)
			expect(subject).to respond_to(:empty?)
			expect(subject).to respond_to(:occupied?)
		end

		it "returns its piece object" do
			piece = Piece.new("black")
			subject.piece = piece
			expect(subject.piece).to eq piece
		end

		it "#empty returns true if space is empty" do
			subject.piece = nil
			expect(subject.empty?).to be true
		end

		it "#occupied returns true if space is occupied" do
			subject.piece = Piece.new
			expect(subject.occupied?).to be true
		end
	end
end



# Board with array of 8 by 8
# [ [ nil, nil, nil, nil, nil, nil, nil, nil],
# [], [], []]