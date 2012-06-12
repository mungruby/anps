
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/restrictedlaccell'
require_relative '../../lib/field_converter/mmappconfigdata/restrictedlaccell'
require_relative '../../lib/comparators/mmappconfigdata/restrictedlaccell'

class Test_RESTRICTEDLACCELL < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_RESTRICTEDLACCELL", *fields do
      include ::CLI::MMAppConfigData::RESTRICTEDLACCELL
      include ::FieldConverter::MMAppConfigData::RESTRICTEDLACCELL
      include ::Comparators::MMAppConfigData::RESTRICTEDLACCELL
      attr_accessor :mcc_mnc
    end
  end

  def self.fields
    %w[ MCC_MNC_ID LAC CELLID_BEGIN CELLID_END RESTRICTED_LAC RESTRICTION_LIST
      DESCRIPTION RESTRICTED_ACCESS_TYPE REJECTIONCAUSE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,7809,0,65535,1,15,"LAC 7809 REST ID 15             ",1,0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
    @obj.mcc_mnc = '31026'
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal 'LAC 7809 REST ID 15', obj.description
  end

  def test_convert_char_description
    @obj.description = "LAC 7809 REST ID 15             "
    assert_equal 'LAC 7809 REST ID 15', @obj.convert_char_description
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/LAC-Restriction-Provisioning;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 31026-7809-0-65535-RESTRICTEDLACCELL;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 31026-7809-0-65535-RESTRICTEDLACCELL;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add RESTRICTEDLACCELL Mcc_Mnc_Id=31026, LAC=7809, RESTRICTED_LAC=1, "
    # expected << "CELLID_BEGIN=0, CELLID_END=65535, "
    expected << "RESTRICTION_LIST=15, Description=LAC 7809 REST ID 15;"
    assert_equal expected, @obj.add
  end
   
  def test_add_cli_when_lac_not_fully_restricted
    test_data = [1,7809,0,65535,0,15,"LAC 7809 REST ID 15             ",1,0]
    obj = self.class.dto.new *test_data
    obj.convert_fields
    obj.mcc_mnc = '31026'
    expected =  "add RESTRICTEDLACCELL Mcc_Mnc_Id=31026, LAC=7809, RESTRICTED_LAC=0, "
    expected << "CELLID_BEGIN=0, CELLID_END=65535, "
    expected << "RESTRICTION_LIST=15, Description=LAC 7809 REST ID 15;"
    assert_equal expected, obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 31026-7809-0-65535-RESTRICTEDLACCELL;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.mcc_mnc = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.lac = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.cellid_begin = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.cellid_end = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.mcc_mnc = @obj.mcc_mnc
    obj.lac = @obj.lac
    obj.cellid_begin = @obj.cellid_begin
    obj.cellid_end = @obj.cellid_end
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

