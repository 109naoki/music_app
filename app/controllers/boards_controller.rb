class BoardsController < ApplicationController
  # skip_before_action :method_name, raise: false

    before_action :authenticate_user!,except: [:home]
    before_action :set_board, only: %i(show destroy)


    def home


    end

    def index
      @boards = Board.order(created_at: :desc).page(params[:page]).per(5)
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

      def show

      end

      def destroy
        if @board.user == current_user
            flash[:notice] = "投稿が削除されました" if @board.destroy
        else
            flash[:alert] = "投稿の削除に失敗しました"
        end
        redirect_to root_path
      end


    private
       def board_params
        params.require(:board).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
       end

       def set_board
        @board = Board.find_by(id: params[:id])
       end
  end
