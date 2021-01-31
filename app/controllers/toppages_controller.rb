class ToppagesController < ApplicationController
  def index
    @user = User.all
    
    if logged_in?
      @post = current_user.posts.build #空のインスタンスを代入（投稿フォーム用）。
      @posts = current_user.posts.order(id: :desc).page(params[:page])
    end
  end
end
