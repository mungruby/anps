
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmlrnlist'

class Test_CPCALLMLRNLIST < MiniTest::Unit::TestCase

  def self.fields
    %w[LRN HLR_NUM].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     ["6032059981     ",0],
     ["6032059000     ",0]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMLRNLIST.new(self.class.test_data)
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

    obj.lrn = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.lrn = nil
    refute @obj.any? &obj.candidate_key

    obj.lrn = cli_obj.lrn
    obj.hlr_num = nil
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

