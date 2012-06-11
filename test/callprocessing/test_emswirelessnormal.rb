
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/emswirelessnormal'
require_relative '../../lib/field_converter/callprocessing/emswirelessnormal'
require_relative '../../lib/comparators/callprocessing/emswirelessnormal'

class Test_EMSWIRELESSNORMAL < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_EMSWIRELESSNORMAL", *fields do
      include ::CLI::CallProcessing::EMSWIRELESSNORMAL
      include ::FieldConverter::CallProcessing::EMSWIRELESSNORMAL
      include ::Comparators::CallProcessing::EMSWIRELESSNORMAL
    end
  end

  def self.fields
    %w[ TRANSTREESELECTOR TREETYPE M1TYPE M2TYPE M3TYPE M4TYPE M5TYPE DESCRIPTION
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [201,1,0,0,0,0,0,"Standard Normalization          "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.description = "Standard Normalization          "
    assert_equal @obj, @obj.convert_fields
    assert_equal 'Standard Normalization', @obj.description
  end

  def test_convert_char_description
    @obj.description = "Standard Normalization          "
    assert_equal 'Standard Normalization', @obj.convert_char_description
  end
   
  def test_context_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/"
    expected << "Wireless-Normalization/Digit-Translation;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 201-EMSWIRELESSNORMAL;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 201-EMSWIRELESSNORMAL;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add EMSWIRELESSNORMAL Translator_Identifier=201, Tree_Type=1, Name=Standard Normalization;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod Name=Standard Normalization;"
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 201-EMSWIRELESSNORMAL;"
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
    obj.treetype = nil
    obj.m1type = nil
    obj.m2type = nil
    obj.m3type = nil
    obj.m4type = nil
    obj.m5type = nil
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

