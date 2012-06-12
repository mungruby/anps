
require "minitest/autorun"
require_relative '../../lib/cli/mmappconfigdata/mccmnc'
require_relative '../../lib/field_converter/mmappconfigdata/mccmnc'
require_relative '../../lib/comparators/mmappconfigdata/mccmnc'

class Test_MCCMNC < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_MCCMNC", *fields do
      include ::CLI::MMAppConfigData::MCCMNC
      include ::FieldConverter::MMAppConfigData::MCCMNC
      include ::Comparators::MMAppConfigData::MCCMNC
    end
  end

  def self.fields
    %w[ MCC MNC MCC_MNC_ID PLMNID DESCRIPTION ACCESSTYPE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["{030100}","{020600}",2,1,"UCHMSS950                       ",0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '310', obj.mcc
    assert_equal '260', obj.mnc
    assert_equal 'UCHMSS950', obj.description
  end

  def test_convert_binary_mcc
    @obj.mcc = "{030100}"
    assert_equal '310', @obj.convert_binary_mcc
  end

  def test_convert_binary_mnc
    @obj.mnc = "{020600}"
    assert_equal '260', @obj.convert_binary_mnc
    @obj.mnc = "{02060f}"
    assert_equal '26', @obj.convert_binary_mnc
  end

  def test_convert_char_country_name
    @obj.description = "UCHMSS950                       "
    assert_equal 'UCHMSS950', @obj.convert_char_description
  end

  def _test_convert_tinyint_accesstype
    skip("Convert 0 to GSM?")
    assert_equal 'GSM', @obj.convert_tinyint_accesstype
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/MSC-MCC-and-MNC;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 310-260-MCCMNC;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 310-260-MCCMNC;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add MCCMNC Mobile_Country_Code=310, Mobile_Network_Code=260, "
    expected << "PLMN_Id=1, Access_Type=0, Description=UCHMSS950;"
    assert_equal expected, @obj.add
  end
   
  def _test_add_cli_gsm
    skip("Use GSM in the CLI?")
    expected =  "add MCCMNC Mobile_Country_Code=310, Mobile_Network_Code=260, "
    expected << "PLMN_Id=1, Access_Type=GSM, Description=UCHMSS950;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 310-260-MCCMNC;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.mcc = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.mnc = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.mcc = @obj.mcc
    obj.mnc = @obj.mnc
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

