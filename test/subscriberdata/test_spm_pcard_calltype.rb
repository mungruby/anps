
require "minitest/autorun"
require_relative '../../lib/alcatel/subscriberdata/spm_pcard_calltype'

class Test_SPM_PCARD_CALLTYPE < MiniTest::Unit::TestCase

  def self.fields
    %w[ CALLEDPTY_BEGIN CALLEDPTY_END PCARDNUM CALLTYPE ADMINSTATE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [["{17736793000fffff}","{17736793099fffff}",0,1,2],["{17736794000fffff}","{17736794099fffff}",0,1,2]]
  end

  def setup
    @tbl = Alcatel::SubscriberData::SPM_PCARD_CALLTYPE.new('test_mss', self.class.test_data)
  end

  def test_mss_name
    assert_equal 'test_mss', @tbl.mss_name
  end
   
  def test_entries
    refute @tbl.class.respond_to? :entries
    assert @tbl.respond_to? :entries
  end
   
  def test_resource_method
    assert @tbl.class.respond_to? :resource
    refute @tbl.respond_to? :resource
  end

  def test_each_method
    refute @tbl.class.respond_to? :each
    assert @tbl.respond_to? :each
  end

  def teardown
    @tbl = nil
  end
end

