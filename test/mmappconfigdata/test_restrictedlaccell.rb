
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/restrictedlaccell'

class Test_RESTRICTEDLACCELL < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      MCC_MNC_ID
      LAC         
      CELLID_BEGIN
      CELLID_END
      RESTRICTED_LAC
      RESTRICTION_LIST
      DESCRIPTION
      RESTRICTED_ACCESS_TYPE
      REJECTIONCAUSE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_RESTRICTEDLACCELL", *fields do
      include ::CLI::MMAppConfigData::RESTRICTEDLACCELL
      attr_accessor :mcc_mnc
    end
  end

  def setup
    test_data = [1,7809,0,65535,1,15,"LAC 7809 REST ID 15             ",1,0]
    @obj = self.class.dto.new *test_data
    @obj.mcc_mnc = '31026'
  end

  def test_cd
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/LAC-Restriction-Provisioning;"
    assert_equal expected, ::CLI::MMAppConfigData::RESTRICTEDLACCELL.cd
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
    obj.mcc_mnc = '31026'
    expected =  "add RESTRICTEDLACCELL Mcc_Mnc_Id=31026, LAC=7809, RESTRICTED_LAC=0, "
    expected << "CELLID_BEGIN=0, CELLID_END=65535, "
    expected << "RESTRICTION_LIST=15, Description=LAC 7809 REST ID 15;"
    assert_equal expected, obj.add
  end
   
  def test_mod_cli
    expected = "mod RESTRICTEDLACCELL"
    skip
  end
   
  def test_del_cli
    expected = "del 31026-7809-0-65535-RESTRICTEDLACCELL;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

