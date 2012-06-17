
require "minitest/autorun"
require_relative '../../lib/alcatel/mmappconfigdata/msc_cfg_country_digit_prefixes'

class Test_MSC_CFG_COUNTRY_DIGIT_PREFIXES < MiniTest::Unit::TestCase

  def self.fields
    %w[ DIGITPREFIX COUNTRY_ID DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     ["52             ",1,"Mexico                        "],
     ["1264           ",2,"Anguilla                      "]
    ]
  end

  def setup
    @obj = Alcatel::MMAppConfigData::MSC_CFG_COUNTRY_DIGIT_PREFIXES.new('test_mss', self.class.test_data)
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

  def test_first_entry_has_cli_methods
    obj = @obj.first
    assert_block do
      [:context, :cd, :query, :add, :mod, :del].map { |method|
        obj.respond_to? method }.include?(false) ? false : true
    end
  end

  def test_resource_has_expected_members
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def test_include
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.include? obj

    obj = cli_obj.clone
    obj.digitprefix = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.country_id = nil
    obj.description = nil
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

