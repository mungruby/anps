
require_relative './converter/emergencyzone'
require_relative './command_line/emergencyzone'
require_relative './comparator/emergencyzone'

module Alcatel
  module CallProcessing
    module Resource
      module EMERGENCYZONE
        include Converter
        include CommandLine 
        include Comparator
      end
    end
  end
end
 
