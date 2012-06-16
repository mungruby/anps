
require_relative './converter/prefixfence'
require_relative './command_line/prefixfence'
require_relative './comparator/prefixfence'

module Alcatel
  module EmsData
    module Resource
      module PREFIXFENCE
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
