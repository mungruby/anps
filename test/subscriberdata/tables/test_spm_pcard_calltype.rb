
require "minitest/autorun"
require_relative '../../../lib/alcatel/subscriberdata/spm_pcard_calltype'

class Test_SPM_PCARD_CALLTYPE < MiniTest::Unit::TestCase

  def self.fields
    %w[ CALLEDPTY_BEGIN CALLEDPTY_END PCARDNUM CALLTYPE ADMINSTATE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     ["{17736793000fffff}","{17736793099fffff}",0,1,2],
     ["{17736794000fffff}","{17736794099fffff}",0,1,2]
    ]
  end

  def setup
    @obj = Alcatel::SubscriberData::SPM_PCARD_CALLTYPE.new('test_mss', self.class.test_data)
  end

  def test_mss_name
    assert_equal 'test_mss', @obj.mss_name
  end
   
  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 2
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def test_first_entry
    obj = @obj.entries.first.convert_fields
    assert_equal '17736793000', obj.calledpty_begin
    assert_equal '17736793099', obj.calledpty_end
    assert_equal 0, obj.pcardnum
    assert_equal 1, obj.calltype
    assert_equal 2, obj.adminstate

    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/MSRN-HON-Distribution;"
    assert_equal expected, @obj.first.context

    expected = "cd 17736793000-17736793099-SPMPCARDCALLTYPE;"
    assert_equal expected, @obj.first.cd

    expected = "query 17736793000-17736793099-SPMPCARDCALLTYPE;"
    assert_equal expected, @obj.first.query

    expected = "add SPMPCARDCALLTYPE Called_Pty_Begin=17736793000, Called_Pty_End=17736793099, Pool_ID=0, Numbering_Type=1;"
    assert_equal expected, @obj.first.add

    expected =  "mod "
    assert_equal expected, @obj.first.mod
     
    expected = "del 17736793000-17736793099-SPMPCARDCALLTYPE;"
    assert_equal expected, @obj.first.del
  end

  def test_include
    obj = @obj.first.clone
    assert @obj.include? obj

    obj = @obj.first.clone
    obj.calledpty_begin = nil
    refute @obj.include? obj

    obj = @obj.first.clone
    obj.calledpty_end = nil
    refute @obj.include? obj
  end

  def test_any
    obj = @obj.first.clone
    assert @obj.any? &obj.candidate_key

    obj = @obj.first.clone
    obj.calledpty_begin = nil
    refute @obj.any? &obj.candidate_key

    obj = @obj.first.clone
    obj.calledpty_end = nil
    refute @obj.any? &obj.candidate_key

    obj = @obj.first.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.calledpty_begin = @obj.first.calledpty_begin
    obj.calledpty_end = @obj.first.calledpty_end
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

