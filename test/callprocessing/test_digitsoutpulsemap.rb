
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/digitsoutpulsemap'

class Test_DIGITSOUTPULSEMAP < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_DIGITSOUTPULSEMAP", *fields do
      include Alcatel::CallProcessing::Resource::DIGITSOUTPULSEMAP
    end
  end

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
    [ 9,0,0,0,118,"?                               ",1,32,1,1,0,
      "118                           ", 1,0,0,0,0,0,0,0,0,0,0,1,
      "E911 SIP-IMT +118               ",255,255,255,1,
      "                                " ]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '?', obj.digitpattern
    assert_equal '118', obj.insertdigits
    assert_equal 'E911 SIP-IMT +118', obj.description
    assert_equal "", obj.phonecontext
  end

  def test_convert_char_digitpattern
    @obj.digitpattern = "?                               "
    assert_equal '?', @obj.convert_char_digitpattern
  end

  def test_convert_char_insertdigits
    @obj.insertdigits = "118                           "
    assert_equal '118', @obj.convert_char_insertdigits
  end

  def test_convert_char_description
    @obj.description ="E911 SIP-IMT +118               "
    assert_equal 'E911 SIP-IMT +118', @obj.convert_char_description
  end

  def test_convert_char_phonecontext
    @obj.phonecontext = "                                "
    assert_equal "", @obj.convert_char_phonecontext
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Outpulse-Maps/Digits-Manipulations/Digits-Outpulse-Map;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 9-0-0-0-118-?-1-32-DIGITSOUTPULSEMAP;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 9-0-0-0-118-?-1-32-DIGITSOUTPULSEMAP;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add DIGITSOUTPULSEMAP Outpulse_Map=118, Digit_Type=9, Digit_String=?, Input_NOA=0, "
    expected << "Name=E911 SIP-IMT +118, Min_Digit_Cnt=1, Max_Digit_Cnt=32, SCP_NodeID=0, Service_Key=0, "
    expected << "Sent=1, Start_Position=1, Digits_To_Delete=0, Insert_Digits=118, Output_NOA=1, "
    # expected << "Not_Sent=1, "
    # expected << "Presentation_Ind=255, Num_Incomplete_Ind=255, Screening_Ind=255, "
    # expected << "Capture_In_CDR=1, Phone_RN_Context="", "
    expected << "Source_Number_1=0, Modify_Index_1=0, "
    expected << "Source_Number_2=0, Modify_Index_2=0, "
    expected << "Source_Number_3=0, Modify_Index_3=0, "
    expected << "Source_Number_4=0, Modify_Index_4=0, "
    expected << "Source_Number_5=0, Modify_Index_5=0;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 9-0-0-0-118-?-1-32-DIGITSOUTPULSEMAP;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.outpulsemapindex = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digittype = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.inputnoa = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.nodeid = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.servicekey = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digitpattern = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.mindigitcount = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.maxdigitcount = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.outpulsemapindex = @obj.outpulsemapindex
    obj.digittype = @obj.digittype
    obj.inputnoa = @obj.inputnoa
    obj.nodeid = @obj.nodeid
    obj.servicekey = @obj.servicekey
    obj.digitpattern = @obj.digitpattern 
    obj.mindigitcount = @obj.mindigitcount
    obj.maxdigitcount = @obj.maxdigitcount
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

