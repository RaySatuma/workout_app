class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
    @posts =  Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @video_id = youtube_video_id
  end
  
  def new 
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      @posts = current_user.feed_posts.order(id: :desc).page(params[:page]) 
      flash.now[:danger] = 'メッセージの投稿に失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_back(fallback_location: root_path)
  end

  private

    def post_params
      params.require(:post).permit(:content,:title,:youtube_url,:note)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      unless @post
        redirect_to root_url
      end
    end

    def youtube_video_id
      # YoutubeのURLの正規表現
      yt_Regexp = /(https\:\/\/)?(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)/
      @post.youtube_url.slice!(yt_Regexp)
      @post.youtube_url.first(11)
    end

  end
