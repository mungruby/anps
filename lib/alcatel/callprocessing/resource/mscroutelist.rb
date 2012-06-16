
require_relative './converter/mscroutelist'
require_relative './command_line/mscroutelist'
require_relative './comparator/mscroutelist'

module Alcatel
  module CallProcessing
    module Resource
      module MSCROUTELIST
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
