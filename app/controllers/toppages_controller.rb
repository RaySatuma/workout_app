class ToppagesController < ApplicationController
  def index
    @user = User.all
  end
end
