class Point
  attr_accessor :x
  attr_accessor :y

  def initialize (in_x, in_y)
    @x=in_x
    @y=in_y
  end

  def set_as(in_x, in_y)
    @x=in_x
    @y=in_y
  end

  def print_point
    print "("+@x.to_s+","+@y.to_s+")"
  end

  # Implement a + operator
  def +(p)
    @x=@x+p.x
    @y=@y+p.y
  end

end

#Test code
#p=Point.new(0,0)
#p.print_point
#p.set_as(4,4)
#p.print_point
