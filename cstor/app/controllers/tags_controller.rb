class TagsController < ApplicationController

  def new
  end

  def create
  end

  def show
    @tag = Tag.find(params[:id])
    @resources = @tag.resources
  end



end
