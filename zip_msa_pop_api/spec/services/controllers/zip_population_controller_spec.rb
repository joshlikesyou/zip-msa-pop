require 'rails_helper'

describe ZipPopulationController, :type => :request do
  context 'Successful get request' do
    let(:expected_response) {
      {
        zip: 90266,
        cbsa: 31080,
        name: 'Los Angeles-Long Beach-Anaheim, CA',
        pop_estimate_2014: 13254397,
        pop_estimate_2015: 13340068
      }.to_json
    }
    it 'returns correct response' do
      get '/zip/90266'
      expect(response.body).to eq expected_response
    end
  end

  context 'Failed get request' do
    let(:expected_response) {
      {
        status: 'error',
        code: 422,
        message: 'No zip to msa data for zipcode: 99999'
      }.to_json
    }

    it 'returns error message' do
      get '/zip/99999'
      expect(response.body).to eq expected_response
    end
  end
end
