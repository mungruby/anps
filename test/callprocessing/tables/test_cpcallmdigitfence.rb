
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmdigitfence'

class Test_CPCALLMDIGITFENCE < MiniTest::Unit::TestCase

  def self.fields
    %w[
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMDIGITFENCE.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def _test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 2
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def _test_resource_has_expected_members
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def teardown
    @obj = nil
  end
end

