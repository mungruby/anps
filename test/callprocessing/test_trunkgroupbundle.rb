
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/trunkgroupbundle'

class Test_TRUNKGROUPBUNDLE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_TRUNKGROUPBUNDLE", *fields do
      include Alcatel::CallProcessing::Resource::TRUNKGROUPBUNDLE
    end
  end

  def self.fields
    %w[ BUNDLEINDEX SYSGRPORDER SYSGRPNUM WEIGHT ROUTETOSAMEMSF BUNDLEDESC
        DIGITSOUTPULSEINDEX CLDOUTPULSEINDEX CLIOUTPULSEINDEX
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [ [1,1,86,1,2,"Salt Lake City LD Bundle        ",0,0,0],
      [1,2,88,5,2,"Salt Lake City LD Bundle        ",0,0,0],
      [1,3,106,4,2,"Salt Lake City LD Bundle        ",0,0,0]
    ]           
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data.first
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data.first
    assert_equal obj, obj.convert_fields
    assert_equal 'Salt Lake City LD Bundle', obj.bundledesc
  end

  def test_convert_char_bundledesc
    @obj.bundledesc = "Salt Lake City LD Bundle        "
    assert_equal 'Salt Lake City LD Bundle', @obj.convert_char_bundledesc
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Routing-and-Translation/Trunk-Group-Bundle;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1-TRUNKGROUPBUNDLE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-TRUNKGROUPBUNDLE;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add TRUNKGROUPBUNDLE TRK2Bundle_Number=1, TRK2Name=Salt Lake City LD Bundle;"
    assert_equal expected, @obj.add
  end
   
  def test_add_cli_when_bundledesc_is_empty
    @obj.bundledesc = ""
    expected = "add TRUNKGROUPBUNDLE TRK2Bundle_Number=1;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-TRUNKGROUPBUNDLE;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key 
    arr = [@obj]
    obj = @obj.clone
    obj.bundleindex = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.bundleindex = @obj.bundleindex
    assert arr.any? &obj.candidate_key
  end
   
  def teardown
    @obj = nil
  end
end

