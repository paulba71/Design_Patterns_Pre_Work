class DieHistory

  @history=Hash.new()


  def initialize
    @history= { "0" => 0, "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0 }
    @roll_count=0
  end

  def add_roll (number)
    current_count=@history[number.to_s]
    @history[number.to_s] = current_count+1
    @roll_count=@roll_count+1
  end

  def print_history
    puts "North [0] = " + @history["0"].to_s
    puts "East [1] = " + @history["1"].to_s
    puts "South [2] = " + @history["2"].to_s
    puts "West [3] = " + @history["3"].to_s
    puts "North East [4] = " + @history["4"].to_s
    puts "South East [5] = " + @history["5"].to_s
    puts "South West [6] = " + @history["6"].to_s
    puts "North West[ 7] = " + @history["7"].to_s
    puts "Die roll count = " + @roll_count.to_s
  end
end

# Test code
#log=DieHistory.new
#log.add_roll(4)
#log.add_roll(4)
#log.add_roll(7)
#log.add_roll(0)
#log.print_history
