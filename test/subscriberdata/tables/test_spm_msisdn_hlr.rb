
require "minitest/autorun"
require_relative '../../../lib/alcatel/subscriberdata/spm_msisdn_hlr'

class Test_SPM_MSISDN_HLR < MiniTest::Unit::TestCase

  def self.fields
    %w[ MSISDN_BEGIN MSISDN_END HLR_NUM PORTABLE HLR_TYPE ALT_HLR_NUM
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     ["{13058904000fffff}","{13058904999fffff}",0,0,1,0],
     ["{13058905000fffff}","{13058905999fffff}",0,0,1,0]
    ]
  end

  def setup
    @obj = Alcatel::SubscriberData::SPM_MSISDN_HLR.new(self.class.test_data)
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
    assert self.class.fields == @obj.first.members
  end

  def test_resource_has_cli_methods
    obj = @obj.first
    assert_block do
      [:context, :cd, :query, :add, :mod, :del].map { |method|
        obj.respond_to? method }.include?(false) ? false : true
    end
  end

  def test_include
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.include? obj

    obj.msisdn_begin = nil
    refute @obj.include? obj

    obj = cli_obj.clone
    obj.msisdn_end = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.msisdn_begin = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.msisdn_end = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.msisdn_begin = cli_obj.msisdn_begin
    obj.msisdn_end = cli_obj.msisdn_end
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

