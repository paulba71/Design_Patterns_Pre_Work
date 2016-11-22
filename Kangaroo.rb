require_relative "Dice"
require_relative "Point"
require_relative "grid"
require_relative "Animal"

class Kangaroo < Animal

  def die_mode
    DieMode::FOUR
  end

  def count_hops_home (grid)
    d=Die.new(die_mode)
    move_to(Point.new(0,0))
    sp=get_position
    hop_count=0
    while !grid.is_point_at_end?(sp)
      direction=d.roll_die
      p=d.convert_roll_to_move(direction)
      new_position=Point.new(0,0)
      new_position.x=sp.x+p.x
      new_position.y=sp.y+p.y
      while !grid.is_point_within_grid?(new_position)
        new_position.x=sp.x # revert the move out
        new_position.y=sp.y
        direction=d.roll_die
        p=d.convert_roll_to_move(direction) # try again
        new_position.x=sp.x+p.x
        new_position.y=sp.y+p.y
      end
      move_to(new_position)
      hop_count=hop_count+1
      sp=get_position
    end
    return hop_count
  end

  def chart_way_home (grid)
    d=Die.new(die_mode)
    hop_count=0
    sp=get_position
    while !grid.is_point_at_end?(sp)
      direction=d.roll_die
      p=d.convert_roll_to_move(direction)
      print d.print_direction(direction)
      new_position=Point.new(0,0)
      new_position.x=sp.x+p.x
      new_position.y=sp.y+p.y
      while !grid.is_point_within_grid?(new_position)
        print "Oops, hit the boundary: "
        new_position.print_point
        puts
        new_position.x=sp.x # revert the move out
        new_position.y=sp.y
        direction=d.roll_die
        print d.print_direction(direction)
        p=d.convert_roll_to_move(direction) # try again
        new_position.x=sp.x+p.x
        new_position.y=sp.y+p.y
      end
      move_to(new_position)
      print "Hopped to: "
      print_position
      hop_count=hop_count+1
      sp=get_position
    end
    puts "Finished in " + hop_count.to_s  + " hops!"
    puts ""
    d.print_summary_Log
    puts""
    puts"-------------------------------------------------------------------------------"
    puts""
  end

end
