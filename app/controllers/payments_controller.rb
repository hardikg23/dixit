class PaymentsController < ApplicationController

  def index
    @payments = Payment.includes(:entity, :sale).order('id desc').paginate(page: current_page, per_page: per_page)
  end

  def new
    @payment = Payment.new
    @sale = Sale.find_by_id(params[:sale_id])
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      flash[:notice] = 'payment successfully created.'
      redirect_to payments_path
    else
      flash[:error] = @payment.errors.full_messages.first
      render :new
    end
  end

  def edit
    @payment = Payment.find_by_id(params[:id])
  end

  def update
   @payment = Payment.find_by_id(params[:id])
    if @payment.update_attributes(payment_params)
      flash[:notice] = 'payment successfully updated.'
      redirect_to payments_path
    else
      flash[:error] = @payment.errors.full_messages.first
      render :edit
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:entity_id, :amount, :description, :from_person, :to_person,  :payment_type, :payment_date)
    end

end