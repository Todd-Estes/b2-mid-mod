require 'rails_helper'

RSpec.describe "mechanics index page" do
  it "can visit a mechanics index page and see a header saying All Mechanics" do
    mechanic_1 = Mechanic.create(name: 'Jim Brown',
                          years_xp: 5)
    mechanic_2 = Mechanic.create(name: 'Steve Winwood',
                          years_xp: 7)
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("Jim Brown - 5 years of experience")
    expect(page).to have_content("Steve Winwood - 7 years of experience")
  end
end
