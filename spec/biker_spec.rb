require './lib/ride'
require './lib/biker'

describe Biker do
  it "exists" do
    biker = Biker.new("Kenny", 30)

    expect(biker).to be_a(Biker)
    expect(biker.name).to eq("Kenny")
    expect(biker.max_distance).to eq(30)
    expect(biker.rides).to eq({})
    expect(biker.acceptable_terrain).to eq([])
  end
end

describe "learn_terrain!" do
  it "adds a terrain to bikers acceptable_terrain" do
    biker = Biker.new("Kenny", 30)

    expect(biker.acceptable_terrain).to eq([])

    biker.learn_terrain!(:gravel)

    expect(biker.acceptable_terrain).to eq([:gravel])
  end
end

describe "#log_ride" do
  it "logs a ride for the biker" do
    biker = Biker.new("Kenny", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    biker.learn_terrain!(:hills)

    expect(biker.rides).to eq({})

    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)

    expect(biker.rides).to eq({ride1 => [92.5, 91.1]})
  end
end

describe '#personal_record' do
  it "returns lowest time for a ride" do
    biker = Biker.new("Kenny", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    biker.learn_terrain!(:hills)

    expect(biker.personal_record(ride1)).to eq(false)
    
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)

    expect(biker.personal_record(ride1)).to eq(91.1)
  end
end

describe "eligible(ride)" do
  it "checks if a rider is eligible" do
    biker = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    biker.learn_terrain!(:hills)

    expect(biker.eligible(ride1)).to eq(true)
    expect(biker2.eligible(ride1)).to eq(false)
  end
end

describe "times_list" do
  it "returns an array of times for a biker" do
    biker = Biker.new("Kenny", 30)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    biker.learn_terrain!(:hills)
    biker.log_ride(ride1, 92.5)
    biker.log_ride(ride1, 91.1)

    expect(biker.times_list).to eq([92.5, 91.1])
  end
end