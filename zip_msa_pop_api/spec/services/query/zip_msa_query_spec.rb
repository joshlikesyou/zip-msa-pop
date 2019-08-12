require 'rails_helper'

describe Query::ZipMsaQuery do
  subject {
    Query::ZipMsaQuery.new(zip)
  }

  shared_examples_for 'query' do
    it 'it should query and return with the expected response' do
      expect(subject.perform).to eq expected_response
    end
  end

  context 'Successful query' do
    context 'When zip has corresponding cbsa' do
      let(:zip) {
        '90266'
      }

      let(:expected_response) do
        {
          'zip' => 90266,
          'cbsa' => 31080,
          'name' => 'Los Angeles-Long Beach-Anaheim, CA',
          'pop_estimate_2014' => 13254397,
          'pop_estimate_2015' => 13340068,
        }

        it_should_behave_like 'query'
      end
    end

    context 'When zip has corresponding mdiv' do
      let(:zip) {
        '79553'
      }

      let(:expected_response) do
        {
          'zip' => 79553,
          'cbsa' => 10180,
          'name' => 'Abilene, TX',
          'pop_estimate_2014' => 168380,
          'pop_estimate_2015' => 169578,
        }
      end

      it_should_behave_like 'query'
    end
  end

  context "Failed query" do
    context "Returns error when there is no matching zip msa data" do
      let(:zip) {
        '99999'
      }

      let(:expected_response) do
        {
          'zip' => 90266,
          'cbsa' => 31080,
          'name' => 'Los Angeles-Long Beach-Anaheim, CA',
          'pop_estimate_2014' => 13254397,
          'pop_estimate_2015' => 13340068,
        }
      end

      it 'it should throw an arguemnt error' do
        expect{ subject.perform }.to raise_error(ArgumentError, 'No zip to msa data for zipcode: 99999')
      end
    end
  
    context "Throws and error if the zip code is invalid" do
      let(:zip) {
        '999999'
      }

      it 'it should throw an arguemnt error' do
        expect{ subject.perform }.to raise_error(ArgumentError, 'Invalid zipcode!')
      end
    end
  end
end
