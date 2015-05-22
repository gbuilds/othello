# Tests

require 'rspec'
require_relative 'othello.rb'

describe "Othello" do

	context "Game" do
		subject { Game.new }
	end

	context 'Board' do
		subject { Board.new }

		it "should create a new board object" do
			expect(subject.class).to eq Board
		end
		
		it 'responds to proper methods' do
			expect(subject).to respond_to(:rows)
			expect(subject).to respond_to(:cols)
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

	end

	context "Piece" do
		subject { Piece.new }

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
			piece = Piece.new
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