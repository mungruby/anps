
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/countrycode'

class Test_COUNTRYCODE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_COUNTRYCODE", *fields do
      include Alcatel::CallProcessing::Resource::COUNTRYCODE
    end
  end

  def self.fields
    %w[ COUNTRYCODE MINLENGTH MAXLENGTH ROUTEINDEX DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["20 ",7,15,420,"Egypt                           "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.countrycode = "20 "
    @obj.description = "Egypt                           "

    assert_equal @obj, @obj.convert_fields
    assert_equal '20', @obj.countrycode
    assert_equal 'Egypt', @obj.description
  end

  def test_convert_char_countrycode
    @obj.countrycode = "20 "
    assert_equal '20', @obj.convert_char_countrycode
  end

  def test_convert_char_description
    @obj.description = "Egypt                           "
    assert_equal 'Egypt', @obj.convert_char_description
  end

  def test_context_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/"
    expected << "International-Translation;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 20-COUNTRYCODE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 20-COUNTRYCODE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add COUNTRYCODE Country_Code=20, Min__Length=7, Max__Length=15, "
    expected << "Orig__Route_Descriptor=420, Name=Egypt;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 20-COUNTRYCODE;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key 
    arr = [@obj]

    obj = @obj.clone
    refute obj.object_id == @obj.object_id
    assert arr.include? obj

    obj = @obj.clone
    obj.countrycode = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.minlength = nil
    obj.maxlength = nil
    obj.routeindex = nil
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end
   
  def teardown
    @obj = nil
  end
end

