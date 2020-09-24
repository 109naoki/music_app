class LikesController < ApplicationController
    before_action :authenticate_user!


    def create
        @like = current_user.likes.build(like_params)
        @board = @like.board
        if @like.save
          respond_to :js
        end
      end

      def destroy
        @like = Like.find_by(id: params[:id])
        @board = @like.board
        if @like.destroy
          respond_to :js
        end
      end
    
      private
        def like_params
          params.permit(:board_id)
        end
    end