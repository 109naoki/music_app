class BoardsController < ApplicationController
    before_action :authenticate_user!

    def index
     @boards = Board.limit(10).includes(:photos, :user).order("created_at DESC")
    end   
    def new
        @board = Board.new
        @board.photos.build
      end

      def create
        @board = Board.new(board_params)
        if @board.photos.present?
          @board.save
          redirect_to root_path
          flash[:notice] = "投稿が保存されました"
        else
          redirect_to root_path
          flash[:alert] = "投稿に失敗しました"
        end
      end

    private
    def board_params
        params.require(:board).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
    end
end
