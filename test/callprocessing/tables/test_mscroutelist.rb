
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/mscroutelist'

class Test_MSCROUTELISTS < MiniTest::Unit::TestCase

  def self.fields
    %w[ ROUTEINDEX TYPE1 PARAMETER1 OUTPULSEINDEX1 TYPE2 PARAMETER2 OUTPULSEINDEX2
        TYPE3 PARAMETER3 OUTPULSEINDEX3 TYPE4 PARAMETER4 OUTPULSEINDEX4
        TYPE5 PARAMETER5 OUTPULSEINDEX5 TYPE6 PARAMETER6 OUTPULSEINDEX6
        TYPE7 PARAMETER7 OUTPULSEINDEX7 TYPE8 PARAMETER8 OUTPULSEINDEX8
        DESCRIPTION LOOKAHEAD CLIOUTPULSEINDEX1 RNOUTPULSEINDEX1 OCNOUTPULSEINDEX1
        DIGITSOUTPULSEINDEX1 DIGITSOUTPULSEINDEX2 DIGITSOUTPULSEINDEX3 DIGITSOUTPULSEINDEX4
        DIGITSOUTPULSEINDEX5 DIGITSOUTPULSEINDEX6 DIGITSOUTPULSEINDEX7 DIGITSOUTPULSEINDEX8
        PREDEFINEDCLIACTIVE1 PREDEFINEDCLIACTIVE2 PREDEFINEDCLIACTIVE3 PREDEFINEDCLIACTIVE4
        PREDEFINEDCLIACTIVE5 PREDEFINEDCLIACTIVE6 PREDEFINEDCLIACTIVE7 PREDEFINEDCLIACTIVE8
        CLIOUTPULSEINDEX2 RNOUTPULSEINDEX2 OCNOUTPULSEINDEX2 CLIOUTPULSEINDEX3 RNOUTPULSEINDEX3 OCNOUTPULSEINDEX3
        CLIOUTPULSEINDEX4 RNOUTPULSEINDEX4 OCNOUTPULSEINDEX4 CLIOUTPULSEINDEX5 RNOUTPULSEINDEX5 OCNOUTPULSEINDEX5
        CLIOUTPULSEINDEX6 RNOUTPULSEINDEX6 OCNOUTPULSEINDEX6 CLIOUTPULSEINDEX7 RNOUTPULSEINDEX7 OCNOUTPULSEINDEX7
        CLIOUTPULSEINDEX8 RNOUTPULSEINDEX8 OCNOUTPULSEINDEX8
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [29,1,55,0,1,14,400,1,16,0,4,1,0,0,1,0,0,1,0,0,1,0,0,1,0,"500plus                         ",2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
     [678000,1,14,400,4,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,"PSTN Default Route List         ",2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::MSCROUTELISTS.new(self.class.test_data)
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

    obj.routeindex = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.routeindex = cli_obj.routeindex
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
    # assert @obj.respond_to? :merge
    # assert @obj.respond_to? :+
    # assert @obj.respond_to? :and
    # assert @obj.respond_to? :or
  end

end

