
require_relative './converter/npanxx'
require_relative './command_line/npanxx'
require_relative './comparator/npanxx'

module Alcatel
  module CallProcessing
    module Resource
      module NPANXX
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
