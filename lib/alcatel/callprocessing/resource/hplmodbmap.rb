
# require_relative './converter/hplmodbmap'
require_relative './command_line/hplmodbmap'
require_relative './comparator/hplmodbmap'

module Alcatel
  module CallProcessing
    module Resource
      module HPLMODBMAP
        include CommandLine 
        include Comparator
        # include Converter
      end
    end
  end
end
 
