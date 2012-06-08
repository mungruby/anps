
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/digitprefix'
require_relative '../../lib/field_converter/mmappconfigdata/digitprefix'

class Test_DIGITPREFIX < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      DIGITPREFIX
      COUNTRY_ID
      DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_DIGITPREFIX", *fields do
      include ::CLI::MMAppConfigData::DIGITPREFIX
      include ::FieldConverter::MMAppConfigData::DIGITPREFIX
    end
  end

  def setup
    test_data = ["1264           ",2,"Anguilla                      "]
    @obj = self.class.dto.new *test_data
  end

  def test_convert_fields
    assert_equal @obj, @obj.convert_fields
    assert_equal '1264', @obj.digitprefix
    assert_equal 'Anguilla', @obj.description
  end

  def test_convert_char_digitprefix
    assert_equal '1264', @obj.convert_char_digitprefix
  end

  def test_convert_char_description
    assert_equal 'Anguilla', @obj.convert_char_description
  end

  def test_cd_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Digit-Prefix;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    @obj.convert_fields
    expected = "query 1264-DIGITPREFIX;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    @obj.convert_fields
    expected =  "add DIGITPREFIX Digit_Prefix=1264, Country_Region_ID=2, Description=Anguilla;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod DIGITPREFIX "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    @obj.convert_fields
    expected = "del 1264-DIGITPREFIX;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

