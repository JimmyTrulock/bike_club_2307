class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def name
    @name
  end

  def bikers
    @bikers
  end

  def add_biker(biker)
    @bikers << biker
  end

  def most_rides
    rider = ""
    most_rides = 0 
    @bikers.each do |biker|
      if biker.times_list.count > most_rides
        most_rides = biker.times_list.count 
        rider = biker
      end
     end
     rider
  end

  def best_time(ride)
    rider = ""
    time = 0
    @bikers.each do |biker|
      if biker.personal_record(ride) != false
        if biker.personal_record(ride) > time 
          time = biker.personal_record(ride)
          rider = biker
        end
      end
    end
    rider
  end

  def bikers_eligible(ride)
   eligible_bikers = []
    @bikers.each do |biker|
      if biker.eligible(ride)
        eligible_bikers << biker
      end
    end
    eligible_bikers
  end
end