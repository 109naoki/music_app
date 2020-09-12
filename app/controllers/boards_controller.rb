class BoardsController < ApplicationController


  def home

  end
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    
  end

  def create
    Board.create(board_params)
  end

  def show
    @board = Board.find(params[:id])
  end

  private
   def board_params
    params.require(:board).permit(:name, :title, :body, :image)
   end
end
