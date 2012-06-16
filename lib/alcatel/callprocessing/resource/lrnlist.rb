
require_relative './converter/lrnlist'
require_relative './command_line/lrnlist'
require_relative './comparator/lrnlist'

module Alcatel
  module CallProcessing
    module Resource
      module LRNLIST
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
