class DieMode
  FOUR=1
  EIGHT=2
end

class Direction
  NORTH=1
  EAST=2
  SOUTH=3
  WEST=4
  NORTHEAST=5
  SOUTHEAST=6
  SOUTHWEST=7
  NORTHWEST=8
end

class Die
  def initialize (mode)
    @mode = mode
  end

  def spin
    if @mode==DieMode::FOUR
      return Random.rand(4)

    end

    if @mode==DieMode::EIGHT
      return Random.rand(8)
    end

    return 0
  end
end

my_die=Die.new(DieMode::FOUR)
counter=0
while counter <20
  result=my_die.spin
  puts result.to_s
  counter = counter+1
end
my_die2=Die.new(DieMode::EIGHT)
counter=0
while counter <20
  result=my_die2.spin
  puts result.to_s
  counter = counter+1
end