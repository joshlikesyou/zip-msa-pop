module Sync
  class SyncZipCbsa
    def self.perform(config = ZipCbsaSyncConfig.new)
      SyncModel.perform(config)
    end
  end
end
