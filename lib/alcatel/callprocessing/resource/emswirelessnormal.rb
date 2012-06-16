
require_relative './converter/emswirelessnormal'
require_relative './command_line/emswirelessnormal'
require_relative './comparator/emswirelessnormal'

module Alcatel
  module CallProcessing
    module Resource
      module EMSWIRELESSNORMAL
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
