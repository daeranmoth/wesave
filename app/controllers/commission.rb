class Commission
  INSURANCE_COMMISSION = 0.5
  ROADSIDE_ASSISTANCE_COMMISSION = 100 # 1€ = 100centimes
  COMMISSION_PERCENTAGE = 0.3

  attr_reader :price, :duration, :total_commission

  def initialize(rental)
    @price = rental.price
    @duration = rental.duration
    @total_commission = brute_commission
  end

  def brute_commission
    price * COMMISSION_PERCENTAGE
  end

  def insurance_commission
    (total_commission * INSURANCE_COMMISSION).to_i
  end

  def roadside_assistance_commission
    (duration * ROADSIDE_ASSISTANCE_COMMISSION).to_i
  end

  def drivy_commission
    (total_commission - insurance_commission - roadside_assistance_commission).to_i
  end

  def value
    {
      insurance_fee: insurance_commission,
      assistance_fee: roadside_assistance_commission,
      drivy_commission: drivy_commission
    }
  end
end
