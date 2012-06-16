
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/outpulsemap'

class Test_OUTPULSEMAP < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_OUTPULSEMAP", *fields do
      include Alcatel::CallProcessing::Resource::OUTPULSEMAP
    end
  end

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
    [ 878,"?                               ",0,1,32,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
      10,"2197553333                    ","E911 GARY PD LB-LCS             ",0,255,255,255 ]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.cpc = 0
    @obj.cpc_priority = 255
    assert_equal @obj, @obj.convert_fields
  end

  def test_context_cli
    cd = "cd; cd Office-Parameters/Outpulse-Maps/ISUP-or-BICC-or-SIP-Outpulse-Map;"
    assert_equal cd, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 878-?-0-1-32-OUTPULSEMAP;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 878-?-0-1-32-OUTPULSEMAP;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add OUTPULSEMAP Outpulse_Map=878, Digit_String=?, Input_NOA=0, "
    expected << "Min_Digit_Cnt=1, Max_Digit_Cnt=32, Name=E911 GARY PD LB-LCS, "
    expected << "Rm_Leading_Digits_Cnt=10, Add_Leading_Digits=2197553333, "
    expected << "Operation__1=0, Operation__2=0, Operation__3=0, Operation__4=0, "
    expected << "Operation__5=0, Operation__6=0, Operation__7=0, Operation__8=0, "
    expected << "Operation__9=0, Operation_10=0, Operation_11=0, Operation_12=0, "
    expected << "Operation_13=0, Operation_14=0, Operation_15=0, Operation_16=0, "
    expected << "Operation_17=0, Operation_18=0, Operation_19=0, Operation_20=0, "
    expected << "Operation_21=0, Operation_22=0, Operation_23=0, Operation_24=0, "
    expected << "Operation_25=0, Operation_26=0, Operation_27=0, Operation_28=0, "
    expected << "Operation_29=0, Operation_30=0, Operation_31=0, Operation_32=0, "
    expected << "Nature_Of_Address=255, Oli=255, "
    expected << "CPC_Override=Unknown, CPC_Priority=Do Not Overwrite;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 878-?-0-1-32-OUTPULSEMAP;"
    assert_equal expected, @obj.del
  end
   
  def test_convert_tinyint_when_cpc_0
    @obj.cpc = 0
    assert_equal 'Unknown', @obj.convert_tinyint_cpc
  end

  def test_convert_tinyint_when_cpc_priority_0
    @obj.cpc_priority = 0
    assert_equal 'Unknown', @obj.convert_tinyint_cpc_priority
  end

  def test_convert_tinyint_when_cpc_255
    @obj.cpc = 255
    assert_equal 'Do Not Overwrite', @obj.convert_tinyint_cpc
  end
   
  def test_convert_tinyint_when_cpc_priority_255
    @obj.cpc_priority = 255
    assert_equal 'Do Not Overwrite', @obj.convert_tinyint_cpc_priority
  end
   
  def test_convert_tinyint_cpc_raises_exception
    @obj.cpc = 1
    assert_raises(RuntimeError) do
      @obj.convert_tinyint_cpc
    end
  end
   
  def test_convert_tinyint_cpc_priority_raises_exception
    @obj.cpc_priority = 1
    assert_raises(RuntimeError) do
      @obj.convert_tinyint_cpc_priority
    end
  end
   
  # %w[ OUTPULSEMAPID DIGITPATTERN INPUTNOA MINDIGITCOUNT MAXDIGITCOUNT
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.outpulsemapid = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digitpattern = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.inputnoa = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.mindigitcount = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.maxdigitcount = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.outpulsemapid = @obj.outpulsemapid
    obj.digitpattern = @obj.digitpattern 
    obj.inputnoa = @obj.inputnoa
    obj.mindigitcount = @obj.mindigitcount
    obj.maxdigitcount = @obj.maxdigitcount
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

