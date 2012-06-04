
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/emergencyzone'
require_relative '../../lib/field_converter/callprocessing/emergencyzone'

class Test_EMERGENCYZONE < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      ESZ_ID
      ESZ_NAME
      GMLC_DN
      PSAP_ZONE_DN
      BEGIN_ESRK
      END_ESRK
      BEGIN_ESRK_POOL2
      END_ESRK_POOL2
      BEGIN_ESRK_POOL3
      END_ESRK_POOL3
      LOC_SERVICE_OPTION
      EC_ROUTING_OPTION
      SCP_ADDRESS
      SCP_INAP_SSN
      INAP_E911_SERVICE_KEY
      ESZ_QOS_RESP_TIME_CAT
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_EMERGENCYZONE", *fields do
      include ::CLI::CallProcessing::EMERGENCYZONE
      include ::FieldConverter::CallProcessing::EMERGENCYZONE
    end
  end

  def setup
    test_data = [1029199001,"scotland - ph 0 - mo            ","14054721408     ",
                 "6604652106      ", "0               ","0               ",
                 "0               ", "0               ", "0               ","0               ",
                 4,2,"{0b914150741204f8ffff}",20,0,0]
    @obj = self.class.dto.new *test_data
    @obj.convert_fields
  end

  def test_cd
    cd = "cd; cd Office-Parameters/Mobility-Config-Parameters/Emergency-Service-Zone-Provisioning;"
    assert_equal cd, ::CLI::CallProcessing::EMERGENCYZONE.cd
  end
   
  def test_cd_cli
    expected = "cd 1029199001-EMERGENCYZONE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1029199001-EMERGENCYZONE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add EMERGENCYZONE Emer_Srvc_Zone_ID=1029199001, "
    expected << "Emer_Srvc_Zone_Name=scotland - ph 0 - mo, "
    expected << "PSAP_Zone_DN=6604652106, PSAP_Zone_DN_Type=2, "
    expected << "GMLC_Address=14054721408, "
    expected << "Loc_Service_Option=4, Routing_Option=2, "
    expected << "Begin_ESRK_Pool_1=0, End_ESRK_Pool_1=0, "
    expected << "Begin_ESRK_Pool_2=0, End_ESRK_Pool_2=0, "
    expected << "Begin_ESRK_Pool_3=0, End_ESRK_Pool_3=0, "
    expected << "SCP_Address=14054721408, SCP_INAP_SSN=20;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod EMERGENCYZONE"
    skip
  end
   
  def test_del_cli
    expected = "del 1029199001-EMERGENCYZONE;"
    assert_equal expected, @obj.del
  end
   
  def test_add_cli_when_empty_fields
    test_data = [1029199001,"scotland - ph 0 - mo            ",
                 "                ","6604652106      ",
                 "                ","                ",
                 "                ","                ",
                 "                ","                ",
                 4,2,"{0091ffffffffffffffff}",0,0,0]
    obj = self.class.dto.new *test_data
    obj.convert_fields

    expected = "add EMERGENCYZONE Emer_Srvc_Zone_ID=1029199001, "
    expected << "Emer_Srvc_Zone_Name=scotland - ph 0 - mo, "
    expected << "PSAP_Zone_DN=6604652106, PSAP_Zone_DN_Type=2, "
    expected << "Loc_Service_Option=4, Routing_Option=2, "
    expected << "SCP_INAP_SSN=0;"
    assert_equal expected, obj.add
  end

  def test_char_fields_when_empty
    @obj.gmlc_dn = "                "
    assert_equal "", @obj.convert_char_gmlc_dn

    @obj.psap_zone_dn = "                "
    assert_equal "", @obj.convert_char_psap_zone_dn
     
    @obj.begin_esrk = "                "
    assert_equal "", @obj.convert_char_begin_esrk
     
    @obj.end_esrk = "                "
    assert_equal "", @obj.convert_char_end_esrk
     
    @obj.begin_esrk_pool2 = "                "
    assert_equal "", @obj.convert_char_begin_esrk_pool2
     
    @obj.end_esrk_pool2 = "                "
    assert_equal "", @obj.convert_char_end_esrk_pool2
     
    @obj.begin_esrk_pool3 = "                "
    assert_equal "", @obj.convert_char_begin_esrk_pool3
     
    @obj.end_esrk_pool3 = "                "
    assert_equal "", @obj.convert_char_end_esrk_pool3
  end

  def test_convert_binary_scp_address
    @obj.scp_address = "{0091ffffffffffffffff}"
    assert_equal "", @obj.convert_binary_scp_address

    @obj.scp_address = "{0191f0ffffffffffffff}"
    assert_equal '0', @obj.convert_binary_scp_address
     
    @obj.scp_address = "{0b914150741204f8ffff}"
    assert_equal '14054721408', @obj.convert_binary_scp_address
     
    @obj.scp_address = "{0b914150741204f0ffff}"
    assert_equal '14054721400', @obj.convert_binary_scp_address
  end

  def teardown
    @obj = nil
  end
end

