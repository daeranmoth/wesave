require 'date'
class Rental
  attr_reader :car, :start_date, :end_date, :distance

  def initialize(car, start_date, end_date, distance)
    @car = car
    @start_date = start_date
    @end_date = end_date
    @distance = distance
  end

  def duration
    # on calcule la durée en nombre de jours
    1 + (Date.parse(end_date) - Date.parse(start_date)).to_i
  end

  def distance_price
    # on calcule le prix pour une distance et une voiture donnée
    distance * car.price_per_km
  end

  def discount_prices(day)
    if day.zero?
      1
    elsif day >= 1 && day < 4
      0.9
    elsif day >= 4 && day < 10
      0.7
    else
      0.5
    end
  end

  def duration_price
    # on calcule le prix remisé (ou pas) pour une durée et une voiture donnée
    price = 0
    duration.times do |current_day|
      price += car.price_per_day * discount_prices(current_day)
    end
    price
  end

  def price
    # on calcule le prix final
    (distance_price + duration_price).to_i
  end
end
