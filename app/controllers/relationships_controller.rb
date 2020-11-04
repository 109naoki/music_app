class RelationshipsController < ApplicationController

    def follow
        current_user.follow(params[:id])
        redirect_to user_path
        flash[:notice] = "フォローが完了しました"
      end

      def unfollow
        current_user.unfollow(params[:id])
        redirect_to user_path
        flash[:notice] = "フォロー解除が完了しました"
      end
end
