require 'zip_msa_pop/version'
require 'httparty'
require 'pry'

module ZipMsaPop
  class Client
    def initialize
      @client = HTTParty
      @uri = "https://zip-msa-pop-api.herokuapp.com/zip"
    end

    def self.fetch_zip(zip)
      new.fetch_zip(zip)
    end

    def self.fetch_zip_pretty(zip)
      new.fetch_zip_pretty(zip)
    end

    def fetch_zip(zip)
      response = client.get(request_uri zip)
      parse_response(response)
    end

    private

    def parse_response(response)
      response = response.parsed_response
      keys_to_symbols(response)
    end

    def keys_to_symbols(response)
      response.inject({}) {|memo,(k,v)| memo[k.to_sym] = v; memo}
    end

    def request_uri(zip)
      "#{uri}/#{zip}"
    end

    attr_reader :client, :uri
  end
end
