
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/npanxx'
require_relative '../../lib/field_converter/callprocessing/npanxx'
require_relative '../../lib/comparators/callprocessing/npanxx'

class Test_NPANXX < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_NPANXX", *fields do
      include ::CLI::CallProcessing::NPANXX
      include ::FieldConverter::CallProcessing::NPANXX
      include ::Comparators::CallProcessing::NPANXX
    end
  end

  def self.fields
    %w[ LATANUMBER NPA_NXX DESCRIPTION
      ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,"425    ","permitted                       "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.npa_nxx = '425    '
    @obj.description = 'permitted                       '
    assert_equal @obj, @obj.convert_fields
    assert_equal '425', @obj.convert_char_npa_nxx
    assert_equal 'permitted', @obj.convert_char_description
  end

  def test_convert_char_npa_nxx
    @obj.npa_nxx = '425    '
    assert_equal '425', @obj.convert_char_npa_nxx
  end

  def test_convert_char_description
    @obj.description = 'permitted                       '
    assert_equal 'permitted', @obj.convert_char_description
  end
   
  def test_context_cli
    expected = "cd; cd Office-Parameters/Network-Parameters/LATAs/1-LATA;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 425-NPANXX;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 425-NPANXX;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add NPANXX NPA_NXX_X=425, Description=permitted;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 425-NPANXX;"
    assert_equal expected, @obj.del
  end
   
  # %w[ LATANUMBER NPA_NXX DESCRIPTION
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.latanumber = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.npa_nxx = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

