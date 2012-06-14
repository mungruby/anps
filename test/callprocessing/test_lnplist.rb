
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/lnplist'

class Test_LNPLIST < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_LNPLIST", *fields do
      include Alcatel::CallProcessing::Resource::LNPLIST
    end
  end

  def self.fields
    %w[ DIGITPATTERN LNPORDER
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    ["12             ",1]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    assert_equal '12', obj.digitpattern
  end

  def test_convert_char_digitpattern
    @obj.digitpattern = "12             "
    assert_equal '12', @obj.convert_char_digitpattern
  end

  def test_context_cli
    expected =  "cd; cd Office-Parameters/Network-Parameters/1-LNPLISTKEY;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 12-LNPLIST;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 12-LNPLIST;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected =  "add LNPLIST MSISDN_Pattern__with_CC=12, LNP_Order=1;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 12-LNPLIST;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key 
    arr = [@obj]
    obj = @obj.clone
    obj.digitpattern = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.lnporder = nil
    assert arr.any? &obj.candidate_key
  end
   
  def teardown
    @obj = nil
  end
end

