require_relative "Point"

class Grid

  attr_accessor :home_position
  @size=0

  def initialize(size)
    @size=size
    @home_position=Point.new(size-1,size-1)
  end

  def is_point_within_grid? (p)

    #if(!p.is_a?Point)
    #  return false
    #end

    if p.x.to_f < 0 || p.x.to_f > @size
      return false
    end

    if p.y.to_f < 0 || p.y.to_f > @size
      return false
    end

    return true
  end

  def is_point_at_end? (p)
    (p.x == @size-1 && p.y == @size-1)?true:false
  end

end #class

# Test code
#grid=Grid.new(10)
#puts grid
#pt=Point.new(0,0)
#pt.x=0
#pt.y=0
#puts pt.x
#puts pt.y
#if grid.is_point_within_grid? (pt) then puts "Point OK" else puts "Point not OK" end
#if grid.is_point_within_grid? (pt) then puts "Point at end" else puts "Point not at end" end
#pt2=Point.new(15,3)
#pt2.x=15
#pt2.y=3
#if grid.is_point_within_grid? (pt2) then puts "Point OK" else puts "Point not OK" end
#if grid.is_point_within_grid? (pt2) then puts "Point at end" else puts "Point not at end" end
#pt3=Point.new(9,9)
#pt3.x=9
#pt3.y=9
#if grid.is_point_within_grid? (pt3) then puts "Point OK" else puts "Point not OK" end
#if grid.is_point_within_grid? (pt3) then puts "Point at end" else puts "Point not at end" end

