
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmlatanxx'

class Test_CPCALLMLATANXX < MiniTest::Unit::TestCase

  def self.fields
    %w[LATANUMBER NPA_NXX DESCRIPTION].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [1,"425    ","permitted                       "],
     [1,"274    ","permitted                       "]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMLATANXX.new(self.class.test_data)
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

  def test_candidate_key
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.latanumber = nil
    refute @obj.any? &obj.candidate_key

    obj.latanumber = cli_obj.latanumber
    obj.npa_nxx = nil
    refute @obj.any? &obj.candidate_key

    obj.npa_nxx = cli_obj.npa_nxx
    obj.description = nil
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

