
require "minitest/autorun"
require_relative '../../lib/cli/EmsData/digitdescriptor'
require_relative '../../lib/field_converter/EmsData/digitdescriptor'
require_relative '../../lib/comparators/EmsData/digitdescriptor'

class Test_DIGITDESCRIPTOR < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_DIGITDESCRIPTOR", *fields do
      include ::CLI::EmsData::DIGITDESCRIPTOR
      include ::FieldConverter::EmsData::DIGITDESCRIPTOR
      include ::Comparators::EmsData::DIGITDESCRIPTOR
    end
  end

  def self.fields
    @@fields = %w[
      DESCRIPTOR
      DESCRIPTORINDEX
      DESCRIPTORTYPE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    @@test_data ||= ["REMOTE POOLING RC               ",7665,0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    @obj.descriptor = "REMOTE POOLING RC               "
    assert_equal 'REMOTE POOLING RC               ', @obj.descriptor
    assert_equal @obj, @obj.convert_fields
    assert_equal 'REMOTE POOLING RC', @obj.descriptor
  end

  def test_convert_char_descriptor
    @obj.descriptor = "REMOTE POOLING RC               "
    assert_equal 'REMOTE POOLING RC', @obj.convert_char_descriptor
  end

  def test_cd_cli
    expected =  "cd; cd Office-Parameters/Routing-and-Translation"
    expected << "/Routing/Orig-Routing/Orig-Route-Descriptor;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 7665-DIGITDESCRIPTOR;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add DIGITDESCRIPTOR Index=7665, Name=REMOTE POOLING RC;" 
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected =  "cd 7665-DIGITDESCRIPTOR;\nmod DIGITDESCRIPTOR "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 7665-DIGITDESCRIPTOR;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
end

