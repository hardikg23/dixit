class SalesController < ApplicationController
  before_action :find_sale, only: [:edit, :update, :destroy]

  def index
    if display_cheque?
      @sales = Sale.includes(:entity).active.cheque_payment.order('id desc').paginate(page: current_page, per_page: per_page)
    else
      @sales = Sale.includes(:entity).active.order('id desc').paginate(page: current_page, per_page: per_page)
    end
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

  def destroy
    if @sale.update_attributes(state: 2)
      flash[:notice] = 'sale successfully deleted.'
    else
      flash[:notice] = 'error on sale delete.'
    end
    redirect_to sales_path
  end

  private
    def find_sale
      @sale = Sale.find_by_id(params[:id])
      if @sale.blank?
        flash[:error] = 'invalid sale'
        redirect_to sales_path
      end
    end

    def sale_params
      params.require(:sale).permit(:entity_id, :sale_type, :description, :broker_name, :quantity, :return_quantity, :percent_output, :amount, :amount_type, :conversion_rate, :payment_type, :payment_date, :terms, :invoice_number)
    end

end