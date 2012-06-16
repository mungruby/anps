
require_relative './converter/digittranslation'
require_relative './command_line/digittranslation'
require_relative './comparator/digittranslation'

module Alcatel
  module CallProcessing
    module Resource
      module DIGITTRANSLATION
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
