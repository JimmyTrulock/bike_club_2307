require './lib/ride'
require './lib/biker'
require './lib/bike_club'

describe BikeClub do
  it 'exsits' do
    bike_club1 = BikeClub.new("Denver Bike Club")

    expect(bike_club1).to be_a(BikeClub)
    expect(bike_club1.name).to eq("Denver Bike Club")
    expect(bike_club1.bikers).to eq([])
  end
end

describe "#name" do
  it "returns club name" do
    bike_club1 = BikeClub.new("Denver Bike Club")

    expect(bike_club1.name).to eq("Denver Bike Club")
  end
end

describe "#bikers" do
  it 'returns an array of bikers in the club' do
    bike_club1 = BikeClub.new("Denver Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    bike_club1.add_biker(biker)
    bike_club1.add_biker(biker2)

    expect(bike_club1.bikers).to eq([biker, biker2])
  end
end

describe '#add_biker' do
  it "adds biker to club" do
    bike_club1 = BikeClub.new("Denver Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    bike_club1.add_biker(biker)
    bike_club1.add_biker(biker2)

    expect(bike_club1.bikers).to eq([biker, biker2])
  end
end

describe "#most_rides" do
  it "returns biker with most rides" do
    bike_club1 = BikeClub.new("Denver Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    biker.learn_terrain!(:hills)
    biker2.learn_terrain!(:hills)
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)
    biker2.log_ride(ride1, 91.1)
    bike_club1.add_biker(biker)
    bike_club1.add_biker(biker2)

    expect(bike_club1.most_rides).to eq(biker)

    biker2.log_ride(ride1, 91.1)
    biker2.log_ride(ride1, 91.1)

    expect(bike_club1.most_rides).to eq(biker2)
  end
end

describe "#best_time" do
  it "returns biker with best time for a ride" do
    bike_club1 = BikeClub.new("Denver Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker.learn_terrain!(:hills)
    biker2.learn_terrain!(:hills)
    biker.log_ride(ride1, 92.5)
    biker2.log_ride(ride1, 91.1)
    bike_club1.add_biker(biker)
    bike_club1.add_biker(biker2)

    expect(bike_club1.best_time(ride1)).to eq(biker)
  end
end

describe "#bikers_eligible" do
  it "returns array of bikers eligible for the ride" do
    bike_club1 = BikeClub.new("Denver Bike Club")
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker.learn_terrain!(:hills)
    biker2.learn_terrain!(:hills)
    biker.learn_terrain!(:gravel)
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride2, 92.5)
    biker2.log_ride(ride1, 91.1)
    bike_club1.add_biker(biker)
    bike_club1.add_biker(biker2)

    expect(bike_club1.bikers_eligible(ride1)).to eq([biker, biker2])
    expect(bike_club1.bikers_eligible(ride2)).to eq([biker])
  end
end