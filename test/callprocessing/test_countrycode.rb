
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/countrycode'
require_relative '../../lib/field_converter/callprocessing/countrycode'

class Test_COUNTRYCODE < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      COUNTRYCODE
      MINLENGTH
      MAXLENGTH
      ROUTEINDEX
      DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_COUNTRYCODE", *fields do
      include ::CLI::CallProcessing::COUNTRYCODE
      include ::FieldConverter::CallProcessing::COUNTRYCODE
    end
  end

  def setup
    test_data = ["20 ",7,15,420,"Egypt                           "]
    @obj = self.class.dto.new *test_data
  end

  def test_convert_char_countrycode
    assert_equal '20', @obj.convert_char_countrycode
  end

  def test_convert_char_description
    assert_equal 'Egypt', @obj.convert_char_description
  end

  def test_convert_fields
    @obj.convert_fields
    assert_equal '20', @obj.countrycode
    assert_equal 'Egypt', @obj.description
  end

  def test_cd_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/"
    expected << "International-Translation;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    @obj.convert_fields
    expected = "query 20-COUNTRYCODE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    @obj.convert_fields
    expected =  "add COUNTRYCODE Country_Code=20, Min__Length=7, Max__Length=15, "
    expected << "Orig__Route_Descriptor=420, Name=Egypt;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    @obj.convert_fields
    expected =  "cd 20-COUNTRYCODE;\nmod COUNTRYCODE "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    @obj.convert_fields
    expected = "del 20-COUNTRYCODE;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

