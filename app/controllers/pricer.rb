require './car'
require './rental'
require './commission'

class Pricer
  attr_reader :cars, :rentals

  def initialize(cars, rentals)
    @cars = cars
    @rentals = rentals
  end

  def all_cars
    # on instancie toutes les voitures dans le hash result
    result = {}
    cars.each do |car|
      result[car['id']] = Car.new(car['price_per_day'], car['price_per_km'])
    puts result
    end
    result
  end

  def all_rental_prices
    cars = all_cars
    rentals.map do |r|
      # on instancie une rental par voiture
      rental = Rental.new(cars[r['car_id']], r['start_date'], r['end_date'], r['distance'])
      # on instancie une commission par rental
      commission = Commission.new(rental)
      # on instancie toutes les rentals dans ce hash
      {
        id: r['id'],
        price: rental.price,
        commission: commission.value
      }
    end
  end
end
