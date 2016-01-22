require 'docking_station'

describe DockingStation do
	bike = Bike.new
	bike2 = Bike.new

it 'check if there is a capacity' do
expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
end

	it "checks bike is working" do
		expect(bike).to be_working
	end
	# unit test only works when .empty? method is not private
	# describe "#empty?" do
	# 	it {is_expected.to respond_to :empty?}
	# end




	describe "#release_bike" do
		it {is_expected.to respond_to :release_bike}

		it "declares bike has been released" do
			subject.dock(bike) #subject == DockingStation.new
			expect(subject.release_bike).to eq bike
		end

		it "raises an error when there are no bikes available" do
			expect {subject.release_bike}.to raise_error("no bike available")
		end
	end

	describe "#dock" do
		it "return bike has one argument" do
			expect(subject).to respond_to(:dock).with(1).argument
		end

		it "docks a bike" do
			expect(subject.dock(bike)).to eq [bike]
		end

		it "allows us to dock 20 bikes before an error is raised" do
			DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
			expect {subject.dock(Bike.new)}.to raise_error("warning #{DockingStation::DEFAULT_CAPACITY} bikes already docked")
		end
	end
end
