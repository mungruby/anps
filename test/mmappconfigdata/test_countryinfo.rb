
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/countryinfo'
require_relative '../../lib/field_converter/mmappconfigdata/countryinfo'

class Test_COUNTRYINFO < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      COUNTRY_ID
      COUNTRY_NAME
      CB_CRITERIA
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_COUNTRYINFO", *fields do
      include ::CLI::MMAppConfigData::COUNTRYINFO
      include ::FieldConverter::MMAppConfigData::COUNTRYINFO
    end
  end

  def setup
    test_data = [2,"Caribbean                     ",1]
    @obj = self.class.dto.new *test_data
  end

  def test_convert_char_country_name
    assert_equal 'Caribbean', @obj.convert_char_country_name
  end

  def test_convert_fields
    @obj.convert_fields
    assert_equal 'Caribbean', @obj.country_name
  end

  def test_cd_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Country-Info;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 2-COUNTRYINFO;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    @obj.convert_fields
    expected =  "add COUNTRYINFO Country_Region_ID=2, Barring_Criteria=1, Name=Caribbean;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod COUNTRYINFO "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 2-COUNTRYINFO;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

