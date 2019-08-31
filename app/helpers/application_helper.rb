module ApplicationHelper

  def get_conversion_rate(payments)
    total_o = 0
    total = 0
    payments.each do |p|
      if p.amount_type == 'dollar'
        total_o = total_o + (p.amount*p.conversion_rate)
        total = total + p.amount
      end
    end
    if total == 0
      return {rate: 0, total: total} 
    else
      return {rate: (total_o/total).round(2), total: total} 
    end
  end

end
