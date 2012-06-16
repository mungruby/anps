
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/digittranslation'

class Test_DIGITTRANSLATION < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_DIGITTRANSLATION", *fields do
      include Alcatel::CallProcessing::Resource::DIGITTRANSLATION
    end
  end

  def self.fields
    %w[ TRANSLATIONGROUP DIGITPATTERN PORTEDENABLEOFFICE ROUTEACTIONTYPE ROUTEACTION
        DESCRIPTION NATTREESELECTOR
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,"740                             ",1,1,400,"CARROLL OH                      ",1]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '740', obj.digitpattern
    assert_equal 'CARROLL OH', obj.description
  end

  def test_convert_char_digitpattern
    @obj.digitpattern = "740                             "
    assert_equal '740', @obj.convert_char_digitpattern
  end

  def test_convert_char_description
    @obj.description = "CARROLL OH                      "
    assert_equal 'CARROLL OH', @obj.convert_char_description
  end

  def test_context_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/"
    expected << "National-Tree-Selector/1-NATTREESELECTOR/National-Translation;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1-1-740-DIGITTRANSLATION;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-1-740-DIGITTRANSLATION;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add DIGITTRANSLATION Digit_String=740, Route_Action=1, Route_Index=400, "
    expected << "National_Tree=1, Translation_Group=1, Ported_Office=1, Description=CARROLL OH;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-1-740-DIGITTRANSLATION;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key 
    arr = [@obj]

    obj = @obj.clone
    refute obj.object_id == @obj.object_id
    assert arr.include? obj

    obj = @obj.clone
    obj.translationgroup = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.nattreeselector = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.digitpattern = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.portedenableoffice = nil
    obj.routeactiontype = nil
    obj.routeaction = nil
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end
   
  def teardown
    @obj = nil
  end
end

