class SalesController < ApplicationController

  def index
    @sales = Sale.includes(:entity).order('id desc').paginate(page: current_page, per_page: per_page)
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      flash[:notice] = 'sale successfully created.'
      redirect_to sales_path
    else
      flash[:error] = @sale.errors.full_messages.first
      render :new
    end
  end

  def edit
    @sale = Sale.find_by_id(params[:id])
  end

  def update
   @sale = Sale.find_by_id(params[:id])
    if @sale.update_attributes(sale_params)
      flash[:notice] = 'sale successfully updated.'
      redirect_to sales_path
    else
      flash[:error] = @sale.errors.full_messages.first
      render :edit
    end
  end

  private
    def sale_params
      params.require(:sale).permit(:entity_id, :sale_type, :description, :broker_name, :quantity, :return_quantity, :percent_output, :amount, :amount_type, :conversion_rate, :payment_type, :payment_date, :terms)
    end

end