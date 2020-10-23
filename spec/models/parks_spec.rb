require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe 'instance methods' do
    it "#avg_thrill_rating" do
      park_1 = Park.create(name: 'Six Flags',
                           admission_price: 20)
      ride_1 = Ride.create(name: 'Coaster',
                          thrill_rating: 9,
                          park_id: park_1.id)
      ride_2 = Ride.create(name: 'Swings',
                          thrill_rating: 2,
                          park_id: park_1.id)
      expect(park_1.avg_thrill_rating.round(1)).to eq(5.5)
    end
  end
end
