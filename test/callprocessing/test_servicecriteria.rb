
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/servicecriteria'
require_relative '../../lib/field_converter/callprocessing/servicecriteria'
require_relative '../../lib/comparators/callprocessing/servicecriteria'

class Test_SERVICECRITERIA < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_SERVICECRITERIA", *fields do
      include ::CLI::CallProcessing::SERVICECRITERIA
      include ::FieldConverter::CallProcessing::SERVICECRITERIA
      include ::Comparators::CallProcessing::SERVICECRITERIA
    end
  end

  def self.fields
    %w[ SERVICEKEY HANDLINGCRITERIA DESCRIPTION
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,0,"BHPLMN Type 1                   "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.description = "BHPLMN Type 1                   "
    assert_equal @obj, @obj.convert_fields
    assert_equal 'BHPLMN Type 1', @obj.convert_char_description
  end

  def test_convert_char_description
    @obj.description = "BHPLMN Type 1                   "
    assert_equal 'BHPLMN Type 1', @obj.convert_char_description
  end
   
  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/ODB-Config/Service-Criteria;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1-SERVICECRITERIA;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-SERVICECRITERIA;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add SERVICECRITERIA Service_Key=1, Criteria=0, Description=BHPLMN Type 1;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-SERVICECRITERIA;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.servicekey = nil
    refute arr.any? &obj.candidate_key

    obj.servicekey = @obj.servicekey
    obj.handlingcriteria = nil
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

