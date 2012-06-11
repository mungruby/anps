
require "minitest/autorun"
require_relative '../../lib/cli/EmsData/prefixfence'
require_relative '../../lib/field_converter/EmsData/prefixfence'
require_relative '../../lib/comparators/EmsData/prefixfence'

class Test_PREFIXFENCE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_PREFIXFENCE", *emsprefixfence do
      include ::CLI::EmsData::PREFIXFENCE
      include ::FieldConverter::EmsData::PREFIXFENCE
      include ::Comparators::EmsData::PREFIXFENCE
      attr_accessor :df, :ccd
    end
  end

  def self.df
    @@df ||= Struct.new "Test_DIGITFENCE", *cpcallmdigitfence
  end

  def self.ccd
    @@ccd ||= Struct.new "Test_CAMELCRITERIA", *camel_n_csi_dp_criteria_data
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

  def self.camel_n_csi_dp_criteria_data
    %w[ DIGITFENCEINDEX DEFAULTHANDLING SERVICEKEY PROTOCOLTYPE
        DIGITSTYPE NETWORKLISTSINDEX NODEID SCFBUNDLEID SSN
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
      [1,"144393930                       ",1,11,924,"DCMGW417 MSRNs                  ",0],
      [924,1,0,0,"                              ",11,1,1,4,8,273,0,0,"0000",11,0,0,"      ",
       255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    ]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data[0]
    @obj.df = self.class.df.new *self.class.test_data[1]
    # @obj.ccd = self.class.ccd.new *self.class.test_data[2]
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data[0]
    obj.df = self.class.df.new *self.class.test_data[1]

    assert_equal obj, obj.convert_fields
    assert_equal '144393930', obj.digitpattern
    assert_equal 'DCMGW417 MSRNs', obj.description
    assert_equal "", obj.df.leadingdigitsadd
    assert_equal '0000', obj.df.carrierid
    assert_equal '""', obj.df.countrycode
    assert_equal 'Do Not Overwrite', obj.df.cpc

    assert_nil obj.digitfenceindex
    assert_nil obj.df.digitfenceindex 
  end

  def test_convert_char_digitpattern
    @obj.digitpattern = "144393930                       "
    assert_equal '144393930', @obj.convert_char_digitpattern
  end

  def test_convert_char_description
    @obj.description = "DCMGW417 MSRNs                  "
    assert_equal 'DCMGW417 MSRNs', @obj.convert_char_description
  end

  def test_convert_char_leadingdigitsadd
    @obj.df.leadingdigitsadd = "                              "
    assert_equal "", @obj.convert_char_leadingdigitsadd
  end

  def test_convert_char_carrierid
    @obj.df.carrierid = "0000"
    assert_equal '0000', @obj.convert_char_carrierid
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
    expected << "Prefix-Translation/Digit-Translation/1-PREFIX/Digit-Prefix-Translation;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1-144393930-1-11-PREFIXFENCE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-144393930-1-11-PREFIXFENCE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add PREFIXFENCE Prefix_Tree=1, Digit_String=144393930, Name=DCMGW417 MSRNs, "
    expected << "Translation_Group=1, Min_Digit_Cnt=11, Route_Action=8, Route_Index=273, "
    expected << "Max_Digit_Cnt=11, Remove_Leading_Digits=0, Termination_Type=1, Service_Index=1, "
    expected << "Digit_String_Type=4, Carrier_Id=0000, Add_Leading_Digits_Type=0, "
    expected << "Echo_Cancellation=0, Country_Code=\"\", Output_NOA=255, Tariff_Group=1, "
    expected << "Destination_Type=1, International_prefix_length=0, National_Tree=0, "
    expected << "Start_Position=1, Source_Number_1=0, Modify_Index_1=0, "
    expected << "Source_Number_2=0, Modify_Index_2=0, Source_Number_3=0, Modify_Index_3=0, "
    expected << "Source_Number_4=0, Modify_Index_4=0, Source_Number_5=0, Modify_Index_5=0, "
    expected << "Ann_Or_Tone=0, Call_Gapp_Filter_Id=0, No_Charge=0, "
    expected << "digitFence_CPC=Do Not Overwrite, ScfBundleID=0;"
    assert_equal expected, @obj.add
  end
   
  def test_add_cli_with_camel_data
    test_data = [
      [1,"211                             ",1,3,86,"Community Referral Info Serv    ",0],
      [86,1,0,0,"                              ",3,1,101,16,2,63,0,0,"0000",
       3,0,0,"      ", 255,1,1,255,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [86,1,10,2,1,0,1111,0,12]
    ]
    obj = self.class.dto.new *test_data[0]
    obj.df = self.class.df.new *test_data[1]
    obj.ccd = self.class.ccd.new *test_data[2]
    obj.convert_fields
    assert_nil obj.ccd.digitfenceindex 

    expected =  "add PREFIXFENCE Prefix_Tree=1, Digit_String=211, Name=Community Referral Info Serv, "
    expected << "Translation_Group=1, Min_Digit_Cnt=3, Route_Action=2, Route_Index=63, "
    expected << "Max_Digit_Cnt=3, Remove_Leading_Digits=0, Termination_Type=1, Service_Index=101, "
    expected << "Digit_String_Type=16, Carrier_Id=0000, Add_Leading_Digits_Type=0, "
    expected << "Echo_Cancellation=0, Country_Code=\"\", Output_NOA=255, Tariff_Group=1, "
    expected << "Destination_Type=1, International_prefix_length=0, National_Tree=0, "
    expected << "Start_Position=1, Source_Number_1=0, Modify_Index_1=0, "
    expected << "Source_Number_2=0, Modify_Index_2=0, Source_Number_3=0, Modify_Index_3=0, "
    expected << "Source_Number_4=0, Modify_Index_4=0, Source_Number_5=0, Modify_Index_5=0, "
    expected << "Ann_Or_Tone=0, Call_Gapp_Filter_Id=0, No_Charge=0, digitFence_CPC=Do Not Overwrite, "
    expected << "Default_Handling=1, Service_Key=10, Protocol_Type=2, "
    expected << "NodeID=1111, Scf_BundleID=0, SSN=12;"
    assert_equal expected, obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-144393930-1-11-PREFIXFENCE;"
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

