require_relative "Kangaroo"
require_relative "Dice"
require_relative "Grid"

#Main Start for the game
grid_size=0
while grid_size<2 || grid_size >100
  print "Welcome to the simulation: Please specify a grid size (between 2-100): "
  grid_size=gets().to_f
end

skippy= Kangaroo.new
grid=Grid.new(grid_size)

puts "Simulation 1"
print "Skippy starts at "
skippy.print_position
count=0
d=Die.new(DieMode::FOUR)
while !grid.is_point_at_end?(skippy.get_position) && count<20
  direction=d.roll_die
  p=d.convert_roll_to_move(direction)
  new_position=Point.new(0,0)
  new_position.x=skippy.get_position.x+p.x
  new_position.y=skippy.get_position.y+p.y
  while !grid.is_point_within_grid?(new_position) # TODO refactor after
    direction=d.roll_die
    p=d.convert_roll_to_move(direction)
    new_position.x=skippy.get_position.x+p.x
    new_position.y=skippy.get_position.y+p.y
    print "Oops, hit the boundary: "
    new_position.print_point
    puts
  end
  skippy.move_to(new_position)
  print "Hopped to: "
  skippy.print_position
  count=count+1
end
