class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @pin = Pin.find(params[:pin_id])
    @comment = @pin.comments.build(comment_params)
    @comment.save

    respond_to do |format|
      format.js { }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @pin = Pin.find(params[:pin_id])
    @comment.destroy
    redirect_to @pin
    # respond_to do |format|
    #   format.js { }
    # end

    # render :nothing =>true, :status => 204  
  end

  private
  def comment_params
    params.require(:comment).permit(:content,:user_id, :pin_id)
  end
end