
# require_relative './converter/origroute'
require_relative './command_line/origroute'
require_relative './comparator/origroute'

module Alcatel
  module CallProcessing
    module Resource
      module ORIGROUTE
        include CommandLine 
        include Comparator
        # include Converter
      end
    end
  end
end
 
