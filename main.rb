require_relative "Kangaroo"
require_relative "ZagZagaroo"
require_relative "Grid"

class Main

  def get_grid_size
    grid_size=0
    while grid_size<1 || grid_size >500
      print "Welcome to the simulation: Please specify a grid size (between 1-500): "
      grid_size=gets().to_f
    end
    grid_size
  end

  def get_number_of_runs
    number_of_runs=0
    while number_of_runs<1 || number_of_runs >1000
      print "Please specify the number of runs (between 1-1000): "
      number_of_runs=gets().to_f
    end
    number_of_runs
  end

  ##############################################################
  #
  # Simulation mode 1 - chart skippy's route home
  #
  #
  def run_part_one
    puts "Simulation mode 1"
    puts ""

    grid_size=get_grid_size

    skippy= Kangaroo.new
    grid=Grid.new(grid_size)

    print "Skippy starts at "
    skippy.print_position

    skippy.chart_way_home(grid)
  end

  ###############################################################
  #
  # Simulation mode 2 - count number of moves
  #
  #
  def run_part_two
    puts "Simulation mode 2"
    puts ""

    grid_size=get_grid_size

    number_of_runs=get_number_of_runs

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

## Run the simulations
program = Main.new
program.run_part_one
program.run_part_two


