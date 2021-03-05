class RelationshipsController < ApplicationController
  before_action :require_user_logged_in, :set_id
  
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    @msg = "#{user.name}さんをフォローしました。"
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    @msg = "{user.name}さんのフォローを解除しました。"
  end

private

  def set_id
    @user = User.find(params[:follow_id])
  end
end