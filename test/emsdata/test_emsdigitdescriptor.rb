
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
    # @obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', self.class.test_data)
  end

  def test_initialize
    # assert @obj
    # assert_equal 'test_mss', @obj.mss_name
    obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', [])
    assert obj
    assert_equal 'test_mss', obj.mss_name
  end

  def test_fields
    # assert self.class.fields == @obj.class.fields
    obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', [])
    assert self.class.fields == obj.class.fields
  end

  def test_entries
    obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', [])
    assert obj.entries
  end

  def test_respond_to_each
    # assert @obj.respond_to? :entries
    obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', [])
    assert obj.respond_to? :each
  end

  def test_enumerable
    # assert_kind_of Enumerable, @obj
    obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', [])
    assert_kind_of Enumerable, obj
  end

  def _test_first_entry
    obj = @obj.entries.first
    assert_equal 'REMOTE POOLING RC', obj.descriptor
    assert_equal 7665, obj.descriptorindex
  end

  # def _test_first
  #   assert @obj.first
  #   # assert_equal 'REMOTE POOLING RC', @obj.descriptor
  # end

  # def _test_convert_fields
  #   # @obj.descriptor = "REMOTE POOLING RC               "
  #   # assert_equal 'REMOTE POOLING RC               ', @obj.descriptor
  #   assert_equal @obj, @obj.convert_fields
  #   assert_equal 'REMOTE POOLING RC', @obj.descriptor
  # end

  # def _test_convert_char_descriptor
  #   @obj.descriptor = "REMOTE POOLING RC               "
  #   assert_equal 'REMOTE POOLING RC', @obj.convert_char_descriptor
  # end

  # def _test_cd_cli
  #   expected =  "cd; cd Office-Parameters/Routing-and-Translation"
  #   expected << "/Routing/Orig-Routing/Orig-Route-Descriptor;"
  #   assert_equal expected, @obj.cd
  # end
   
  # def _test_query_cli
  #   expected = "query 7665-DIGITDESCRIPTOR;"
  #   assert_equal expected, @obj.query
  # end
   
  # def _test_add_cli
  #   expected =  "add DIGITDESCRIPTOR Index=7665, Name=REMOTE POOLING RC;" 
  #   assert_equal expected, @obj.add
  # end
   
  #def _test_mod_cli
  #  expected =  "cd 7665-DIGITDESCRIPTOR;\nmod DIGITDESCRIPTOR "
  #  assert_equal expected, @obj.mod
  #end
   
  #def _test_del_cli
  #  expected = "del 7665-DIGITDESCRIPTOR;"
  #  assert_equal expected, @obj.del
  #end
   
  def teardown
    @obj = nil
  end
end

