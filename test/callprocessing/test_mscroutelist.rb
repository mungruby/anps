
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/mscroutelist'
require_relative '../../lib/field_converter/callprocessing/mscroutelist'
require_relative '../../lib/comparators/callprocessing/mscroutelist'

class Test_MSCROUTELIST < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_MSCROUTELIST", *fields do
      include ::CLI::CallProcessing::MSCROUTELIST
      include ::FieldConverter::CallProcessing::MSCROUTELIST
      include ::Comparators::CallProcessing::MSCROUTELIST
    end
  end

  def self.fields
    %w[ ROUTEINDEX
        TYPE1 PARAMETER1 OUTPULSEINDEX1
        TYPE2 PARAMETER2 OUTPULSEINDEX2
        TYPE3 PARAMETER3 OUTPULSEINDEX3
        TYPE4 PARAMETER4 OUTPULSEINDEX4
        TYPE5 PARAMETER5 OUTPULSEINDEX5
        TYPE6 PARAMETER6 OUTPULSEINDEX6
        TYPE7 PARAMETER7 OUTPULSEINDEX7
        TYPE8 PARAMETER8 OUTPULSEINDEX8
        DESCRIPTION LOOKAHEAD CLIOUTPULSEINDEX1 RNOUTPULSEINDEX1 OCNOUTPULSEINDEX1
        DIGITSOUTPULSEINDEX1 DIGITSOUTPULSEINDEX2 DIGITSOUTPULSEINDEX3 DIGITSOUTPULSEINDEX4
        DIGITSOUTPULSEINDEX5 DIGITSOUTPULSEINDEX6 DIGITSOUTPULSEINDEX7 DIGITSOUTPULSEINDEX8
        PREDEFINEDCLIACTIVE1 PREDEFINEDCLIACTIVE2 PREDEFINEDCLIACTIVE3 PREDEFINEDCLIACTIVE4
        PREDEFINEDCLIACTIVE5 PREDEFINEDCLIACTIVE6 PREDEFINEDCLIACTIVE7 PREDEFINEDCLIACTIVE8
        CLIOUTPULSEINDEX2 RNOUTPULSEINDEX2 OCNOUTPULSEINDEX2
        CLIOUTPULSEINDEX3 RNOUTPULSEINDEX3 OCNOUTPULSEINDEX3
        CLIOUTPULSEINDEX4 RNOUTPULSEINDEX4 OCNOUTPULSEINDEX4
        CLIOUTPULSEINDEX5 RNOUTPULSEINDEX5 OCNOUTPULSEINDEX5
        CLIOUTPULSEINDEX6 RNOUTPULSEINDEX6 OCNOUTPULSEINDEX6
        CLIOUTPULSEINDEX7 RNOUTPULSEINDEX7 OCNOUTPULSEINDEX7
        CLIOUTPULSEINDEX8 RNOUTPULSEINDEX8 OCNOUTPULSEINDEX8
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [746021,1,170,400,2,1,0,4,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,"Detroit Toll Free               ",
     2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
    @obj.parameter1 = 4009
  end

  def test_convert_fields
    @obj.description = "Detroit Toll Free               "
    assert_equal @obj, @obj.convert_fields
    assert_equal 'Detroit Toll Free', @obj.description
  end

  def test_convert_char_description
    @obj.description = "Detroit Toll Free               "
    assert_equal 'Detroit Toll Free', @obj.convert_char_description
  end
   
  def test_context_cli
    expected = "cd; cd Office-Parameters/Routing-and-Translation/Route-List;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 746021-MSCROUTELIST;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 746021-MSCROUTELIST;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add MSCROUTELIST Route_List_Id=746021, Name=Detroit Toll Free, "
    expected << "Type_1=1, Value_1=4009, Outpulse_1=400, "
    expected << "Type_2=2, Value_2=1, Outpulse_2=0, "
    expected << "Type_3=4, Value_3=1, Outpulse_3=0, "
    expected << "Type_4=0, Value_4=1, Outpulse_4=0, "
    expected << "Type_5=0, Value_5=1, Outpulse_5=0, "
    expected << "Type_6=0, Value_6=1, Outpulse_6=0, "
    expected << "Type_7=0, Value_7=1, Outpulse_7=0, "
    expected << "Type_8=0, Value_8=1, Outpulse_8=0, "
    expected << "Look_Ahead=0, "
    expected << "CliOutpulse_1=0, RNOutpulse_1=0, OCNOutpulse_1=0, PredefCLI_1=0, "
    expected << "DIGITS_OUTPULSE_MAP_INDEX_1=0, DIGITS_OUTPULSE_MAP_INDEX_2=0, "
    expected << "DIGITS_OUTPULSE_MAP_INDEX_3=0, DIGITS_OUTPULSE_MAP_INDEX_4=0, "
    expected << "DIGITS_OUTPULSE_MAP_INDEX_5=0, DIGITS_OUTPULSE_MAP_INDEX_6=0, "
    expected << "DIGITS_OUTPULSE_MAP_INDEX_7=0, DIGITS_OUTPULSE_MAP_INDEX_8=0, "
    expected << "CliOutpulse_2=0, RNOutpulse_2=0, OCNOutpulse_2=0, PredefCLI_2=0, "
    expected << "CliOutpulse_3=0, RNOutpulse_3=0, OCNOutpulse_3=0, PredefCLI_3=0, "
    expected << "CliOutpulse_4=0, RNOutpulse_4=0, OCNOutpulse_4=0, PredefCLI_4=0, "
    expected << "CliOutpulse_5=0, RNOutpulse_5=0, OCNOutpulse_5=0, PredefCLI_5=0, "
    expected << "CliOutpulse_6=0, RNOutpulse_6=0, OCNOutpulse_6=0, PredefCLI_6=0, "
    expected << "CliOutpulse_7=0, RNOutpulse_7=0, OCNOutpulse_7=0, PredefCLI_7=0, "
    expected << "CliOutpulse_8=0, RNOutpulse_8=0, OCNOutpulse_8=0, PredefCLI_8=0;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 746021-MSCROUTELIST;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.routeindex = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.routeindex = @obj.routeindex
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

