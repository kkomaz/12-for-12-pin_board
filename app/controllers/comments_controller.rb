class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.pin_id = params[:pin_id]
    @comment.save
    redirect_to pin_path(@comment.pin)
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:user_id)
  end

end
