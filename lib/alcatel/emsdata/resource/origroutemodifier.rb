
require_relative './converter/origroutemodifier'
require_relative './command_line/origroutemodifier'
require_relative './comparator/origroutemodifier'

module Alcatel
  module EmsData
    module Resource
      module ORIGROUTEMODIFIER
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
