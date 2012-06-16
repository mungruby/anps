
require "minitest/autorun"
require_relative '../../lib/alcatel/mmappconfigdata/resource/countryinfo'

class Test_COUNTRYINFO < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_COUNTRYINFO", *fields do
      include Alcatel::MMAppConfigData::Resource::COUNTRYINFO
    end
  end

  def self.fields
    %w[ COUNTRY_ID COUNTRY_NAME CB_CRITERIA
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [2,"Caribbean                     ",1]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal 'Caribbean', obj.country_name
  end

  def test_convert_char_country_name
    @obj.country_name = "Caribbean                     "
    assert_equal 'Caribbean', @obj.convert_char_country_name
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Country-Info;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 2-COUNTRYINFO;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 2-COUNTRYINFO;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add COUNTRYINFO Country_Region_ID=2, Barring_Criteria=1, Name=Caribbean;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 2-COUNTRYINFO;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.country_id = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.country_name = nil
    obj.cb_criteria = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

