
require "minitest/autorun"
require_relative '../../../lib/alcatel/EmsData/emsprefixfence'

class Test_EMSPREFIXFENCE < MiniTest::Unit::TestCase

  def self.create_digitfence
    @digitfence ||= df_dto.new *df_data
  end

  def self.df_dto
    @df_dto ||= Struct.new 'TestDigitFence', *cpcallmdigitfence
  end

  def self.cpcallmdigitfence
    %w[ DIGITFENCEINDEX TRANSLATIONGROUP ONEPLUSOPTION LEADINGDIGITSCUT LEADINGDIGITSADD
        EXPECTEDDIGITCOUNT TERMINATIONTYPE SERVICEINDEX DIGITTYPE ROUTEACTIONTYPE ROUTEACTION
        OUTPULSE_01R_IND OUTPULSE_0ZZ_IND CARRIERID MAXDIGITCOUNT LEADINGDIGITSADDTYPE
        ECHOCANCELLATION COUNTRYCODE OUTPUTNOA TARIFFGROUP DESTINATIONTYPE CPC INTLPREFIXLEN
        NATTREESELECTOR STARTPOSITION SOURCENUMBER1 MODIFYDIGITINDEX1
        SOURCENUMBER2 MODIFYDIGITINDEX2 SOURCENUMBER3 MODIFYDIGITINDEX3
        SOURCENUMBER4 MODIFYDIGITINDEX4 SOURCENUMBER5 MODIFYDIGITINDEX5
        TONEANNID TONEDURATION CALLGAPPFILTERID NOCHARGE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.df_data
    [86,1,0,0,"                              ",3,1,101,16,2,63,0,0,"0000",3,0,0,"      ",255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  end

  def self.create_camelcriteriadata
    @ccd ||= ccd_dto.new *@ccd_data
  end

  def self.ccd_dto
    @ccd_dto ||= Struct.new 'TestCamelCriteriaData', *camel_n_csi_dp_criteria_data
  end

  def self.camel_n_csi_dp_criteria_data
    %w[ DIGITFENCEINDEX DEFAULTHANDLING SERVICEKEY PROTOCOLTYPE
        DIGITSTYPE NETWORKLISTSINDEX NODEID SCFBUNDLEID SSN
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.ccd_data
    [86,1,10,2,1,0,1111,0,12]
  end

  def self.fields
    %w[ PREFIXTREESELECTOR DIGITPATTERN TRANSLATIONGROUP EXPECTEDDIGITCOUNT
        DIGITFENCEINDEX DESCRIPTION SELECTOR_TYPE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [1,"211                             ",1,3,86,"Community Referral Info Serv    ",0],
     [1,"144393930                       ",1,11,924,"DCMGW417 MSRNs                  ",0],
     [201,"3                               ",1,1,2325,"3 1D-10D                        ",1]
    ]
  end

  def setup
    @obj = Alcatel::EmsData::EMSPREFIXFENCE.new(self.class.test_data)
    # @obj.first.df = self.class.create_digitfence
    # @obj.first.ccd = self.class.create_camelcriteriadata
    # @obj.first.convert_fields
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

    obj.prefixtreeselector = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.digitpattern = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.translationgroup = nil
    refute @obj.any? &obj.candidate_key

    obj = cli_obj.clone
    obj.expecteddigitcount = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.prefixtreeselector = cli_obj.prefixtreeselector
    obj.digitpattern = cli_obj.digitpattern
    obj.translationgroup = cli_obj.translationgroup
    obj.expecteddigitcount = cli_obj.expecteddigitcount
    assert @obj.any? &obj.candidate_key
  end

  def _test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

