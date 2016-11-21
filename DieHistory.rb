class DieHistory

  @history=Hash.new()


  def initialize
    @history= { "1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0, "7" => 0, "8" => 0 }
    @roll_count=0
  end

  def add_roll (number)
    if(number<1 || number>8)
      puts "Error number" + number.to_s
    end
    current_count=@history[number.to_s]
    @history[number.to_s] = current_count+1
    @roll_count=@roll_count+1
  end

  def print_history
    puts "North [1] = " + @history["1"].to_s
    puts "East [2] = " + @history["2"].to_s
    puts "South [3] = " + @history["3"].to_s
    puts "West [4] = " + @history["4"].to_s
    puts "North East [5] = " + @history["5"].to_s
    puts "South East [6] = " + @history["6"].to_s
    puts "South West [7] = " + @history["7"].to_s
    puts "North West[8] = " + @history["8"].to_s
    puts "Die roll count = " + @roll_count.to_s
  end

  def print_history_summary
    puts "Die statistics:"
    puts "Total #throws: " + @roll_count.to_s
    print "North: "
    print (@history["1"].to_f / @roll_count.to_f * 100).round.to_s
    print "% "
    print "South: "
    print (@history["3"].to_f / @roll_count.to_f * 100).round.to_s
    print "% "
    print "East: "
    print (@history["2"].to_f / @roll_count.to_f * 100).round.to_s
    print "% "
    print "West: "
    print (@history["4"].to_f / @roll_count.to_f * 100).round.to_s
    print "% "
    puts ""
  end
end

# Test code
#log=DieHistory.new
#log.add_roll(4)
#log.add_roll(4)
#log.add_roll(7)
#log.add_roll(0)
#log.print_history
