require_relative "Point"

class Animal


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