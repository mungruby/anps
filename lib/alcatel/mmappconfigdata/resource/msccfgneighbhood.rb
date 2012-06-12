
require_relative './converter/msccfgneighbhood'
require_relative './command_line/msccfgneighbhood'
require_relative './comparator/msccfgneighbhood'

module Alcatel
  module MMAppConfigData
    module Resource

      module MSCCFGNEIGHBHOOD
        include Converter
        include CommandLine 
        include Comparator
      end

    end
  end
end
 
