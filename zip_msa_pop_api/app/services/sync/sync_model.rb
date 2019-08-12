module Sync
  class SyncModel
    def initialize(config)
      @file_path   = config.file_path
      @target      = config.target
      @attributes  = config.attributes
    end

    def self.perform(config)
      new(config).perform
    end

    def perform
      import_data = CsvReader.read_csv(file_path)
      map_rows(import_data)
      true
    end

    private

    attr_reader :file_path, :attributes, :target

    def map_rows(import_data)
      ActiveRecord::Base.transaction do
        target.delete_all
        import_data.each do |row|
          map(row, attributes)
        end
      end
    end

    def map(row, attributes)
      Mapper.map(row, attributes, target)
    end
  end
end
