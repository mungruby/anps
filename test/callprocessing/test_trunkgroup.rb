
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/trunkgroup'

class Test_TRUNKGROUP < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_TRUNKGROUP", *fields do
      include Alcatel::CallProcessing::Resource::TRUNKGROUP
      attr_accessor :usergrpnum
    end
  end

  def self.fields
    %w[ BUNDLEINDEX SYSGRPORDER SYSGRPNUM WEIGHT ROUTETOSAMEMSF BUNDLEDESC
      DIGITSOUTPULSEINDEX CLDOUTPULSEINDEX CLIOUTPULSEINDEX
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,3,106,4,2,"Salt Lake City LD Bundle        ",0,0,0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.usergrpnum = 5620400
  end

  def test_context
    expected = "cd; cd Office-Parameters/Routing-and-Translation/Trunk-Group-Bundle/1-TRUNKGROUPBUNDLE;"
    assert_equal expected, @obj.context 
  end
   
  def test_cd_cli
    expected = "cd 3-TRUNKGROUP;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 3-TRUNKGROUP;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add TRUNKGROUP TRK1Order=3, TRK1Group_Number=5620400, TRK1Weight=4, "
    expected << "TRK1DIGITS_OUTPULSE_INDEX=0, TRK1CldOutpulse=0, TRK1CliOutpulse=0;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected  = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 3-TRUNKGROUP;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key 
    arr = [@obj]
    obj = @obj.clone
    obj.bundleindex = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.sysgrporder = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.bundleindex = @obj.bundleindex
    obj.sysgrporder = @obj.sysgrporder
    assert arr.any? &obj.candidate_key
  end
   
  def teardown
    @obj = nil
  end
end

