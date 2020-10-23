require 'rails_helper'

RSpec.describe "mechanics show page" do
  it "can visit a mechanics show page and see their name, years of experience,
  and all of the rides theyre working on" do
    park_1 = Park.create(name: 'Six Flags',
                         admission_price: 20)
    ride_1 = Ride.create(name: 'Coaster',
                        thrill_rating: 9,
                        park_id: park_1.id)
    ride_2 = Ride.create(name: 'Swings',
                        thrill_rating: 2,
                        park_id: park_1.id)
    mechanic_1 = Mechanic.create(name: 'Jim Brown',
                                 years_xp: 5)
    mechanics_rides_1 = MechanicsRide.create(mechanic_id: mechanic_1.id,
                                             ride_id: ride_1.id)
    mechanics_rides_1 = MechanicsRide.create(mechanic_id: mechanic_1.id,
                                             ride_id: ride_2.id)
    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_xp)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
   end
   it "can see a form to add a ride exisiting in the database to the mechanics
   workload, fill in that ride, click submit, and be returned to mechanics
   show page" do
     park_1 = Park.create(name: 'Six Flags',
                          admission_price: 20)
    ride_2 = Ride.create(name: 'Swings',
                         thrill_rating: 2,
                         park_id: park_1.id)
     ride_1 = Ride.create(name: 'Coaster',
                         thrill_rating: 9,
                         park_id: park_1.id)
     ride_3 = Ride.create(name: 'Karts',
                         thrill_rating: 5,
                         park_id: park_1.id)
     mechanic_1 = Mechanic.create(name: 'Jim Brown',
                                  years_xp: 5)
     mechanics_rides_1 = MechanicsRide.create(mechanic_id: mechanic_1.id,
                                              ride_id: ride_1.id)
     mechanics_rides_1 = MechanicsRide.create(mechanic_id: mechanic_1.id,
                                              ride_id: ride_2.id)
     visit "/mechanics/#{mechanic_1.id}"

      within(id="ride-#{ride_1.id}") do
        expect(page).to have_content("Coaster")
      end

      within(id="ride-#{ride_2.id}") do
        expect(page).to have_content("Swings")
      end
    end
  end
