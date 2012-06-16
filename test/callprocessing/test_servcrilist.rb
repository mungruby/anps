
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/servcrilist'

class Test_SERVCRILIST < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_SERVCRILIST", *fields do
      include Alcatel::CallProcessing::Resource::SERVCRILIST
    end
  end

  def self.fields
    %w[ SERVICEKEY DIGITPATTERN DIGITTYPE
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,"{0316f1ffffffffffff}",0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.digitpattern = "{0316f1ffffffffffff}"
    assert_equal @obj, @obj.convert_fields
    assert_equal '611', @obj.digitpattern
  end

  def test_convert_binary_digitpattern
    @obj.digitpattern = "{0316f1ffffffffffff}"
    assert_equal '611', @obj.convert_binary_digitpattern
    @obj.digitpattern = "{0a8858136646ffffff}"
    assert_equal '8885316664', @obj.convert_binary_digitpattern
    @obj.digitpattern = "{0b8177574888f7ffff}"
    assert_equal '18777584887', @obj.convert_binary_digitpattern
  end
   
  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/ODB-Config/1-SERVICECRILISTKEY;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1-611-0-SERVCRILIST;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-611-0-SERVCRILIST;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add SERVCRILIST Service_Key=1, Digit_Pattern=611, Digit_Type=0;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "The resource cannot be modified."
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-611-0-SERVCRILIST;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.servicekey = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digitpattern = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digittype = nil
    refute arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

