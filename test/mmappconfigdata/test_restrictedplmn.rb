
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/restrictedplmn'
require_relative '../../lib/field_converter/mmappconfigdata/restrictedplmn'

class Test_RESTRICTEDPLMN < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      RESTRICTION_LIST
      MCC
      MNC
      DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_RESTRICTEDPLMN", *fields do
      include ::CLI::MMAppConfigData::RESTRICTEDPLMN
      include ::FieldConverter::MMAppConfigData::RESTRICTEDPLMN
    end
  end

  def setup
    test_data = [15, "{030100}","{01070f}","USA 31017                       "]
    @obj = self.class.dto.new *test_data
    @obj.convert_fields
  end

  def test_cd
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Restricted-PLMN;"
    assert_equal expected, ::CLI::MMAppConfigData::RESTRICTEDPLMN.cd
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
    expected = "mod RESTRICTEDPLMN "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 15-310-17-RESTRICTEDPLMN;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

