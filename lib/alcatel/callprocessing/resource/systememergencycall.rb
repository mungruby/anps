
require_relative './converter/systememergencycall'
require_relative './command_line/systememergencycall'
require_relative './comparator/systememergencycall'

module Alcatel
  module CallProcessing
    module Resource
      module SYSTEMEMERGENCYCALL
        include Converter
        include CommandLine 
        include Comparator
      end
    end
  end
end
 
