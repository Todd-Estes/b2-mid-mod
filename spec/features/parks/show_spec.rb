require 'rails_helper'

RSpec.describe "park show page" do
  it "can visit a park show page and see the name and price of admissions for that
  park, and it can see the names and average thill ratings of its rides " do
    park_1 = Park.create(name: 'Six Flags',
                         admission_price: 20)
    ride_1 = Ride.create(name: 'Coaster',
                        thrill_rating: 9,
                        park_id: park_1.id)
    ride_2 = Ride.create(name: 'Swings',
                        thrill_rating: 2,
                        park_id: park_1.id)
    visit "/parks/#{park_1.id}"

    expect(page).to have_content("Six Flags")
    expect(page).to have_content("Admissions $20")
    expect(page).to have_content("Coaster")
    expect(page).to have_content("Swings")
    expect(page).to have_content("Average Thrill Rating of Rides: 5.5/10")
  end
end
