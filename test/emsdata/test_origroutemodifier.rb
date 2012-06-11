
require "minitest/autorun"
require_relative '../../lib/cli/EmsData/origroutemodifier'
require_relative '../../lib/field_converter/EmsData/origroutemodifier'
require_relative '../../lib/comparators/EmsData/origroutemodifier'

class Test_ORIGROUTEMODIFIER < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_ORIGROUTEMODIFIER", *fields do
      include ::CLI::EmsData::ORIGROUTEMODIFIER
      include ::FieldConverter::EmsData::ORIGROUTEMODIFIER
      include ::Comparators::EmsData::ORIGROUTEMODIFIER
    end
  end

  def self.fields
    %w[ ORIGROUTINGMODIFIER DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,"CHMGW678                        "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal 'CHMGW678', obj.description
  end

  def test_convert_char_description
    @obj.description = 'CHMGW678                        '
    assert_equal 'CHMGW678', @obj.convert_char_description
  end

  def test_context_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation"
    expected << "/Routing/Orig-Routing/Orig-Route-Modifier;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1-ORIGROUTEMODIFIER;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-ORIGROUTEMODIFIER;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add ORIGROUTEMODIFIER Profile_Identifier=1, Name=CHMGW678;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-ORIGROUTEMODIFIER;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.origroutingmodifier = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.description = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

