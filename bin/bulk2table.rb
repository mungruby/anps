#!/usr/bin/env ruby -w

# read in and parse the header contents of a bulk file
class BulkReader
  attr_accessor :header, :data
  def initialize file_name
  end
end

# Encapsulates the header contents of a bulk file
class BulkInfo
end
 
# create an html table from the contents of a bulk file
class TableGenerator 
  def initialize
  end
end

# create an html document from the contents of a bulk file
class DocGenerator 
  def initialize
  end
end
 
if __FILE__ == $0 
  TableGenerator.new(ARGV[0]).run
end
 
