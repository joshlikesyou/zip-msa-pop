require 'rails_helper'

describe Sync::SyncModel do
  subject {
    Sync::SyncModel.perform(config)
  }

  context 'Correct sync config given' do
    let(:config) {
      Sync::MsaSyncConfig.new
    }
    
    it 'Successfully creates records for given model' do
      Msa.delete_all
      expect{ subject }.to change { Msa.count }
    end
  end

  context 'Transaction will rollback commits if there is an error' do
    let(:config) {
      Sync::MsaSyncConfig.new
    }

    it 'Does not update the model if the Mapper returns an error' do
      expect_any_instance_of(Sync::Mapper).to receive(:map)
        .and_raise('error')
        
      expect { subject rescue nil }.not_to change { Msa.count }
    end
  end
end
