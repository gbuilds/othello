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
			p subject.board_grid
		end

	end

	context 'Piece' do
		subject { Piece.new }

		it 'responds to proper methods' do
			expect(subject).to respond_to(:color)
			expect(subject).to respond_to(:flip)
		end
	end

	context "Space" do
		subject { Space.new }

		it "responds to proper methods" do
			expect(subject).to respond_to(:x)
			expect(subject).to respond_to(:y)
			expect(subject).to respond_to(:piece)
			expect(subject).to respond_to(:empty?)
		end
	end
end



# Board with array of 8 by 8
# [ [ nil, nil, nil, nil, nil, nil, nil, nil],
# [], [], []]