require_relative "Point"

class Animal


  def initialize
    @position=Point.new(0,0)
  end

  def print_position
    @position.print_point
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