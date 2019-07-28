class EntitiesController < ApplicationController

  def index
    @entities = Entity.order('id desc').paginate(page: current_page, per_page: per_page)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    if @entity.save
      flash[:notice] = 'entity successfully created.'
      redirect_to entities_path
    else
      flash[:error] = @entity.errors.full_messages.first
      render :new
    end
  end

  def edit
    @entity = Entity.find_by_id(params[:id])
  end

  def update
   @entity = Entity.find_by_id(params[:id])
    if @entity.update_attributes(entity_params)
      flash[:notice] = 'entity successfully updated.'
      redirect_to entities_path
    else
      flash[:error] = @entity.errors.full_messages.first
      render :edit
    end
  end

  private
    def entity_params
      params.require(:entity).permit(:name, :mobile, :address, :company_name)
    end

end