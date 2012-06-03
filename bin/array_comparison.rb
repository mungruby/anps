#!/usr/bin/env ruby -w

class RowComparator
  def initialize row, comparator
    @row, @comparator = row, comparator
  end
  def compare other
    @comparator.call @row, other
  end
end

class TableComparator
  def initialize table, comparator
    @table, @comparator = table, comparator
  end
  def add other
    @table.each do |row|
      other.delete_if {|item| @comparator.call row, item}
    end
    other
  end
end

cmp = Proc.new {|a, b| a[1] == b[1]}

class TestArrayComparison

  def initialize comparator
    @cmp = comparator
  end

  def run
    a1 = [1, 'sue', 'm' ]
    a2 = [2, 'sue', 'f' ]

    puts  a1.equal? a2     # false
    puts  a1.eql? a2       # false
    puts  a1 == a2         # false
    puts  a1 === a2        # false
    puts  a1 <=> a2        # -1
    puts

    rc = RowComparator.new a1, @cmp
    puts rc.compare a2     #true
    puts

    tbl1 = [].push(a1).push [2, 'joe', 'm']
    tbl2 = [].push(a2).push [1, 'barry', 'm']

    tc = TableComparator.new tbl1, @cmp
    p tc.add Array.new(tbl2)   # [[1, "barry", "m"]]
    puts

    # Add some identical data to each table
    tbl1 << [3, 'jill', 'f']
    tbl2 << [3, 'jill', 'f']

    # Delete identical rows with identical values
    tbl3 = tbl2 - tbl1

    # then compare
    p tc.add tbl3              # [[1, "barry", "m"]]
  end
end

if __FILE__ == $0 
  TestArrayComparison.new(cmp).run
end
 
