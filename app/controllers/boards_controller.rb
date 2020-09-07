class BoardsController < ApplicationController


  def home

  end
  def index
  end

  def new
    @board = Board.new
    
  end

  def create
    Board.create(board_params)
    binding.pry
  end

  private
   def board_params
    params.require(:board).permit(:name, :title, :body, :image)
   end
end
