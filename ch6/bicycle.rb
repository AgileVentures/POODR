module Schedulable 
  attr_reader :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date) 
    schedule.scheduled?(self, start_date, end_date)
  end

  def lead_days
    0
  end
end



class Bicycle
  include Schedulable

  attr_reader :size, :parts

  def initialize(args={})
    @size       = args[:size]
    @parts      = args[:parts]
  end
  
  def spares
    parts.spares
  end

  def lead_days
    1
  end
end

require 'forwardable'
class Parts

  attr_reader :parts
  extend Forwardable
  def_delegators :parts, :each, :size
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    select { |part| part.needs_spare }
  end
end

class Part 
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end

  def <=> other_obj
    name <=> other_obj.name
  end
end


class Schedule
  def scheduled?(schedulable, start_date, end_date)
      puts "This #{schedulable.class} " +
           "is not scheduled\n" +
           " between #{start_date} and #{end_date}"
      false
  end
end

chain = Part.new(name: 'chain', description: '10-speed')

road_tire = Part.new(name: 'tire_size', description: '23')

tape = Part.new(name: 'tape_color', description: 'red')

mountain_tire = 
  Part.new(name: 'tire_size', description: '2.1')

rear_shock =
  Part.new(name: 'rear_shock', description: 'Fox')

front_shock = 
  Part.new(
    name: 'front_shock',
    description: 'Manitou',
    needs_spare: false
  )

road_bike = 
  Bicycle.new(
    size: 'L',
    parts: Parts.new([chain,
                      road_tire,
                      tape])
  )

mountain_bike = 
  Bicycle.new(
    size: 'L',
    parts: Parts.new([chain,
                      mountain_tire])
  )

p road_bike.size

p road_bike.spares



p road_bike.parts.first

p road_bike.parts.size


p road_bike.parts.sort