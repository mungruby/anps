
require_relative './converter/digitdescriptor'
require_relative './command_line/digitdescriptor'
require_relative './comparator/digitdescriptor'

module Alcatel
  module EmsData
    module Resource
      module DIGITDESCRIPTOR
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
