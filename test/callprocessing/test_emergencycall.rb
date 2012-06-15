
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/emergencycall'

class Test_EMERGENCYCALL < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_EMERGENCYCALL", *fields do
      include Alcatel::CallProcessing::Resource::EMERGENCYCALL
      attr_accessor :mcc_mnc, :network_type, :sac_begin, :sac_end
    end
  end

  def self.fields
    %w[ MCC_MNC_ID LAC CELLID_BEGIN CELLID_END ESRD SOLUTION_TYPE ESZ_ID
        CAMA_INFO_DIGITS ESRK_ASSIGNMENT_METHOD LOC_DELIVERY_METHOD ESRK_PREFIX
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [2,11296,117580,117580,"0               ",2,319551,0,3,2,"                "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
    @obj.mcc_mnc = '310260'
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal 52044, @obj.cellid_begin
    assert_equal 52044, @obj.cellid_end
    assert_equal 52044, @obj.sac_begin
    assert_equal 52044, @obj.sac_end
    assert_equal '0', obj.convert_char_esrd
    assert_equal '',  obj.convert_char_esrk_prefix
  end

  def test_set_network_type
    @obj.cellid_begin = 117580
    assert_equal 0, @obj.set_network_type

    @obj.cellid_begin = 1051
    assert_equal 1, @obj.set_network_type
  end

  def test_convert_cellid_begin
    @obj.cellid_begin = 117580
    network_type = 0
    assert_equal 52044, @obj.convert_cellid_begin(network_type)

    @obj.cellid_begin = 1051
    network_type = 1
    assert_equal 1051, @obj.convert_cellid_begin(network_type)
  end

  def test_convert_cellid_end
    @obj.cellid_end = 117580
    network_type = 0
    assert_equal 52044, @obj.convert_cellid_end(network_type)

    @obj.cellid_end = 1051
    network_type = 1
    assert_equal 1051, @obj.convert_cellid_end(network_type)
  end

  def test_set_sac_begin
    assert_equal 52044, @obj.set_sac_begin

    test_data = [1,7809,1051,1051,"0               ",2,6789851,0,3,2,"                "]
    obj = self.class.dto.new *test_data
    obj.network_type = 1
    assert_equal 0, obj.set_sac_begin
  end

  def test_set_sac_end
    assert_equal 52044, @obj.set_sac_end

    test_data = [1,7809,1051,1051,"0               ",2,6789851,0,3,2,"                "]
    obj = self.class.dto.new *test_data
    obj.network_type = 1
    assert_equal 0, obj.set_sac_end
  end

  def test_convert_char_esrd
    @obj.esrd = "0               "
    assert_equal '0', @obj.convert_char_esrd
  end

  def test_convert_char_esrd
    @obj.esrk_prefix = "                "
    assert_equal '', @obj.convert_char_esrk_prefix
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/LAC-or-CELL-Emergency-Call-Provisioning;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 310260-11296-52044-52044-0-EMERGENCYCALL;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 310260-11296-52044-52044-0-EMERGENCYCALL;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add EMERGENCYCALL NetworkType=0, Mcc_Mnc_Id=310260, Location_Area_Code=11296, "
    expected << "Cell_Id_Begin=52044, Cell_Id_End=52044, SAC_Id_Begin=52044, SAC_Id_End=52044, "
    expected << "E911_Solution_Type=2, Emer_Srvc_Zone_ID=319551, "
    expected << "Esrd=0, ESRK_Assn_Method=3, Location_Delivery_Method=2;"
    assert_equal expected, @obj.add
  end
   
  def test_add_cli_when_network_type_1
    test_data = [1,7809,1051,1051,"0               ",2,6789851,0,3,2,"                "]
    obj = self.class.dto.new *test_data
    obj.convert_fields
    obj.mcc_mnc = '31026'
    expected =  "add EMERGENCYCALL NetworkType=1, Mcc_Mnc_Id=31026, Location_Area_Code=7809, "
    expected << "Cell_Id_Begin=1051, Cell_Id_End=1051, "
    expected << "E911_Solution_Type=2, Emer_Srvc_Zone_ID=6789851, "
    expected << "Esrd=0, ESRK_Assn_Method=3, Location_Delivery_Method=2;"
    assert_equal expected, obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 310260-11296-52044-52044-0-EMERGENCYCALL;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.mcc_mnc = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.lac = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.cellid_begin = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.cellid_end = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.mcc_mnc = @obj.mcc_mnc
    obj.lac = @obj.lac
    obj.cellid_begin = @obj.cellid_begin
    obj.cellid_end = @obj.cellid_end
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

