class RelationshipsController < ApplicationController
  before_action :require_user_logged_in, :set_id
  
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash.now[:success] = "#{user.name}さんをフォローしました"
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash.now[:success] = "#{user.name}さんのフォローを解除しました"
  end

private

  def set_id
    @user = User.find(params[:follow_id])
  end
end