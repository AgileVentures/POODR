class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end
puts Gear.new(52, 11).ratio
puts Gear.new(30, 27).ratio
puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches
puts Gear.new(52, 11, Wheel.new(24, 1.25)).gear_inches

