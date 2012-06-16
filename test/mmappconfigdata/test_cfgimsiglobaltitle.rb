
require "minitest/autorun"
require_relative '../../lib/alcatel/mmappconfigdata/resource/cfgimsiglobaltitle'

class Test_CFGIMSIGLOBALTITLE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_CFGIMSIGLOBALTITLE", *fields do
      include Alcatel::MMAppConfigData::Resource::CFGIMSIGLOBALTITLE
    end
  end

  def self.fields
    %w[ E212IMSISTR E214GTTSTR NWKNODEID ACTIVEFLAG
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["310170         ","310170         ",0,1]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '310170', obj.e212imsistr
    assert_equal '310170', obj.e214gttstr
  end

  def test_convert_char_e212imsistr
    assert_equal '310170', @obj.convert_char_e212imsistr
  end

  def test_convert_char_e214gttstr
    assert_equal '310170', @obj.convert_char_e214gttstr
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/" +
               "Mobile-Global-Title-or-Allowed-Roaming-Number;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 310170-310170-0-CFGIMSIGLOBALTITLE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 310170-310170-0-CFGIMSIGLOBALTITLE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    @obj.convert_fields
    expected =  "add CFGIMSIGLOBALTITLE E212_IMSI_Prefix=310170, E214_GTT_Prefix=310170, "
    expected << "Network_Node=0, Active=1;"
    assert_equal expected, @obj.add
  end
   
  def _test_add_cli_allow
    skip
    @obj.convert_fields
    expected =  "add CFGIMSIGLOBALTITLE E212_IMSI_Prefix=310170, E214_GTT_Prefix=310170, "
    expected << "Network_Node=0, Active=ALLOW;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 310170-310170-0-CFGIMSIGLOBALTITLE;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.e212imsistr = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.e214gttstr = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.nwknodeid = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.activeflag = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

