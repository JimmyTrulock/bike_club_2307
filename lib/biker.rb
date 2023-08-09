class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = Hash.new {|k,v| k[v]=[]}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if eligible(ride) == true
      @rides[ride] << time
    end
  end

  def personal_record(ride)
    if @rides.key?(ride)
      @rides[ride].min
    else false
    end
  end

  def eligible(ride)
    if @acceptable_terrain.include?(ride.terrain) && @max_distance >= ride.total_distance
      true
    else
      false
    end
  end

  def times_list
    list = @rides.values.flatten
  end
end