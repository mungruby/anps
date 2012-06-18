
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/emergency_call'

class Test_EMERGENCY_CALL < MiniTest::Unit::TestCase

  def self.fields
    %w[ MCC_MNC_ID LAC CELLID_BEGIN CELLID_END ESRD SOLUTION_TYPE ESZ_ID
        CAMA_INFO_DIGITS ESRK_ASSIGNMENT_METHOD LOC_DELIVERY_METHOD ESRK_PREFIX
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [2,11296,117580,117580,"0               ",2,319551,0,3,2,"                "],
     [2,11296,117581,117581,"0               ",2,319551,0,3,2,"                "]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::EMERGENCY_CALL.new(self.class.test_data)
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

    obj.mcc_mnc_id = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    # obj.mcc_mnc_id = nil
    # refute @obj.any? &obj.candidate_key

    # obj.mcc_mnc = nil
    # refute @obj.any? &obj.candidate_key

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
    obj.network_type = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    # obj.mcc_mnc = cli_obj.mcc_mnc
    obj.lac = cli_obj.lac
    obj.cellid_begin = cli_obj.cellid_begin
    obj.cellid_end = cli_obj.cellid_end
    # obj.network_type = cli_obj.network_type
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

