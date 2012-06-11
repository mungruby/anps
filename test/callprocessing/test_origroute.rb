
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/origroute'
require_relative '../../lib/comparators/callprocessing/origroute'

class Test_ORIGROUTE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_ORIGROUTE", *fields do
      include ::CLI::CallProcessing::ORIGROUTE
      include ::Comparators::CallProcessing::ORIGROUTE
    end
  end

  def self.fields
    %w[ ROUTEINDEX ORIGROUTINGMODIFIER DIGITTYPE ROUTEACTIONTYPE ROUTEACTION
        AMATRANSLATIONINDEX DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [7665,442,26,7,421252,1,"REMOTE POOLING RC               "]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Routing-and-Translation/Routing/Orig-Routing/Orig-Route;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 442-7665-ORIGROUTE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 442-7665-ORIGROUTE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add ORIGROUTE OrigRoute_Descriptor=7665, Orig_Route_Modifier=442, "
    expected << "Route_Action=7, Route_Index=421252, Ama_Index=1;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod Route_Action=7, Route_Index=421252;"
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 442-7665-ORIGROUTE;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.routeindex = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.origroutingmodifier = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.routeactiontype = nil
    obj.routeaction = nil
    obj.amatranslationindex = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

