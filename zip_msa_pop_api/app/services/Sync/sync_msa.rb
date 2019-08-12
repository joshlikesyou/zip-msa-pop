module Sync
  class SyncMsa
    def self.perform(config = MsaSyncConfig.new)
      SyncModel.perform(config)
    end
  end
end
