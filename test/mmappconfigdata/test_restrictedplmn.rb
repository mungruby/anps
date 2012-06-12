
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/restrictedplmn'
require_relative '../../lib/field_converter/mmappconfigdata/restrictedplmn'
require_relative '../../lib/comparators/mmappconfigdata/restrictedplmn'

class Test_RESTRICTEDPLMN < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_RESTRICTEDPLMN", *fields do
      include ::CLI::MMAppConfigData::RESTRICTEDPLMN
      include ::FieldConverter::MMAppConfigData::RESTRICTEDPLMN
      include ::Comparators::MMAppConfigData::RESTRICTEDPLMN
    end
  end

  def self.fields
    %w[ RESTRICTION_LIST MCC MNC DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [15, "{030100}","{01070f}","USA 31017                       "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '310', obj.mcc
    assert_equal '17', obj.mnc
    assert_equal 'USA 31017', obj.description
  end

  def test_convert_binary_mcc
    @obj.mcc = "{030100}"
    assert_equal '310', @obj.convert_binary_mcc
  end

  def test_convert_binary_mnc
    @obj.mnc = "{01070f}"
    assert_equal '17', @obj.convert_binary_mnc
  end

  def test_convert_char_description
    @obj.description = "USA 31017                       "
    assert_equal 'USA 31017', @obj.convert_char_description
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Restricted-PLMN;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 15-310-17-RESTRICTEDPLMN;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 15-310-17-RESTRICTEDPLMN;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add RESTRICTEDPLMN Restriction_List_Id=15, "
    expected << "Mobile_Country_Code=310, Mobile_Network_Code=17, Description=USA 31017;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 15-310-17-RESTRICTEDPLMN;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.restriction_list = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.mcc = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.mnc = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

