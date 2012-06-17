
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/systememergencycall'

class Test_SYSTEMEMERGENCYCALL < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_SYSTEMEMERGENCYCALL", *fields do
      include Alcatel::CallProcessing::Resource::SYSTEMEMERGENCYCALL
    end
  end

  def self.fields
    %w[ DUMMY DEFAULT_PSAP_ZONE_DN DEFAULT_ESRD INVALID_ESRK DEFAULT_MPC_DN POS_INFO_TIMER
        GMLC_MPC_QUERY_TIMER PSAP_ROUTING_OPTION NON_DIAL_EMGCY_PREFIX DEFAULT_ESRK
        DEFAULT_SOLUTION_TYPE DEFAULT_LOC_DELIVERY_METHOD GMLC_DN_ESRD DEFAULT_CAMA_INFO_DIGIT
        DEFAULT_SCP_ADDRESS DEFAULT_REMOTE_SSN POS_INFO_TIMER_3G EXTENDED_POS_INFO_TIMER_3G
        TRANSLATION_OPTION CLI_FOR_SIMLESS_CALL
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [0,"2222222222      ","7777777777      ","9999999999      ","911             ",4,7,0,"911       ",
     "                ",0,3,"911             ",0,"{00000000000000000000}",0,4,60,1,0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    assert_equal '2222222222', @obj.default_psap_zone_dn
    assert_equal '7777777777', @obj.default_esrd
    assert_equal '9999999999', @obj.invalid_esrk
    assert_equal '911', @obj.default_mpc_dn
    assert_equal '911', @obj.non_dial_emgcy_prefix
    assert_equal '', @obj.default_esrk
    assert_equal '911', @obj.gmlc_dn_esrd
    assert_equal '0000000000000000', @obj.default_scp_address
  end

  def test_convert_binary_default_scp_address
    @obj.default_scp_address = "{0000000000000000ffff}"
    assert_raises(RuntimeError) { @obj.convert_binary_default_scp_address }
  end

  def test_context_cli
    expected =  "cd; cd Office-Parameters/Mobility-Config-Parameters;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 0-SYSTEMEMERGENCYCALL;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 0-SYSTEMEMERGENCYCALL;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add SYSTEMEMERGENCYCALL Default_E911_Solution=0, Def_SCP_Address=0000000000000000"
    expected << ", Sys_PSAP_Zone_DN=2222222222, System_ESRD=7777777777, Default_ESRK="
    expected << ", PSAP_Call_Routing=0, Def_Loc_Deliv_Method=3"
    expected << ", GMLC_Address=911, Non_Emer_Setup_Trans_Opt=1, Default_Remote_SSN=0, "
    expected << ", Pos_Info_UMTS_Timer=4, Extnd_Pos_Info_UMTS_Timer=60;"
    assert_equal expected, @obj.add
  end
   
  #def test_full_add_cli
  #  expected =  "add SYSTEMEMERGENCYCALL Default_E911_Solution=0, Def_SCP_Address=0000000000000000"
  #  expected << ", Sys_PSAP_Zone_DN=2222222222, System_ESRD=7777777777, Default_ESRK="
  #  expected << ", Invalid_ESRK=9999999999, MPC_DN=911, Post_Info_Timer=4, SCP-GMLC-MPC_Qry_Tmr=7"
  #  expected << ", PSAP_Call_Routing=0, Non_Dial_Emgcy_Prefix=911, Def_Loc_Deliv_Method=3"
  #  expected << ", GMLC_Address=911, Non_Emer_Setup_Trans_Opt=1, Default_Remote_SSN=0, "
  #  expected << ", CLI_for_Simless_Call=0, Pos_Info_UMTS_Timer=4, Extnd_Pos_Info_UMTS_Timer=60;"
  #  assert_equal expected, @obj.full_add
  #end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 0-SYSTEMEMERGENCYCALL;"
    assert_equal expected, @obj.del
  end
   
end

