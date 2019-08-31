class Payment < ApplicationRecord
  enum payment_type: {cash_payment: 1, cheque_payment: 2, angadia_payment: 3}
  enum amount_type: {rupees: 1, dollar: 2}
  enum state: {active: 1, deleted: 2}

  belongs_to :entity
  belongs_to :paymentable, polymorphic: true

  validates_presence_of :entity_id, :amount

  after_save :update_sale_or_purchase

  def update_sale_or_purchase
    parent = self.paymentable
    all_payment_sum = parent.payments.active.sum(:amount)
    if parent.class == Sale
      parent.update_columns(total_received: all_payment_sum)
    else
      parent.update_columns(total_paid: all_payment_sum)
    end
  end

  def get_payment_type
    if self.cash_payment?
      'CASH'
    elsif self.cheque_payment?
      'CHEQUE'
    else
      'ANGADIA'
    end
  end

end
