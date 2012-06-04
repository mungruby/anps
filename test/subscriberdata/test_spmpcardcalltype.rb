
require "minitest/autorun"
require_relative '../../lib/cli/subscriberdata/spmpcardcalltype'
require_relative '../../lib/field_converter/subscriberdata/spmpcardcalltype'

class Test_SPMPCARDCALLTYPE < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      CALLEDPTY_BEGIN
      CALLEDPTY_END
      PCARDNUM
      CALLTYPE
      ADMINSTATE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_SPMPCARDCALLTYPE", *fields do
      include ::CLI::SubscriberData::SPMPCARDCALLTYPE
      include ::FieldConverter::SubscriberData::SPMPCARDCALLTYPE
    end
  end

  def setup
    test_data = ["{17736793000fffff}","{17736793099fffff}",0,1,2]
    @obj = self.class.dto.new *test_data
    @obj.convert_fields
  end

  def test_cd
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/MSRN-HON-Distribution;"
    assert_equal expected, ::CLI::SubscriberData::SPMPCARDCALLTYPE.cd
  end
   
  def test_cd_cli
    expected = "cd 17736793000-17736793099-SPMPCARDCALLTYPE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 17736793000-17736793099-SPMPCARDCALLTYPE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add SPMPCARDCALLTYPE Called_Pty_Begin=17736793000, Called_Pty_End=17736793099, "
    expected << "Pool_ID=0, Numbering_Type=1;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod SPMPCARDCALLTYPE"
    skip
  end
   
  def test_del_cli
    expected = "del 17736793000-17736793099-SPMPCARDCALLTYPE;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
   
end

