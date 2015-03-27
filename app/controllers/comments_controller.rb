class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.build(comment_params)
    @comment.save
    respond_to do |format|
      format.html do 
        redirect_to @pin
      end
      format.js { }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @pin = @comment.pin
    @id = @comment.id
    @comment.destroy
    
    respond_to do |format|
      format.html do 
        redirect_to @pin
      end
      format.js { }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:user_id, :pin_id)
  end
end