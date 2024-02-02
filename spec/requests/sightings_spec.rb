require 'rails_helper'

RSpec.describe "Sightings", type: :request do
  describe "POST /sightings" do
    it 'returns status code 422 for invalid parameters' do
      post sightings_path, params: { sighting: { latitude: nil, longitude: nil, date: nil }}
      expect(response).to have_http_status(422)
  end
end
