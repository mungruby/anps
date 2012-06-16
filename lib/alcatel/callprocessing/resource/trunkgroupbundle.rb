
require_relative './converter/trunkgroupbundle'
require_relative './command_line/trunkgroupbundle'
require_relative './comparator/trunkgroupbundle'

module Alcatel
  module CallProcessing
    module Resource
      module TRUNKGROUPBUNDLE
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
