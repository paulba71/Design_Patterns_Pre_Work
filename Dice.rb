require_relative 'DieHistory'

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
    @log=DieHistory.new
  end

  def roll_die
    num=nil
    if @mode==DieMode::FOUR
      num= Random.rand(4)

    end
    if @mode==DieMode::EIGHT
      num=Random.rand(8)
    end
    @log.add_roll(num) if (num!=nil)
    return num
  end

  def print_log
    @log.print_history
  end

end

# TEST CODE
my_die=Die.new(DieMode::FOUR)
counter=0
while counter <20
  result=my_die.roll_die
  puts result.to_s
  counter = counter+1
end
my_die.print_log

my_die2=Die.new(DieMode::EIGHT)
counter=0
while counter <20
  result=my_die2.roll_die
  puts result.to_s
  counter = counter+1
end
my_die2.print_log