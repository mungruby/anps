
require "minitest/autorun"
require_relative '../../lib/alcatel/subscriberdata/spm_pcard_calltype'

class Test_SPM_PCARD_CALLTYPE < MiniTest::Unit::TestCase

  def setup
    test_cls = Struct.new("Test", :fields, :data)
    fields = [:name, :address]
    data = ['scott', '@home']
    dto = test_cls.new(fields, data)
    @tbl = Alcatel::SubscriberData::SPM_PCARD_CALLTYPE.new 'test_mss', dto
  end

  def test_mss_name
    assert_equal 'test_mss', @tbl.mss_name
  end
   
  def test_entries
    assert @tbl.entries
  end
   
  def test_create_method
    assert @tbl.class.respond_to? :create
    refute @tbl.respond_to? :create
  end

  def test_each_method
    refute @tbl.class.respond_to? :each
    assert @tbl.respond_to? :each
  end

  def teardown
    @tbl = nil
  end
end

