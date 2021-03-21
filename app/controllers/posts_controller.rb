class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :destroy]
  before_action :correct_user, only: [:destroy]

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(9)
  end
  
  def show
    @post = Post.find(params[:id])
    @video_id = youtube_video_id
    @userf = @post.user_id
    @user = User.find_by(id: @userf)
    @comments = @post.comments
    @comment = @post.comments.build
    count_like
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
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:success] = '投稿を更新しました。'
      redirect_to @post
    else
      flash.now[:danger] = '投稿が更新できませんでした。'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_to root_url
  end

  private

    def post_params
      params.require(:post).permit(:content,:title,:youtube_url,:note, :target_muscle)
    end

    def tag_params
      params.require(:tag_).permit(:tag)
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

    def save_tag(post_tags)
      post_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  
  end
  end
