
require "minitest/autorun"
require_relative '../../lib/alcatel/subscriberdata/resource/spmpcardcalltype'

class Test_SPMPCARDCALLTYPE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_SPMPCARDCALLTYPE", *fields do
      include Alcatel::SubscriberData::Resource::SPMPCARDCALLTYPE
    end
  end

  def self.fields
    %w[ CALLEDPTY_BEGIN CALLEDPTY_END PCARDNUM CALLTYPE ADMINSTATE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["{17736793000fffff}","{17736793099fffff}",0,1,2]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    obj.convert_fields
    assert_equal '17736793000', obj.calledpty_begin
    assert_equal '17736793099', obj.calledpty_end
  end

  def test_convert_binary_calledpty_begin
    @obj.calledpty_begin = "{17736793000fffff}"
    assert_equal '17736793000', @obj.convert_binary_calledpty_begin
  end

  def test_convert_binary_calledpty_end
    @obj.calledpty_end = "{17736793099fffff}"
    assert_equal '17736793099', @obj.convert_binary_calledpty_end
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/MSRN-HON-Distribution;"
    assert_equal expected, @obj.context
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
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 17736793000-17736793099-SPMPCARDCALLTYPE;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.calledpty_begin = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.calledpty_end = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.calledpty_begin = @obj.calledpty_begin
    obj.calledpty_end = @obj.calledpty_end
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
   
end

