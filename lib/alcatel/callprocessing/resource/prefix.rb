
require_relative './converter/prefix'
require_relative './command_line/prefix'
require_relative './comparator/prefix'

module Alcatel
  module CallProcessing
    module Resource
      module PREFIX
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
