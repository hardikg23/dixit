module ApplicationHelper

  def get_conversion_rate(payments)
    total_o = 0
    total = 0
    payments.each do |p|
      total_o = total_o + (p.amount*p.conversion_rate) if p.amount_type == 'dollar'
      total = total + p.amount
    end
    return (total_o/total).round(2)
  end

end
