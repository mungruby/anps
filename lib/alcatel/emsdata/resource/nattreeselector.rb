
require_relative './converter/nattreeselector'
require_relative './command_line/nattreeselector'
require_relative './comparator/nattreeselector'

module Alcatel
  module EmsData
    module Resource
      module NATTREESELECTOR
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
