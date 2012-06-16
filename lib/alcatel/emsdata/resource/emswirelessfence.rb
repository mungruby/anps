
require_relative './converter/emswirelessfence'
require_relative './command_line/emswirelessfence'
require_relative './comparator/emswirelessfence'

module Alcatel
  module EmsData
    module Resource
      module EMSWIRELESSFENCE
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
