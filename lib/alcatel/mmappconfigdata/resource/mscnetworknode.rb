
require_relative './converter/mscnetworknode'
require_relative './command_line/mscnetworknode'
require_relative './comparator/mscnetworknode'

module Alcatel
  module MMAppConfigData
    module Resource

      module MSCNETWORKNODE
        include Converter
        include CommandLine 
        include Comparator
      end

    end
  end
end
 
