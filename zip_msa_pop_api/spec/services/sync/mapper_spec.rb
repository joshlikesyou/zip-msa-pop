require 'rails_helper'

describe Sync::Mapper do
  subject {
    Sync::Mapper.new(row, attributes, target)
  }

  let(:target) {
    Msa
  }

  let(:row) {
    {
      'CBSA': 1234,
      'MDIV': 1234,
      'NAME': 'Cool Name',
      'LSAD': 'Cool Place',
      'POPESTIMATE2014': 1000,
      'POPESTIMATE2015': 2000,
    }
  }

  context 'Correct mapping configs' do
    let(:attributes) {
      Sync::MsaSyncConfig.new.attributes
    }

    it 'Successfully creates a record' do
      expect{ subject.map }.to change { Msa.count }
    end
  end

  context 'Incorrect mapping configs' do
    let(:attributes) {
      Sync::ZipCbsaSyncConfig.new.attributes
    }

    it 'Raises an error' do
      expect{ subject.map }.to raise_error
    end
  end
end
