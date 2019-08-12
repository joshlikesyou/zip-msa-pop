module Sync
  class MsaSyncConfig
    def target
      Msa
    end

    def attributes
      {
        cbsa: 'CBSA',
        mdiv: 'MDIV',
        name: 'NAME',
        lsad: 'LSAD',
        pop_estimate_2014: 'POPESTIMATE2014',
        pop_estimate_2015: 'POPESTIMATE2015'
      }
    end

    def file_path
      ENV['MSA_CSV_PATH']
    end
  end
end
