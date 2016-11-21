require_relative "Kangaroo"
require_relative "Dice"
require_relative "Grid"

class Main
  def run_part_one
    grid_size=0
    while grid_size<2 || grid_size >100
      print "Welcome to the simulation: Please specify a grid size (between 2-100): "
      grid_size=gets().to_f
    end

    skippy= Kangaroo.new
    grid=Grid.new(grid_size)

    hop_count=0

    puts "Simulation mode 1"
    print "Skippy starts at "
    skippy.print_position
    d=Die.new(DieMode::FOUR)
    sp=skippy.get_position
    while !grid.is_point_at_end?(sp)
      direction=d.roll_die
      p=d.convert_roll_to_move(direction)
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
        p=d.convert_roll_to_move(direction) # try again
        new_position.x=sp.x+p.x
        new_position.y=sp.y+p.y
      end
      skippy.move_to(new_position)
      print "Hopped to: "
      hop_count=hop_count+1
      skippy.print_position
      sp=skippy.get_position
    end
    puts "Finished in " + hop_count.to_s  + " hops!"
    puts ""
    d.print_summary_Log
  end
end

program = Main.new
program.run_part_one

#Main Start for the game
=begin
grid_size=0
while grid_size<2 || grid_size >100
  print "Welcome to the simulation: Please specify a grid size (between 2-100): "
  grid_size=gets().to_f
end

skippy= Kangaroo.new
grid=Grid.new(grid_size)

puts "Simulation mode 1"
print "Skippy starts at "
skippy.print_position
d=Die.new(DieMode::FOUR)
sp=skippy.get_position
while !grid.is_point_at_end?(sp)
  direction=d.roll_die
  p=d.convert_roll_to_move(direction)
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
    p=d.convert_roll_to_move(direction) # try again
    new_position.x=sp.x+p.x
    new_position.y=sp.y+p.y
  end
  skippy.move_to(new_position)
  print "Hopped to: "
  skippy.print_position
  sp=skippy.get_position
end
d.print_log

skippy.move_to (Point.new(0,0))
puts ""
puts ""
puts "Simulation mode 2"
print "Skippy starts at "
skippy.print_position
d=Die.new(DieMode::EIGHT)
sp=skippy.get_position
while !grid.is_point_at_end?(sp)
  direction=d.roll_die
  p=d.convert_roll_to_move(direction)
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
    p=d.convert_roll_to_move(direction) # try again
    new_position.x=sp.x+p.x
    new_position.y=sp.y+p.y
  end
  skippy.move_to(new_position)
  print "Hopped to: "
  skippy.print_position
  sp=skippy.get_position
end
d.print_log
=end
