require 'webmock/rspec'

RSpec.describe ZipMsaPop do
  subject { ZipMsaPop::Client.fetch_zip(zip) }
  
  context 'successful response' do
    before do
      stub_request(:get, 'https://zip-msa-pop-api.herokuapp.com/zip/90266')
        .to_return(
          headers: {content_type: 'application/json'}, 
          body: response.to_json
        )
    end



    let(:response) do
      {
        cbsa: 31080,
        name: "Los Angeles-Long Beach-Anaheim, CA",
        pop_estimate_2014: 13254397,
        pop_estimate_2015: 13340068,
        zip: 90266
      }
    end
    
    let(:zip) { 90266 }

    it 'returns zip to msa data from the api' do
      expect(subject).to eq response
    end
  end

  context 'unsuccessful response' do
    before do
      stub_request(:get, 'https://zip-msa-pop-api.herokuapp.com/zip/99999')
        .to_return(
          headers: {content_type: 'application/json'}, 
          body: response.to_json
        )
    end

    let(:response) do
      {
        status: 'error', code: 422, message: 'No zip to msa data for 99999'
      }
    end
    
    let(:zip) { 99999 }
  
    it 'returns the error message from the api' do
      expect(subject).to eq response
    end
  end

  context 'bad parameters' do
    it 'raises an arguemnt error' do
      expect{ ZipMsaPop::Client.fetch_zip()}.to raise_error(ArgumentError)
    end
  end
end
