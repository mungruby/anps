
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/trunkgroup'

class Test_TRUNKGROUP < MiniTest::Unit::TestCase

  def self.fields
    @@fields = %w[
      BUNDLEINDEX
      SYSGRPORDER
      SYSGRPNUM
      WEIGHT
      ROUTETOSAMEMSF
      BUNDLEDESC
      DIGITSOUTPULSEINDEX
      CLDOUTPULSEINDEX
      CLIOUTPULSEINDEX
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.dto
    @@dto ||= Struct.new "Test_TRUNKGROUP", *fields do
      include ::CLI::CallProcessing::TRUNKGROUP
      attr_accessor :usergrpnum
    end
  end

  def setup
    test_data = [1,3,106,4,2,"Salt Lake City LD Bundle        ",0,0,0]
    @obj = self.class.dto.new *test_data
    @obj.usergrpnum = 5620400
  end

  def test_cd
    cd = "cd; cd Office-Parameters/Routing-and-Translation/Trunk-Group-Bundle;"
    assert_equal cd, ::CLI::CallProcessing::TRUNKGROUP.cd
  end
   
  def test_cd_cli
    expected = "cd 1-TRUNKGROUPBUNDLE;"
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
    expected =  "cd 3-TRUNKGROUP;\n"
    expected << "mod TRUNKGROUPBUNDLE"
  end
   
  def test_del_cli
    expected = "del 3-TRUNKGROUP;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

