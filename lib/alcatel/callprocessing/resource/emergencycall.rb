
require_relative './converter/emergencycall'
require_relative './command_line/emergencycall'
require_relative './comparator/emergencycall'

module Alcatel
  module CallProcessing
    module Resource
      module EMERGENCYCALL
        include Converter
        include CommandLine 
        include Comparator
      end
    end
  end
end
 
