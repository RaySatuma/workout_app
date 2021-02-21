class FavoritesController < ApplicationController

  def create
      post = Post.find(params[:favorite_id])
      current_user.fav(post)
      flash[:success] = 'いいねしました'
      redirect_back fallback_location: root_path
  end

  def destroy
      post = Post.find(params[:favorite_id])
      current_user.unfav(post)
      flash[:success] = 'いいねを解除しました'
      redirect_back fallback_location: root_path
  end
end
