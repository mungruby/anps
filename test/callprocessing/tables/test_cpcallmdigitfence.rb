
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/cpcallmdigitfence'

class Test_CPCALLMDIGITFENCE < MiniTest::Unit::TestCase

  def self.fields
    %w[ DIGITFENCEINDEX TRANSLATIONGROUP ONEPLUSOPTION LEADINGDIGITSCUT LEADINGDIGITSADD EXPECTEDDIGITCOUNT
        TERMINATIONTYPE SERVICEINDEX DIGITTYPE ROUTEACTIONTYPE ROUTEACTION OUTPULSE_01R_IND OUTPULSE_0ZZ_IND
        CARRIERID MAXDIGITCOUNT LEADINGDIGITSADDTYPE ECHOCANCELLATION COUNTRYCODE OUTPUTNOA TARIFFGROUP
        DESTINATIONTYPE CPC INTLPREFIXLEN NATTREESELECTOR STARTPOSITION SOURCENUMBER1 MODIFYDIGITINDEX1
        SOURCENUMBER2 MODIFYDIGITINDEX2 SOURCENUMBER3 MODIFYDIGITINDEX3 SOURCENUMBER4 MODIFYDIGITINDEX4
        SOURCENUMBER5 MODIFYDIGITINDEX5 TONEANNID TONEDURATION CALLGAPPFILTERID NOCHARGE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [86,1,0,0,"                              ",3,1,101,16,2,63,0,0,"0000",3,0,0,"      ",255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
     [225,1,0,0,"                              ",5,1,101,1,0,1,0,0,"0000",17,0,0,"      ",255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CPCALLMDIGITFENCE.new(self.class.test_data)
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
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def test_join_with_emsprefixfence
    test_data = [
      [1,"211                             ",1,3,86,"Community Referral Info Serv    ",0],
      [151,"20810                           ",1,5,225,"SFR France                      ",0]
    ]
    epf = Alcatel::EmsData::EMSPREFIXFENCE.new(test_data)

    assert_same epf, @obj.join( epf )
    assert_equal 86, epf.first.df.digitfenceindex
  end

  def test_raises_join_error_unless_join_for_all_entries
    test_data = [
      [1,"211                             ",1,3,86,"Community Referral Info Serv    ",0]
    ]
    epf = Alcatel::EmsData::EMSPREFIXFENCE.new(test_data)

    assert_raises RuntimeError do
      @obj.join epf
    end
  end

  def test_join_with_same_digitfenceindex
    epf_data = [
      [201,"2                               ",1,1,2319,"2 1D-10D                        ",1],
      [201,"2                               ",1,11,2319,"Restricted Dialing              ",1]
    ]
    df_data = [
      [2319,1,0,0,"                              ",11,1,1,4,2,350,0,0,"    ",32,0,0,"      ",255,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [2319,1,0,0,"                              ",1,1,1,4,10,201,0,0,"    ",10,0,0,"      ",255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    ]

    epf = Alcatel::EmsData::EMSPREFIXFENCE.new(epf_data)
    df = Alcatel::CallProcessing::CPCALLMDIGITFENCE.new(df_data)
    epf = df.join epf

    assert_block do
      result = true
      epf.each { |e| result = false unless e.expecteddigitcount == e.df.expecteddigitcount }
      result
    end
  end

  def teardown
    @obj = nil
  end
end

