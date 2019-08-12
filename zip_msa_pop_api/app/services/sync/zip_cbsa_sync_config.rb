module Sync
  class ZipCbsaSyncConfig
    def target
      ZipCbsa
    end

    def attributes
      {
        zip: 'ZIP',
        cbsa: 'CBSA'
      }
    end
    
    def file_path
      ENV['ZIP_CSV_PATH']
    end
  end
end
