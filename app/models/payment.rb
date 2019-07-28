class Payment < ApplicationRecord
  enum payment_type: {cash_payment: 1, cheque_payment: 2, angadia_payment: 3}
  enum amount_type: {rupees: 1, dollar: 2}
  

  belongs_to :entity
  belongs_to :paymentable, polymorphic: true

  validates_presence_of :entity_id, :amount
end
