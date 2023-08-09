require './lib/ride'

describe Ride do
  it 'exists' do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})

    expect(ride1).to be_a(Ride)
    expect(ride1.name).to eq("Walnut Creek Trail")
    expect(ride1.distance).to eq(10.7)
    expect(ride1.terrain).to eq(:hills)
  end
end

describe "#loop?" do
  it 'checks if a ride is a loop' do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    
    expect(ride1.loop?).to eq(false)
    expect(ride2.loop?).to eq(true)
  end

  describe "#total_distance" do
    it "calculates total distance" do
      ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
      ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})

      expect(ride1.total_distance).to eq(21.4)
      expect(ride2.total_distance).to eq(14.9)
    end
  end
end