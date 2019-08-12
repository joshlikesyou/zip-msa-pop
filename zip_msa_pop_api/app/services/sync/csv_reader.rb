require 'csv'

module Sync
  class CsvReader
    def self.read_csv(file_path)
      new.read_csv(file_path)
    end

    def read_csv(file_path)
      CSV.read(file_path, headers: true)
    end
  end
end
