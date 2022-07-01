require 'json'
require './pricer'
class Executor
  def initialize(input_file)
    data = JSON.parse(File.read(input_file))
    # on convertit en hash puis on assigne à la variable @cars la partie du JSON avec la clé cars
    @cars = data['cars']
    # on convertit en hash puis on assigne à la variable @rentals la partie du JSON avec la clé rentals
    @rentals = data['rentals']
  end

  def output(path)
    pricer = Pricer.new(@cars, @rentals)
    output_data = { rentals: pricer.all_rental_prices }
    File.open(path, 'w') do |f|
      f.write(JSON.pretty_generate(output_data))
    end
  end
end

Executor.new('data/input.json').output('data/output.json')
