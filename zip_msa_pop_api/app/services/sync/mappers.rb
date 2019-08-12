module Sync
  class Mapper
    def initialize(row, attributes, target)
      @row        = row
      @attributes = attributes
      @target     = target
    end

    def self.map(row, attributes, target)
      new(row, attributes, target).map
    end

    def map
      mapped_rows = map_to_rows(attributes, row)
      result = target.create(mapped_rows)
      puts "created #{result.id} of #{result.class.name}"
    end

    private

    def map_to_rows(attributes, row)
      attributes.map {|k, v| [k, row[v]] }.to_h
    end
    
    attr_reader :row, :attributes, :target
  end
end
