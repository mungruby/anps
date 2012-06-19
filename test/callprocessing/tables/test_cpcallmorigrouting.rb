
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmorigrouting'

class Test_CPCALLMORIGROUTING < MiniTest::Unit::TestCase

  def self.fields
    %w[ROUTEINDEX ORIGROUTINGMODIFIER DIGITTYPE ROUTEACTIONTYPE ROUTEACTION AMATRANSLATIONINDEX DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [911442,442,26,7,911442,1,"E911 CLMGW442                   "],
     [51,1,26,7,678498,1,"HNMSC084                        "]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMORIGROUTING.new(self.class.test_data)
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

    obj.origroutingmodifier = nil
    refute @obj.any? &obj.candidate_key

    obj.origroutingmodifier = cli_obj.origroutingmodifier
    obj.routeindex = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.origroutingmodifier = cli_obj.origroutingmodifier
    obj.routeindex = cli_obj.routeindex
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

