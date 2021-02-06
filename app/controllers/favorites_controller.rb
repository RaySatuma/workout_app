class FavoritesController < ApplicationController

  def create
      post = Post.find(params[:favorite_id])
      current_user.fav(post)
      flash[:success] = 'いいねしました'
      redirect_to current_user
  end

  def destroy
      post = Post.find(params[:favorite_id])
      current_user.unfav(post)
      flash[:success] = 'いいねを解除しました'
      redirect_to current_user
  end
end
