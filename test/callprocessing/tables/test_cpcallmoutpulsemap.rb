
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmoutpulsemap'

class Test_CPCALLMOUTPULSEMAP < MiniTest::Unit::TestCase

  def self.fields
    %w[ OUTPULSEMAPID DIGITPATTERN INPUTNOA MINDIGITCOUNT MAXDIGITCOUNT
        OUTPULSEMAPINDEX1 CAUSEVALUE1 OUTPULSEMAPINDEX2 CAUSEVALUE2
        OUTPULSEMAPINDEX3 CAUSEVALUE3 OUTPULSEMAPINDEX4 CAUSEVALUE4
        OUTPULSEMAPINDEX5 CAUSEVALUE5 OUTPULSEMAPINDEX6 CAUSEVALUE6
        OUTPULSEMAPINDEX7 CAUSEVALUE7 OUTPULSEMAPINDEX8 CAUSEVALUE8
        OUTPULSEMAPINDEX9 CAUSEVALUE9 OUTPULSEMAPINDEX10 CAUSEVALUE10
        OUTPULSEMAPINDEX11 CAUSEVALUE11 OUTPULSEMAPINDEX12 CAUSEVALUE12
        OUTPULSEMAPINDEX13 CAUSEVALUE13 OUTPULSEMAPINDEX14 CAUSEVALUE14
        OUTPULSEMAPINDEX15 CAUSEVALUE15 OUTPULSEMAPINDEX16 CAUSEVALUE16
        OUTPULSEMAPINDEX17 CAUSEVALUE17 OUTPULSEMAPINDEX18 CAUSEVALUE18
        OUTPULSEMAPINDEX19 CAUSEVALUE19 OUTPULSEMAPINDEX20 CAUSEVALUE20
        OUTPULSEMAPINDEX21 CAUSEVALUE21 OUTPULSEMAPINDEX22 CAUSEVALUE22
        OUTPULSEMAPINDEX23 CAUSEVALUE23 OUTPULSEMAPINDEX24 CAUSEVALUE24
        OUTPULSEMAPINDEX25 CAUSEVALUE25 OUTPULSEMAPINDEX26 CAUSEVALUE26
        OUTPULSEMAPINDEX27 CAUSEVALUE27 OUTPULSEMAPINDEX28 CAUSEVALUE28
        OUTPULSEMAPINDEX29 CAUSEVALUE29 OUTPULSEMAPINDEX30 CAUSEVALUE30
        OUTPULSEMAPINDEX31 CAUSEVALUE31 OUTPULSEMAPINDEX32 CAUSEVALUE32
        LEADINGDIGITSCUT LEADINGDIGITSADD DESCRIPTION CPC NATUREOFADDRESS OLI CPC_PRIORITY
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [878,"?                               ",1,1,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      10,"2197553333                    ","E911 GARY PD LB-LCS             ",0,255,255,255],

     [879,"?                               ",1,1,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      10,"8478359224                    ","E911 Glencoe PD LB-LCS          ",0,255,255,255]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMOUTPULSEMAP.new(self.class.test_data)
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

    obj.outpulsemapid = nil
    refute @obj.any? &obj.candidate_key

    obj.outpulsemapid = cli_obj.outpulsemapid
    obj.digitpattern = nil
    refute @obj.any? &obj.candidate_key

    obj.digitpattern = cli_obj.digitpattern
    obj.inputnoa = nil
    refute @obj.any? &obj.candidate_key

    obj.inputnoa = cli_obj.inputnoa
    obj.mindigitcount = nil
    refute @obj.any? &obj.candidate_key

    obj.inputnoa = cli_obj.inputnoa
    obj.mindigitcount = cli_obj.mindigitcount
    obj.maxdigitcount = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.outpulsemapid = cli_obj.outpulsemapid
    obj.digitpattern = cli_obj.digitpattern
    obj.inputnoa = cli_obj.inputnoa
    obj.mindigitcount = cli_obj.mindigitcount
    obj.maxdigitcount = cli_obj.maxdigitcount
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

