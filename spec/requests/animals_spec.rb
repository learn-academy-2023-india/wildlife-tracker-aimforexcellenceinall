require 'rails_helper'

# Story 4:
# Ensure my app responds with a 422 status code when attempting to create an Animal or Sighting with invalid parameters
RSpec.describe "Animals", type: :request do
  describe "POST /animals" do
    it 'returns status code 422 for invalid parameters' do
      post animals_path, params: { animal: { common_name: '', scienditific_binomial: ''}}
      expect(response).to have_http_status(422)
  end
end
