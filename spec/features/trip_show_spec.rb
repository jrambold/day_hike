require 'rails_helper'

describe 'when I visit the trips index' do
  describe 'I click a link to a trip show' do
    scenario 'see a list of trails' do
      trip = Trip.create!(name: 'hanging lake', start_date: "2018/03/30", end_date: "2018/03/30")
      trail = Trail.create!(length: 45, name: 'lower', address: "mountains")
      trip.trip_trails.create!(trail_id: trail.id)

      visit trips_path

      click_on 'hanging lake'

      expect(current_path).to eq(trip_path(trip))

      expect(page).to have_content(45)
      expect(page).to have_content('lower')
      expect(page).to have_content('mountains')

    end
  end
end

describe 'when I visit the trips show' do
  scenario 'I see the planned total hiking distance' do
    trip = Trip.create!(name: 'hanging lake', start_date: "2018/03/30", end_date: "2018/03/30")
    trail = Trail.create!(length: 45, name: 'lower', address: "mountains")
    trail2 = Trail.create!(length: 120, name: 'upper', address: "peak")
    trip.trip_trails.create!(trail_id: trail.id)
    trip.trip_trails.create!(trail_id: trail2.id)

    visit trip_path(trip)

    expect(page).to have_content('Total Distance: 165')

  end
  scenario 'I see the average hiking distance' do
    trip = Trip.create!(name: 'hanging lake', start_date: "2018/03/30", end_date: "2018/03/30")
    trail = Trail.create!(length: 45, name: 'lower', address: "mountains")
    trail2 = Trail.create!(length: 120, name: 'upper', address: "peak")
    trip.trip_trails.create!(trail_id: trail.id)
    trip.trip_trails.create!(trail_id: trail2.id)

    visit trip_path(trip)

    expect(page).to have_content('Total Distance: 165')

  end
end
