
require_relative './converter/countrycode'
require_relative './command_line/countrycode'
require_relative './comparator/countrycode'

module Alcatel
  module CallProcessing
    module Resource
      module COUNTRYCODE
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
