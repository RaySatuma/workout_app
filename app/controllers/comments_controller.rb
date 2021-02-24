class CommentsController < ApplicationController
  before_action :require_user_logged_in

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'コメントしました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = 'コメントできませんでした。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'コメントを削除しました。'
      redirect_back(fallback_location: root_path)
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
