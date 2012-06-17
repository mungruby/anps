
require "minitest/autorun"
require_relative '../../lib/alcatel/EmsData/emsdigitdescriptor'

class Test_EMSDIGITDESCRIPTOR < MiniTest::Unit::TestCase

  def self.fields
    %w[ DESCRIPTOR DESCRIPTORINDEX DESCRIPTORTYPE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
      ["REMOTE POOLING RC               ",7665,0]
    ]
  end

  def setup
    @obj = Alcatel::EmsData::EMSDIGITDESCRIPTOR.new('test_mss', self.class.test_data)
  end

  def test_mss_name
    assert_equal 'test_mss', @obj.mss_name
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
    obj = @obj.first.clone
    assert @obj.include? obj

    obj = @obj.first.clone
    obj.descriptor = nil
    refute @obj.include? obj

    obj = @obj.first.clone
    obj.descriptorindex = nil
    refute @obj.include? obj

    obj = @obj.first.clone
    obj.descriptortype = nil
    refute @obj.include? obj
  end

  def test_any
    obj = @obj.first.clone
    assert @obj.any? &obj.candidate_key

    obj = @obj.first.clone
    obj.descriptorindex = nil
    refute @obj.any? &obj.candidate_key

    obj = @obj.first.clone
    obj.descriptor = nil
    assert @obj.any? &obj.candidate_key

    obj = @obj.first.clone
    obj.descriptortype = nil
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

