require_relative "Point"
require_relative "Dice"

class Kangaroo


  def initialize
    @position=Point.new(0,0)
  end

  def print_position
    print "(" + @position.x.to_s + " ," +@position.y.to_s + ")"
    puts""
  end

  def move_to(p)
    @position.x=p.x
    @position.y=p.y
  end

  def get_position
    @position
  end

end

# Test code
#skippy=Kangaroo.new
#skippy.print_position
#p=Point.new(4,4)
#p.x=4
#p.y=4
#skippy.move_to(p)
#skippy.print_position