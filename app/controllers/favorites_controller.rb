class FavoritesController < ApplicationController
before_action :set_id
  def create
      post = Post.find(params[:favorite_id])
      current_user.fav(post)
      count_like
  end

  def destroy
      post = Post.find(params[:favorite_id])
      current_user.unfav(post)
      count_like
  end



  private

  def set_id
    @post = Post.find(params[:favorite_id])
  end
end