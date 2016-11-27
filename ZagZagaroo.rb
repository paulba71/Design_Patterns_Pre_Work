require_relative "Dice"
require_relative "Animal"

class ZagZagaroo < Animal

  @d  # Instance variable for the Die object

  def die_mode
    DieMode::EIGHT  # All ZigZagaroos get the 8 value Die
  end

  def count_hops_home (grid)
    @d=Die.new(die_mode)
    move_to(Point.new(0,0))
    sp=get_position
    hop_count=0
    while !grid.is_point_at_end?(sp)
      direction=@d.roll_die
      p=@d.convert_roll_to_move(direction)
      new_position=Point.new(0,0)
      new_position.x=sp.x+p.x
      new_position.y=sp.y+p.y
      while !grid.is_point_within_grid?(new_position)
        new_position.x=sp.x # revert the move out
        new_position.y=sp.y
        direction=@d.roll_die
        p=@d.convert_roll_to_move(direction) # try again
        new_position.x=sp.x+p.x
        new_position.y=sp.y+p.y
      end
      move_to(new_position)
      hop_count=hop_count+1
      sp=get_position
    end
    return hop_count
  end

end
