class Sale < ApplicationRecord

  enum sale_type: {polish: 1, rough: 2}
  enum payment_type: {cash_payment: 1, cheque_payment: 2, angadia_payment: 3}
  enum amount_type: {rupees: 1, dollar: 2}
  enum state: {active: 1, deleted: 2}
  

  belongs_to :entity
  has_many :payments, as: :paymentable

  validates_presence_of :entity_id, :quantity, :amount, :payment_type

  def final_quantity
    self.quantity - self.return_quantity
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
