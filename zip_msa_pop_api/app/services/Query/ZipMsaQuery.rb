module Query
  class ZipMsaQuery
    def initialize(zip)
      @zip = zip
    end

    def self.perform(zip)
      new(zip).perform()
    end

    def perform
      raise ArgumentError.new('Invalid zipcode!') unless validate_zip
      query_zip_to_msa
    end

    private

    attr_reader :zip

    def query_zip_to_msa
      sql = query(zip)
      results = ActiveRecord::Base.connection.exec_query(sql)
      raise ArgumentError.new("No zip to msa data for zipcode: #{zip}") if results.length == 0
      { 'zip'=> zip.to_i }.merge(results.first)
    end

    def query(zip)
      "SELECT cbsa, name, pop_estimate_2014, pop_estimate_2015 FROM msas
        WHERE lsad = 'Metropolitan Statistical Area'
        AND cbsa IN (
          SELECT m.cbsa FROM msas as m, zip_cbsas as z
            WHERE (z.cbsa = m.cbsa OR z.cbsa = m.mdiv) AND z.zip = #{zip})"
    end

    def validate_zip
      /^[0-9]{5}$/.match?(zip)
    end
  end
end
