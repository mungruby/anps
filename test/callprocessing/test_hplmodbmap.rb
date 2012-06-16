
require "minitest/autorun"
require_relative '../../lib/alcatel/callprocessing/resource/hplmodbmap'

class Test_HPLMODBMAP < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_HPLMODBMAP", *fields do
      include Alcatel::CallProcessing::Resource::HPLMODBMAP
    end
  end

  def self.fields
    %w[ PLMNODBID SERVICEKEY
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [0,1]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/ODB-Config/PLMN-ODB-Mapping;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 0-HPLMODBMAP;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 0-HPLMODBMAP;"
    assert_equal expected, @obj.query
  end
   
  def test_add_cli
    expected = "add HPLMODBMAP PLMN_ODB_ID=0, Service_Key=1;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 0-HPLMODBMAP;"
    assert_equal expected, @obj.del
  end
   
  def test_candidate_key
    arr = [@obj]

    obj = @obj.clone
    refute obj.object_id == @obj.object_id
    assert arr.include? obj

    obj = @obj.clone
    obj.plmnodbid = nil
    refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.servicekey = nil
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
   
end

