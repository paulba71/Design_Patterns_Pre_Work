require_relative "Kangaroo"
require_relative "ZagZagaroo"
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
    d=Die.new(skippy.die_mode)
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

  def run_part_two
    grid_size=0
    while grid_size<2 || grid_size >100
      print "Welcome to the simulation 2: Please specify a grid size (between 2-100): "
      grid_size=gets().to_f
    end

    number_of_runs=0
    while number_of_runs<2 || number_of_runs >1000
      print "Welcome to the simulation 2: Please specify the number of runs (between 2-1000): "
      number_of_runs=gets().to_f
    end


    skippy= Kangaroo.new
    zaggy= ZagZagaroo.new

    grid=Grid.new(grid_size)

    total_Kangaroo_moves=0
    total_Zigzagaroo_moves=0

    for run_number in 1..number_of_runs
      skippy_hop_count=skippy.count_hops_home(grid)
      zaggy_hop_count=zaggy.count_hops_home(grid)
      print "Run: " + (run_number.to_s) +": "
      print "Kangaroo " + skippy_hop_count.to_s + " hops, "
      print "Zigzagaroo " + zaggy_hop_count.to_s + " hops"
      puts""
      total_Kangaroo_moves=total_Kangaroo_moves+skippy_hop_count
      total_Zigzagaroo_moves=total_Zigzagaroo_moves+zaggy_hop_count
    end
    kangaroo_average=(total_Kangaroo_moves / number_of_runs).round
    zigzagaroo_average=(total_Zigzagaroo_moves / number_of_runs).round
    print "On average Kangaroo took " + kangaroo_average.to_s + " hops, Zigzagaroo took " + zigzagaroo_average.to_s + " hops"
    puts ""
  end

end


program = Main.new
program.run_part_one
program.run_part_two


