
require_relative './converter/servcrilist'
require_relative './command_line/servcrilist'
require_relative './comparator/servcrilist'

module Alcatel
  module CallProcessing
    module Resource
      module SERVCRILIST
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
