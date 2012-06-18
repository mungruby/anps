
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmdigitsoutpulsemap'

class Test_CPCALLMDIGITSOUTPULSEMAP < MiniTest::Unit::TestCase

  def self.fields
    %w[ DIGITTYPE INPUTNOA NODEID SERVICEKEY OUTPULSEMAPINDEX DIGITPATTERN MINDIGITCOUNT
        MAXDIGITCOUNT SEND STARTPOSITION DIGITSTODELETE INSERTDIGITS NORMALIZELOC
        SOURCENUMBER1 MODIFYDIGITINDEX1 SOURCENUMBER2 MODIFYDIGITINDEX2
        SOURCENUMBER3 MODIFYDIGITINDEX3 SOURCENUMBER4 MODIFYDIGITINDEX4
        SOURCENUMBER5 MODIFYDIGITINDEX5 OUTPUTNOA DESCRIPTION PRESENTATIONIND
        NUMBERINCOMPLETEIND SCREENINGIND CAPTUREINCDR PHONECONTEXT
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [9,0,0,0,118,"?                               ",1,32,1,1,0,"118                           ",1,0,0,0,0,0,0,0,0,0,0,1,"E911 SIP-IMT +118               ",255,255,255,1,"                                "],
     [9,1,0,0,118,"?                               ",1,32,1,1,0,"118                           ",1,0,0,0,0,0,0,0,0,0,0,1,"E911 SIP-IMT +118               ",255,255,255,1,"                                "],
     [9,2,0,0,118,"?                               ",1,32,1,1,0,"118                           ",1,0,0,0,0,0,0,0,0,0,0,1,"E911 SIP-IMT +118               ",255,255,255,1,"                                "],
     [9,4,0,0,118,"?                               ",1,32,1,1,0,"118                           ",1,0,0,0,0,0,0,0,0,0,0,1,"E911 SIP-IMT +118               ",255,255,255,1,"                                "]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMDIGITSOUTPULSEMAP.new('test_mss', self.class.test_data)
  end

  def test_mss_name
    assert_equal 'test_mss', @obj.mss_name
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

  def test_first_entry_cli_methods
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
    cli_obj = @obj.first

    obj = cli_obj.clone
    assert @obj.include? obj

    obj = cli_obj.clone
    obj.outpulsemapindex = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.outpulsemapindex = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.digittype = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.inputnoa = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.nodeid = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.servicekey = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.digitpattern = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.mindigitcount = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.maxdigitcount = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.outpulsemapindex = cli_obj.outpulsemapindex
    obj.digittype = cli_obj.digittype
    obj.inputnoa = cli_obj.inputnoa
    obj.nodeid = cli_obj.nodeid
    obj.servicekey = cli_obj.servicekey
    obj.digitpattern = cli_obj.digitpattern 
    obj.mindigitcount = cli_obj.mindigitcount
    obj.maxdigitcount = cli_obj.maxdigitcount
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

