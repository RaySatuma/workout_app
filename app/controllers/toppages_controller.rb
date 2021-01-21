class ToppagesController < ApplicationController
  def index
    @users = User.all
  end
end
