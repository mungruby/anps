
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
     [863,1,0,0,"                              ",11,1,1,4,8,1254,0,0,"0000",11,0,0,"      ",255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
     [978,1,0,11,"5042619024                    ",11,1,1,4,8,238,0,0,"0000",11,0,0,"      ",255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
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

  def teardown
    @obj = nil
  end
end

