
require "minitest/autorun"
require_relative '../../lib/cli/EmsData/prefixfence'
require_relative '../../lib/field_converter/EmsData/prefixfence'
require_relative '../../lib/comparators/EmsData/prefixfence'

class Test_PREFIXFENCE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_PREFIXFENCE", *fields do
      include ::CLI::EmsData::PREFIXFENCE
      include ::FieldConverter::EmsData::PREFIXFENCE
      include ::Comparators::EmsData::PREFIXFENCE
    end
  end

  def self.fields
    %w[ PREFIXTREESELECTOR
        DIGITPATTERN
        TRANSLATIONGROUP
        EXPECTEDDIGITCOUNT
        DIGITFENCEINDEX
        DESCRIPTION
        SELECTOR_TYPE
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,"144393930                       ",1,11,924,"DCMGW417 MSRNs                  ",0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.digitpattern = "144393930                       "
    @obj.description = "DCMGW417 MSRNs                  "
    assert_equal @obj, @obj.convert_fields
    assert_equal '144393930', @obj.convert_char_digitpattern
    assert_equal 'DCMGW417 MSRNs', @obj.convert_char_description
  end

  def test_convert_char_digitpattern
    @obj.digitpattern = "144393930                       "
    assert_equal '144393930', @obj.convert_char_digitpattern
  end

  def test_convert_char_description
    @obj.description = "DCMGW417 MSRNs                  "
    assert_equal 'DCMGW417 MSRNs', @obj.convert_char_description
  end

  def test_cd_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/"
    expected << "Prefix-Translation/Digit-Translation/1-PREFIX/Digit-Prefix-Translation;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-144393930-1-11-PREFIXFENCE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add PREFIXFENCE Prefix_Tree=1, Digit_String=144393930, Name=DCMGW417 MSRNs, "
    expected << "Translation_Group=1, Min_Digit_Cnt=11, "
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "cd 1-144393930-1-11-PREFIXFENCE;mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-144393930-1-11-PREFIXFENCE;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]

    obj = @obj.clone
    refute obj.object_id == @obj.object_id
    assert arr.include? obj

    obj = @obj.clone
    obj.prefixtreeselector = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digitpattern = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.translationgroup = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.description = "Test Prefix Tree"
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

