class SomeOtherClass
    attr_reader :trip, :driver, :mechanic, :trip_coord
    def initialize
        @mechanic = Mechanic.new
        @trip_coord = TripCoordinator.new
        @driver = Driver.new

        @trip = Trip.new
        
    end

    def run
        trip.prepare([mechanic, trip_coord, driver])
    end
end

class Trip
    attr_reader :bicycles, :customers, :vehicle
    def initialize
        bicycles = ''
        customers = ''
        vehicle = ''
    end

    def prepare(preparers)
        preparers.each do |preparer|
            preparer.prepare_trip(self)
        end
    end
end

class Mechanic
    def initialize
    end
    def prepare_bicycles(bicycles)
        puts "I'm the mechanic"
        # bicycles.each { |bicycle| prepare_bicycle(bicycle) }
    end

    def prepare_bicycle(bicycle)

    end

    def prepare_trip(trip)
        prepare_bicycles(trip.bicycles)
    end
        
end

class TripCoordinator
    def initialize
    end
    def buy_food(customers)
        puts "I'm buying food"
        # customers.each { |customer| get_food(customer) }
    end

    def prepare_trip(trip)
        buy_food(trip.customers)
    end
end

class Driver
    def initialize
    end
    def gas_up(vehicle)
        puts "I'm getting gas"
    end

    def fill_water_tank(vehicle)
        puts "Filling up water tank"
    end

    def check_seating(vehicle)
        puts "Enough seats there are!"
    end

    def prepare_trip(trip)
        vehicle = trip.vehicle
        gas_up(vehicle)
        fill_water_tank(vehicle)
        check_seating(vehicle)
    end
end

some_class = SomeOtherClass.new
some_class.run
