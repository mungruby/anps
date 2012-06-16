
require_relative './converter/spmpcardcalltype'
require_relative './command_line/spmpcardcalltype'
require_relative './comparator/spmpcardcalltype'

module Alcatel
  module SubscriberData
    module Resource
      module SPMPCARDCALLTYPE
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
