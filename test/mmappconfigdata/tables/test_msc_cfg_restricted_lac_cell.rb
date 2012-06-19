
require "minitest/autorun"
require_relative '../../../lib/alcatel/mmappconfigdata/msc_cfg_restricted_lac_cell'

class Test_MSC_CFG_RESTRICTED_LAC_CELL < MiniTest::Unit::TestCase

  def self.fields
    %w[ MCC_MNC_ID LAC CELLID_BEGIN CELLID_END RESTRICTED_LAC RESTRICTION_LIST
      DESCRIPTION RESTRICTED_ACCESS_TYPE REJECTIONCAUSE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [1,7809,0,65535,1,15,"LAC 7809 REST ID 15             ",1,0]
    ]
  end

  def setup
    @obj = Alcatel::MMAppConfigData::MSC_CFG_RESTRICTED_LAC_CELL.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 1
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def test_resource_has_expected_members
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def test_resource_has_cli_methods
    obj = @obj.first
    assert_block do
      [:context, :cd, :query, :add, :mod, :del].map { |method|
        obj.respond_to? method }.include?(false) ? false : true
    end
  end

  def test_candidate_key
    cli_obj = @obj.first
    cli_obj.mcc_mnc = '310260'
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.mcc_mnc = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.lac = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.cellid_begin = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.cellid_end = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.mcc_mnc = cli_obj.mcc_mnc
    obj.lac = cli_obj.lac
    obj.cellid_begin = cli_obj.cellid_begin
    obj.cellid_end = cli_obj.cellid_end
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

