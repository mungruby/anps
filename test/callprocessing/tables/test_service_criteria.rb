
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/service_criteria'

class Test_SERVICE_CRITERIA < MiniTest::Unit::TestCase

  def self.fields
    %w[SERVICEKEY HANDLINGCRITERIA DESCRIPTION].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [1,0,"BHPLMN Type 1                   "],
     [2,0,"BHPLMN Type 1                   "],
     [3,0,"BHPLMN Type 4                   "]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::SERVICE_CRITERIA.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 3
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

    obj.servicekey = nil
    refute @obj.any? &obj.candidate_key

    obj.servicekey = cli_obj.servicekey
    obj.handlingcriteria = nil
    assert @obj.any? &obj.candidate_key

    obj.description = nil
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

