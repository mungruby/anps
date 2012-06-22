
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/msctrunkgroupbundle'

class Test_MSCTRUNKGROUPBUNDLE < MiniTest::Unit::TestCase

  def self.fields
    %w[ BUNDLEINDEX SYSGRPORDER SYSGRPNUM WEIGHT ROUTETOSAMEMSF BUNDLEDESC
      DIGITSOUTPULSEINDEX CLDOUTPULSEINDEX CLIOUTPULSEINDEX
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
      [1,1,88,50,2,"CHMSS950 Toll Free Bundle       ",0,0,0],
      [2,1,14,1,2,"CHMSS950 IMT Bundle             ",0,0,0 ],
      [1,2,91,50,2,"CHMSS950 Toll Free Bundle       ",0,0,0]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::MSCTRUNKGROUPBUNDLE.new(self.class.test_data)
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
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def test_first_entry_has_cli_methods
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

    obj.bundleindex = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.sysgrporder = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.bundleindex = cli_obj.bundleindex
    obj.sysgrporder = cli_obj.sysgrporder
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def test_trunkgroup
    assert_kind_of Struct::TRUNKGROUP, @obj.first
  end

  def test_trunk_group_bundles
    assert_equal 2, @obj.trunk_group_bundles.size
    assert_kind_of Struct::TRUNKGROUPBUNDLE, @obj.trunk_group_bundles.first
  end

end

