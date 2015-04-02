class PinsController < ApplicationController
  before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
    binding.pry
  end

  def new
    @pin = current_user.pins.build
  end

  def show
  end

  def create
    @pin = current_user.pins.build(pin_params)
    binding.pry
    @pin.character = Character.find(params[:pin][:character])
    if @pin.save
      redirect_to @pin, notice: "Sucessfully created new Pin"
    else
      render 'new'
    end
  end

  def update
    @pin.character = Character.find(params[:pin][:character])
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin was sucessfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def upvote
    @pin.upvote_by current_user
    respond_to do |format|
      format.html do 
        redirect_to :back
      end
      format.js { }
    end
  end

  def downvote
    @pin.downvote_by current_user
    respond_to do |format|
      format.html do 
        redirect_to :back
      end
      format.js { }
    end
  end

  private
  def pin_params 
    params.require(:pin).permit(:title, :description, :image)
  end

  def find_pin
    @pin = Pin.find(params[:id])
  end

end
