
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/prefix'
require_relative '../../lib/field_converter/callprocessing/prefix'
require_relative '../../lib/comparators/callprocessing/prefix'

class Test_PREFIX < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_PREFIX", *fields do
      include ::CLI::CallProcessing::PREFIX
      include ::FieldConverter::CallProcessing::PREFIX
      include ::Comparators::CallProcessing::PREFIX
    end
  end

  def self.fields
    %w[ TRANSTREESELECTOR TREETYPE M1TYPE M2TYPE M3TYPE M4TYPE M5TYPE DESCRIPTION
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,3,0,0,0,0,0,"Standard Prefix Trans           "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.description = "Standard Prefix Trans           "
    assert_equal @obj, @obj.convert_fields
    assert_equal 'Standard Prefix Trans', @obj.description
  end

  def test_convert_char_description
    @obj.description = "Standard Prefix Trans           "
    assert_equal 'Standard Prefix Trans', @obj.convert_char_description
  end
   
  def test_cd_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/"
    expected << "Prefix-Translation/Digit-Translation;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-PREFIX;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add PREFIX Translator_Identifier=1, Tree_Type=3, Name=Standard Prefix Trans;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "cd 1-PREFIX; mod Name=Standard Prefix Trans;"
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-PREFIX;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]

    obj = @obj.clone
    refute obj.object_id == @obj.object_id
    assert arr.include? obj

    obj = @obj.clone
    obj.transtreeselector = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.description = "Test Prefix Tree"
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

