
require_relative './converter/digitsoutpulsemap'
require_relative './command_line/digitsoutpulsemap'
require_relative './comparator/digitsoutpulsemap'

module Alcatel
  module CallProcessing
    module Resource

      module DIGITSOUTPULSEMAP
        include Converter
        include CommandLine 
        include Comparator
      end

    end
  end
end
 
