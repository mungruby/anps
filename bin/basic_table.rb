#!/usr/bin/env ruby -w

class BasicTable
  include Enumerable
  def initialize entries
    @table = entries
  end
  def each &block
    @table.each(&block)
  end
end

class TestBasicTableIteration
  def initialize
    @dto = Struct.new('WeatherInfo', :city, :state, :weather)
    # @dto = Struct.new('WeatherInfo', :city, :state, :weather) do
      # def ==(other)
      #   self.city <=> other.city
      # end
    # end
  end
  def run
    rows = []
    # rows << %w[Fairbanks Alaska sunny]
    # rows << %w[Olympia Washington wet]
    # rows << %w[Austin Texas bluesey]

    rows << @dto.new( *%w[Fairbanks Alaska sunny]  )
    rows << @dto.new( *%w[Olympia Washington wet]  )
    rows << @dto.new( *%w[Austin Texas blazinghot] )

    bt = BasicTable.new rows
    # bt.each { |row| p row }

    # p bt.first
    # puts bt.include? rows.first  #true

    wi = @dto.new(*%w[Fairbanks Alaska sunny])
    puts bt.include? wi                            # true

    wi.weather = 'cold'
    puts bt.include? wi                            # false
    puts bt.any? {|row| row.city == wi.city }      # true

    # @dto.class_eval do
    #   def ==(other)
    #     self.city == other.city
    #   end
    # end
    # puts bt.include? wi  # true

    cmp = Proc.new { |row| row.city == wi.city }
    puts bt.any? &cmp                              # true

    # bt2 = BasicTable.new rows
    # puts bt == bt2

    # bt.class.class_eval do
    # end

    p bt.first <=> wi                              # nil
  end
end

if __FILE__ == $0 
  TestBasicTableIteration.new.run
end
 
