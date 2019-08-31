class PurchasesController < ApplicationController
  before_action :find_purchase, only: [:edit, :update, :destroy]

  def index
    if display_cheque?
      @purchases = Purchase.order('id desc').active.cheque_payment.paginate(page: current_page, per_page: per_page)
    else
      @purchases = Purchase.order('id desc').active.paginate(page: current_page, per_page: per_page)
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
  end

  def update
    if @purchase.update_attributes(purchase_params)
      flash[:notice] = 'purchase successfully updated.'
      redirect_to purchases_path
    else
      flash[:error] = @purchase.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    if @purchase.update_attributes(state: 2)
      flash[:notice] = 'purchase successfully deleted.'
    else
      flash[:notice] = 'error on purchase delete.'
    end
    redirect_to purchases_path
  end

  private
    def find_purchase
      @purchase = Purchase.find_by_id(params[:id])
      if @purchase.blank?
        flash[:error] = 'invalid purchase'
        redirect_to purchases_path
      end
    end

    def purchase_params
      params.require(:purchase).permit(:entity_id, :description, :sale_type, :quantity, :amount, :amount_type, :payment_type, :conversion_rate, :payment_date, :purchase_date)
    end

end