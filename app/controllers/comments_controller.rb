class CommentsController < ApplicationController
  before_action :require_user_logged_in

 
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comments = @post.comments
    @userf = @post.user_id
    @user = User.find_by(id: @userf)
    
    if @comment.save
      @comment = Comment.new
      flash.now[:success] = 'コメントしました。'
    else
      flash.now[:success] = 'コメントできませんでした。'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @userf = @post.user_id
    @user = User.find_by(id: @userf)
    @comments = @post.comments
    @comment = Comment.find(params[:id])
    if @comment.destroy
      @comment = Comment.new
      flash.now[:success] = 'コメントを削除しました。'
    else
      flash.now[:danger] = "コメント削除に失敗しました。"
      render :post
    end
  end


private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
