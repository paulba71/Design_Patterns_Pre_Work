require_relative 'DieHistory'
require_relative "Point"

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
    num=0
    if @mode==DieMode::FOUR
      num = 1+Random.rand(4)
    end
    if @mode==DieMode::EIGHT
      num = 1+Random.rand(8)
    end
    @log.add_roll(num) if (num!=nil)
    return num
  end

  def print_direction (direction)
    case direction
      when Direction::NORTH
        print("NORTH")
      when Direction::NORTHEAST
        print("NORTHEAST")
      when Direction::EAST
        print("EAST")
      when Direction::SOUTHEAST
        print("SOUTHEAST")
      when Direction::SOUTH
        print("SOUTH")
      when Direction::SOUTHWEST
        print("SOUTHWEST")
      when Direction::WEST
        print("WEST")
      when Direction::NORTHWEST
        print("NORTHWEST")
    end
  end

  def convert_roll_to_move (direction)
    p=Point.new(0,0)
    case direction
      when Direction::NORTH
        p.y=p.y+1
      when Direction::NORTHEAST
        p.x=p.x+1
        p.y=p.y+1
      when Direction::EAST
        p.x=p.x+1
      when Direction::SOUTHEAST
        p.x=p.x+1
        p.y=p.y-1
      when Direction::SOUTH
        p.y=p.y-1
      when Direction::SOUTHWEST
        p.x=p.x-1
        p.y=p.y-1
      when Direction::WEST
        p.x=p.x-1
      when Direction::NORTHWEST
        p.x=p.x-1
        p.y=p.y+1
    end
    return p
  end


  def print_log
    @log.print_history
  end

  def print_summary_Log
    @log.print_history_summary
  end

end

# TEST CODE
#my_die=Die.new(DieMode::FOUR)
#counter=0
#while counter <20
#  result=my_die.roll_die
#  puts result.to_s
#  counter = counter+1
#end
#my_die.print_log

#my_die2=Die.new(DieMode::EIGHT)
#counter=0
#while counter <20
#  result=my_die2.roll_die
#  puts result.to_s
#  counter = counter+1
#end
#my_die2.print_log

#my_die=Die.new(DieMode::EIGHT)
#p=my_die.convert_roll_to_move(1)
#my_die.print_direction (1)
#p.print_point
#puts ""
#p=my_die.convert_roll_to_move(2)
#my_die.print_direction (2)
#p.print_point
#puts ""
#p=my_die.convert_roll_to_move(3)
#my_die.print_direction (3)
#p.print_point
#puts ""
#p=my_die.convert_roll_to_move(4)
#my_die.print_direction (4)
#p.print_point
#puts ""
#p=my_die.convert_roll_to_move(5)
#my_die.print_direction (5)
#p.print_point
#puts ""
#p=my_die.convert_roll_to_move(6)
#my_die.print_direction (6)
#p.print_point
#puts ""
#p=my_die.convert_roll_to_move(7)
#my_die.print_direction (7)
#p.print_point
#puts ""
#p=my_die.convert_roll_to_move(8)
#my_die.print_direction (8)
#p.print_point
#puts ""