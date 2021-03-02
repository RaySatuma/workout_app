class FavoritesController < ApplicationController

  def create
      post = Post.find(params[:favorite_id])
      current_user.fav(post)
  end

  def destroy
      post = Post.find(params[:favorite_id])
      current_user.unfav(post)
  end



  private

  def set_id
    @post = Post.find(params[:id])
  end
end