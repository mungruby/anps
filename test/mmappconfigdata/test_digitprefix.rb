
require "minitest/autorun"
require_relative '../../lib/alcatel/mmappconfigdata/resource/digitprefix'

class Test_DIGITPREFIX < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_DIGITPREFIX", *fields do
      include Alcatel::MMAppConfigData::Resource::DIGITPREFIX
    end
  end

  def self.fields
    %w[ DIGITPREFIX COUNTRY_ID DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["1264           ",2,"Anguilla                      "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '1264', obj.digitprefix
    assert_equal 'Anguilla', obj.description
  end

  def test_convert_char_digitprefix
    @obj.digitprefix = "1264           "
    assert_equal '1264', @obj.convert_char_digitprefix
  end

  def test_convert_char_description
    @obj.description = "Anguilla                      "
    assert_equal 'Anguilla', @obj.convert_char_description
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Digit-Prefix;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1264-DIGITPREFIX;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1264-DIGITPREFIX;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add DIGITPREFIX Digit_Prefix=1264, Country_Region_ID=2, Description=Anguilla;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1264-DIGITPREFIX;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.digitprefix = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.country_id = nil
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

