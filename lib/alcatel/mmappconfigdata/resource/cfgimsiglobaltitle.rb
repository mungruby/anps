
require_relative './converter/cfgimsiglobaltitle'
require_relative './command_line/cfgimsiglobaltitle'
require_relative './comparator/cfgimsiglobaltitle'

module Alcatel
  module MMAppConfigData
    module Resource

      module CFGIMSIGLOBALTITLE
        include Converter
        include CommandLine 
        include Comparator
      end

    end
  end
end
 
