
require "minitest/autorun"
require_relative '../../lib/alcatel/mmappconfigdata/resource/msccfgneighbhood'

class Test_MSCCFGNEIGHBHOOD < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_MSCCFGNEIGHBHOOD", *fields do
      include Alcatel::MMAppConfigData::Resource::MSCCFGNEIGHBHOOD
   end
  end

  def self.fields
    %w[ MCC MNC LAC MSCID VLRID DESCRIPTION ADMINSTATE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["{030100}","{020600}",7804,365,366,"CHMSS932                        ",2]
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
    assert_equal 'CHMSS932', obj.description
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

  def test_convert_char_description
    @obj.description = "CHMSS932                        "
    assert_equal 'CHMSS932', @obj.convert_char_description
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Neighborhood-MSC-or-VLR;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 310-260-7804-MSCCFGNEIGHBHOOD;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 310-260-7804-MSCCFGNEIGHBHOOD;"
    assert_equal expected, @obj.query
  end
   
  def _test_add_cli
    expected =  "add MSCCFGNEIGHBHOOD Mobile_Country_Code=310, Mobile_Network_Code=260, "
    expected << "Location_Area_Code=7804, MSC_ID=365, VLR_ID=366, Description=CHMSS932;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 310-260-7804-MSCCFGNEIGHBHOOD;"
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
    obj.lac = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.mcc = @obj.mcc
    obj.mnc = @obj.mnc
    obj.lac = @obj.lac
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

