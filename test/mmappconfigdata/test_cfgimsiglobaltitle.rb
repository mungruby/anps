
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/cfgimsiglobaltitle'
require_relative '../../lib/field_converter/mmappconfigdata/cfgimsiglobaltitle'

class Test_CFGIMSIGLOBALTITLE < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      E212IMSISTR
      E214GTTSTR
      NWKNODEID
      ACTIVEFLAG
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_CFGIMSIGLOBALTITLE", *fields do
      include ::CLI::MMAppConfigData::CFGIMSIGLOBALTITLE
      include ::FieldConverter::MMAppConfigData::CFGIMSIGLOBALTITLE
    end
  end

  def setup
    test_data = ["310170         ","310170         ",0,1]
    @obj = self.class.dto.new *test_data
  end

  def test_convert_fields
    assert_equal @obj, @obj.convert_fields
    assert_equal '310170', @obj.e212imsistr
    assert_equal '310170', @obj.e214gttstr
  end

  def test_convert_char_e212imsistr
    assert_equal '310170', @obj.convert_char_e212imsistr
  end

  def test_convert_char_e214gttstr
    assert_equal '310170', @obj.convert_char_e214gttstr
  end

  def test_cd_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/" +
               "Mobile-Global-Title-or-Allowed-Roaming-Number;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    @obj.convert_fields
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
    expected = "mod CFGIMSIGLOBALTITLE "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    @obj.convert_fields
    expected = "del 310170-310170-0-CFGIMSIGLOBALTITLE;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

