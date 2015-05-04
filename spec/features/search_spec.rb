require 'spec_helper.rb'

feature "Looking up patient", js: true do
	before do
    	Patient.create!(name: 'Raoni Boaventura', email: 'raoni@gmail.com', sex: 'Male')
    	Patient.create!(name: 'Zlatan Ibrahimovic', email: 'zlatan@gmail.com', sex: 'Male')
    	Patient.create!(name: 'Lionel Messi', email: 'messi@gmail.com', sex: 'Male')
    	Patient.create!(name: 'Christiano Ronaldo', email: 'ronaldo@gmail.com', sex: 'Male')
	end
  scenario "finding patient" do
    visit '/'
    fill_in "keywords", with: "Raoni"
    click_on "Search"

    expect(page).to have_content("Raoni Boaventura")
  end
end