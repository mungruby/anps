
require "minitest/autorun"
require_relative '../../../lib/alcatel/mmappconfigdata/msc_cfg_neighborhood'

class Test_MSC_CFG_NEIGHBORHOOD < MiniTest::Unit::TestCase

  def self.fields
    %w[ MCC MNC LAC MSCID VLRID DESCRIPTION ADMINSTATE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     ["{030100}","{02060f}",7804,309,310,"CHMSS966_CHBSC121               ",2],
     ["{030100}","{020600}",7804,365,366,"CHMSS932                        ",2]
    ]
  end

  def setup
    @obj = Alcatel::MMAppConfigData::MSC_CFG_NEIGHBORHOOD.new(self.class.test_data)
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
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.mcc = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.mnc = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.lac = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.mcc = cli_obj.mcc
    obj.mnc = cli_obj.mnc
    obj.lac = cli_obj.lac
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

