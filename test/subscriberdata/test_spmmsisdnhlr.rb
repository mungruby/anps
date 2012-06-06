
require "minitest/autorun"
require_relative '../../lib/cli/subscriberdata/spmmsisdnhlr'
require_relative '../../lib/field_converter/subscriberdata/spmmsisdnhlr'

class Test_SPMMSISDNHLR < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      MSISDN_BEGIN
      MSISDN_END
      HLR_NUM
      PORTABLE
      HLR_TYPE
      ALT_HLR_NUM
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_SPMMSISDNHLR", *fields do
      include ::CLI::SubscriberData::SPMMSISDNHLR
      include ::FieldConverter::SubscriberData::SPMMSISDNHLR
    end
  end

  def setup
    test_data = ["{13058904000fffff}","{13058904999fffff}",0,0,1,0]
    @obj = self.class.dto.new *test_data
    @obj.convert_fields
  end

  def test_convert_fields
    test_data = ["{13058904000fffff}","{13058904999fffff}",0,0,1,0]
    obj = self.class.dto.new *test_data
    obj.convert_fields
    assert_equal '13058904000', obj.msisdn_begin
    assert_equal '13058904999', obj.msisdn_end
  end

  def test_convert_binary_msisdn_begin
    @obj.msisdn_begin = "{13058904000fffff}"
    assert_equal '13058904000', @obj.convert_binary_msisdn_begin
  end

  def test_convert_binary_msisdn_end
    @obj.msisdn_end = "{13058904999fffff}"
    assert_equal '13058904999', @obj.convert_binary_msisdn_end
  end

  def test_cd_cli
    expected = "cd; cd Office-Parameters/Routing-and-Translation/MSISDN-To-HLR;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 13058904000-13058904999-SPMMSISDNHLR;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add SPMMSISDNHLR MSISDN_Begin=13058904000, MSISDN_End=13058904999, HLR_Number=0;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod SPMMSISDNHLR "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 13058904000-13058904999-SPMMSISDNHLR;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
   
end

