
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/lrnlist'
require_relative '../../lib/field_converter/callprocessing/lrnlist'
require_relative '../../lib/comparators/callprocessing/lrnlist'

class Test_LRNLIST < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_LRNLIST", *fields do
      include ::CLI::CallProcessing::LRNLIST
      include ::FieldConverter::CallProcessing::LRNLIST
      include ::Comparators::CallProcessing::LRNLIST
    end
  end

  def self.fields
    %w[ LRN HLR_NUM
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["6032059981     ",0]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '6032059981', obj.lrn
  end

  def test_convert_char_lrn
    @obj.lrn = "6032059981     "
    assert_equal '6032059981', @obj.convert_char_lrn
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Network-Parameters/1-LRNLISTKEY;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 6032059981-LRNLIST;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 6032059981-LRNLIST;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add LRNLIST LRN=6032059981, HLR_Number=0;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 6032059981-LRNLIST;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]

    obj = @obj.clone
    refute obj.object_id == @obj.object_id
    assert arr.include? obj

    obj = @obj.clone
    obj.lrn = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.hlr_num = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
   
end

