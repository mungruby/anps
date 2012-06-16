
#require_relative './converter/trunkgroup'
require_relative './command_line/trunkgroup'
require_relative './comparator/trunkgroup'

module Alcatel
  module CallProcessing
    module Resource
      module TRUNKGROUP
        include CommandLine 
        include Comparator
        #include Converter
      end
    end
  end
end
 
