class Purchase < ApplicationRecord
  enum sale_type: {polish: 1, rough: 2}
  enum payment_type: {cash_payment: 1, cheque_payment: 2, angadia_payment: 3}
  enum amount_type: {rupees: 1, dollar: 2}
  
  belongs_to :entity, optional: true
  has_many :payments, as: :paymentable

  validates_presence_of :amount_type, :sale_type, :payment_type

end
