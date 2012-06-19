
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/hplmn_odb_mapping'

class Test_HPLMN_ODB_MAPPING < MiniTest::Unit::TestCase

  def self.fields
    %w[PLMNODBID SERVICEKEY].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [ [0,1], [1,2], [2,0], [3,3] ]
  end

  def setup
    @obj = Alcatel::CallProcessing::HPLMN_ODB_MAPPING.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 4
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

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.plmnodbid = nil
    refute @obj.any? &obj.candidate_key

    obj.plmnodbid = cli_obj.plmnodbid
    obj.servicekey = nil
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

