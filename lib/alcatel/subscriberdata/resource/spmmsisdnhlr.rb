
require_relative './converter/spmmsisdnhlr'
require_relative './command_line/spmmsisdnhlr'
require_relative './comparator/spmmsisdnhlr'

module Alcatel
  module SubscriberData
    module Resource
      module SPMMSISDNHLR
        include CommandLine 
        include Comparator
        include Converter
      end
    end
  end
end
 
