class PurchasesController < ApplicationController

  def index
    if display_cheque?
      @purchases = Purchase.order('id desc').cheque_payment.paginate(page: current_page, per_page: per_page)
    else
      @purchases = Purchase.order('id desc').paginate(page: current_page, per_page: per_page)
    end
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      flash[:notice] = 'purchase successfully created.'
      redirect_to purchases_path
    else
      flash[:error] = @purchase.errors.full_messages.first
      render :new
    end
  end

  def edit
    @purchase = Purchase.find_by_id(params[:id])
  end

  def update
   @purchase = Purchase.find_by_id(params[:id])
    if @purchase.update_attributes(purchase_params)
      flash[:notice] = 'purchase successfully updated.'
      redirect_to purchases_path
    else
      flash[:error] = @purchase.errors.full_messages.first
      render :edit
    end
  end

  private
    def purchase_params
      params.require(:purchase).permit(:entity_id, :description, :sale_type, :quantity, :amount, :amount_type, :payment_type, :conversion_rate, :payment_date, :purchase_date)
    end

end