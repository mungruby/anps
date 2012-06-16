
require "minitest/autorun"
require_relative '../../lib/alcatel/EmsData/emsdigitdescriptor'

class Test_EMSDIGITDESCRIPTOR < MiniTest::Unit::TestCase

  def self.fields
    %w[ DESCRIPTOR DESCRIPTORINDEX DESCRIPTORTYPE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
      ["REMOTE POOLING RC               ",7665,0]
    ]
  end

  def setup
    @obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', self.class.test_data)
  end

  def test_mss_name
    assert_equal 'test_mss', @obj.mss_name
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def test_first_entry
    obj = @obj.entries.first.convert_fields
    assert_equal 'REMOTE POOLING RC', obj.descriptor
    assert_equal 7665, obj.descriptorindex
    assert_equal 0, obj.descriptortype

    expected = "cd; cd Office-Parameters/Routing-and-Translation/Routing/Orig-Routing/Orig-Route-Descriptor;"
    assert_equal expected, @obj.first.context

    expected = "query 7665-DIGITDESCRIPTOR;"
    assert_equal expected, @obj.first.query

    expected = "cd 7665-DIGITDESCRIPTOR;"
    assert_equal expected, @obj.first.cd

    expected = "add DIGITDESCRIPTOR Index=7665, Name=REMOTE POOLING RC;" 
    assert_equal expected, @obj.first.convert_fields.add

    expected =  "mod "
    assert_equal expected, @obj.first.mod
     
    expected = "del 7665-DIGITDESCRIPTOR;"
    assert_equal expected, @obj.first.del
  end

  def teardown
    @obj = nil
  end
end

