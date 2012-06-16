
require "minitest/autorun"
require_relative '../../lib/alcatel/emsdata/resource/emswirelessfence'

class Test_EMSWIRELESSFENCE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_EMSWIRELESSFENCE", *emsprefixfence do
      include Alcatel::EmsData::Resource::EMSWIRELESSFENCE
      attr_accessor :df
    end
  end

  def self.df
    @@df ||= Struct.new "Test__DIGITFENCE", *cpcallmdigitfence
  end

  def self.emsprefixfence
    %w[ PREFIXTREESELECTOR DIGITPATTERN TRANSLATIONGROUP EXPECTEDDIGITCOUNT
        DIGITFENCEINDEX DESCRIPTION SELECTOR_TYPE
      ].map { |field_name| field_name.downcase.to_sym }
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

  def self.test_data
    [ [201,"242                             ",1,10,2068,"Bahamas Class INTL              ",1],
      [2068,1,0,0,"1                             ",10,1,1,4,10,1,0,0,"    ",
       10,0,0,"      ", 255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0] ]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data[0]
    @obj.df = self.class.df.new *self.class.test_data[1]
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data[0]
    obj.df = self.class.df.new *self.class.test_data[1]

    assert_equal obj, obj.convert_fields
    assert_equal '242', obj.digitpattern
    assert_equal 'Bahamas Class INTL', obj.description
    assert_equal '1', obj.df.leadingdigitsadd
    assert_equal '""', obj.df.carrierid
    assert_equal '""', obj.df.countrycode
    assert_equal 'Do Not Overwrite', obj.df.cpc

    assert_nil obj.digitfenceindex
    assert_nil obj.df.digitfenceindex 
  end

  def test_convert_char_digitpattern
    @obj.digitpattern = "242                             "
    assert_equal '242', @obj.convert_char_digitpattern
  end

  def test_convert_char_description
    @obj.description = "Bahamas Class INTL              "
    assert_equal 'Bahamas Class INTL', @obj.convert_char_description
  end

  def test_convert_char_leadingdigitsadd
    @obj.df.leadingdigitsadd = "1                             "
    assert_equal '1', @obj.convert_char_leadingdigitsadd
  end

  def test_convert_char_carrierid
    @obj.df.carrierid = "    "
    assert_equal '""', @obj.convert_char_carrierid
  end

  def test_convert_char_countrycode
    @obj.df.countrycode = "      "
    assert_equal '""', @obj.convert_char_countrycode
  end

  def test_convert_tinyint_cpc
    @obj.df.cpc = 255
    assert_equal 'Do Not Overwrite', @obj.convert_tinyint_cpc
  end

  def test_context_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/"
    expected << "Wireless-Normalization/Digit-Translation/201-EMSWIRELESSNORMAL/Digit-Normalization;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 201-242-1-10-EMSWIRELESSFENCE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 201-242-1-10-EMSWIRELESSFENCE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add EMSWIRELESSFENCE Prefix_Tree=201, Digit_String=242, Name=Bahamas Class INTL, "
    expected << "Translation_Group=1, Min_Digit_Cnt=10, Route_Action=10, Route_Index=1, "
    expected << "Max_Digit_Cnt=10, Remove_Leading_Digits=0, Add_Leading_Digits=1, "
    expected << "Termination_Type=1, Service_Index=1, "
    expected << "Digit_String_Type=4, Carrier_Id=\"\", Add_Leading_Digits_Type=0, "
    expected << "Echo_Cancellation=0, Country_Code=\"\", Output_NOA=255, Tariff_Group=1, "
    expected << "Destination_Type=1, International_prefix_length=0, National_Tree=0, "
    expected << "Start_Position=1, Source_Number_1=0, Modify_Index_1=0, "
    expected << "Source_Number_2=0, Modify_Index_2=0, Source_Number_3=0, Modify_Index_3=0, "
    expected << "Source_Number_4=0, Modify_Index_4=0, Source_Number_5=0, Modify_Index_5=0, "
    expected << "Ann_Or_Tone=0, Call_Gapp_Filter_Id=0, No_Charge=0, "
    expected << "digitFence_CPC=Do Not Overwrite;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 201-242-1-10-EMSWIRELESSFENCE;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.prefixtreeselector = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digitpattern = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.translationgroup = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.expecteddigitcount = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.df.members.each { |attribute| obj.df.public_send "#{attribute}=", nil }
    obj.prefixtreeselector = @obj.prefixtreeselector
    obj.digitpattern = @obj.digitpattern
    obj.translationgroup = @obj.translationgroup
    obj.expecteddigitcount = @obj.expecteddigitcount
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

