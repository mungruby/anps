
require_relative './converter/servicecriteria'
require_relative './command_line/servicecriteria'
require_relative './comparator/servicecriteria'

module Alcatel
  module CallProcessing
    module Resource
      module SERVICECRITERIA
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
