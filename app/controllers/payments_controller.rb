class PaymentsController < ApplicationController
  before_action :find_parent, only: [:new, :create, :edit, :update]

  def new
    @payment = Payment.new
    @payments = @parent.payments
  end

  def create
    @payment = @sale.payments.new(payment_params)
    @payment.entity_id = @sale.entity_id
    if @payment.save
      flash[:notice] = 'payment successfully created.'
      redirect_to (@sale.present? ?  sales_path : purchases_path)
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
      redirect_to (@payment.paymentable_type == 'Sale' ? sales_path : purchases_path)
    else
      flash[:error] = @payment.errors.full_messages.first
      render :edit
    end
  end

  private
    def payment_params
      params.require(:payment).permit(:amount, :description, :from_person, :to_person,  :payment_type, :payment_date)
    end

    def find_parent
      if params[:sale_id].present?
        @parent = @sale = Sale.find_by_id(params[:sale_id])
      else params[:sale_id].present?
        @parent = @sale = Sale.find_by_id(params[:sale_id])
      end
    end

end