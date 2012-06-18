
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmlnporder'

class Test_CPCALLMLNPORDER < MiniTest::Unit::TestCase

  def self.fields
    %w[DIGITPATTERN LNPORDER].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     ["12             ",1],
     ["13             ",1]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMLNPORDER.new(self.class.test_data)
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

    obj.digitpattern = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.digitpattern = nil
    refute @obj.any? &obj.candidate_key

    obj.digitpattern = cli_obj.digitpattern
    obj.lnporder = nil
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

