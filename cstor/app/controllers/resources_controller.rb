class ResourcesController < ApplicationController

  def index
    @resources = Resource.all.order(updated_at: :desc)
    @resources = @resources.page(params[:page]).per(8)
  end

  def secretindex
    @resources = Resource.order(updated_at: :desc)
    if current_user.admin == true
      @resources = @resources.secret_list
      render 'secret_index'
    else
      redirect_to '/'
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @tags = @resource.tags
    @likes = @resource.likes
  end


  def new
    if !current_user.admin
      redirect_to resources_path
    end
  end

  def create
    @resource = current_user.resources.new(resource_params)
    if @resource.save && current_user.admin
      # tags = tag_params[:tag].split(',').map! {|tag| tag.lstrip}
      # tags.each do |tag|
      #   if Tag.find_by(name: tag)
      #     @resource.tags << Tag.find_by(name: tag)
      #   else
      #     @resource.tags << Tag.create(name: tag)
      #   end
      # end
      @resource.arrayify_string(tag_params[:tag], @resource)
      redirect_to @resource, notice: "Your Resource was a success!"
    else
      @tags = tag_params[:tag]
      @errors = @resource.errors.full_messages
      render :new, status: 400
    end
  end

  def edit
    if !current_user.admin
      redirect_to resource_path
    end
   @resource = Resource.find(params[:id])
   @tags_string = @resource.stringify_tags(@resource.tags)
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.arrayify_string(tag_params[:tag], @resource)
    @resource.update_attributes(resource_params)
    if @resource.save
      redirect_to resource_path(@resource)
    else
      @errors = @resource.errors.full_messages
      render 'edit'
    end
  end

 def destroy
  if current_user.admin == true
    @resource = Resource.find(params[:id])
    @resource.destroy
  end
  redirect_to resources_path
end

private

def resource_params
  params.require(:resource).permit(:title, :abstract, :url, :teacher_only)
end

def tag_params
  params.require(:resource).permit(:tag)
end

end
