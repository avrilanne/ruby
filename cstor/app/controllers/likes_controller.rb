class LikesController < ApplicationController
  def new
  end

  def create
    path = URI(request.referer).path
    @like = Like.new(liker_id: current_user.id, resource_id: params[:resource_id])
    if @like.save
      redirect_to :back
    else
      flash[:notice] = "There was an error"
      redirect_to path
    end
  end

  def destroy
    path = URI(request.referer).path
    @like = Like.find_by(liker_id: current_user.id, resource_id: params[:resource_id])
    @like.destroy
    redirect_to :back
  end
end
