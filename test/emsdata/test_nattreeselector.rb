
require "minitest/autorun"
require_relative '../../lib/cli/EmsData/nattreeselector'
require_relative '../../lib/field_converter/EmsData/nattreeselector'
require_relative '../../lib/comparators/EmsData/nattreeselector'

class Test_NATTREESELECTOR < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_NATTREESELECTOR", *fields do
      include ::CLI::EmsData::NATTREESELECTOR
      include ::FieldConverter::EmsData::NATTREESELECTOR
      include ::Comparators::EmsData::NATTREESELECTOR
    end
  end

  def self.fields
    @@fields = %w[
      NATTREESELECTOR
      DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    @@test_data ||= [10,"Remote National Pooling Tree    "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.description = "Remote National Pooling Tree    "
    assert_equal 'Remote National Pooling Tree    ', @obj.description
    assert_equal @obj, @obj.convert_fields
    assert_equal 'Remote National Pooling Tree', @obj.description
  end

  def test_convert_char_descriptor
    @obj.description = "Remote National Pooling Tree    "
    assert_equal 'Remote National Pooling Tree', @obj.convert_char_description
  end

  def test_cd_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation"
    expected << "/Wireless-Translation/National-Tree-Selector;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 10-NATTREESELECTOR;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add NATTREESELECTOR National_Tree_Selector_Identifier=10, "
    expected << "Name=Remote National Pooling Tree;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected =  "cd 10-NATTREESELECTOR;\nmod NATTREESELECTOR "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 10-NATTREESELECTOR;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

