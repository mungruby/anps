
require_relative './converter/lnplist'
require_relative './command_line/lnplist'
require_relative './comparator/lnplist'

module Alcatel
  module CallProcessing
    module Resource
      module LNPLIST
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
