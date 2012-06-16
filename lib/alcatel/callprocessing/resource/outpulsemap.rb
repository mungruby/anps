
require_relative './converter/outpulsemap'
require_relative './command_line/outpulsemap'
require_relative './comparator/outpulsemap'

module Alcatel
  module CallProcessing
    module Resource
      module OUTPULSEMAP
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
