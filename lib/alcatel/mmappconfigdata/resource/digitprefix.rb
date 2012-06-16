
require_relative './converter/digitprefix'
require_relative './command_line/digitprefix'
require_relative './comparator/digitprefix'

module Alcatel
  module MMAppConfigData
    module Resource

      module DIGITPREFIX
        include Converter
        include CommandLine 
        include Comparator
      end

    end
  end
end
 
