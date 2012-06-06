
require "minitest/autorun"
require_relative '../../lib/cli/callprocessing/hplmodbmap'
# require_relative '../../lib/field_converter/callprocessing/hplmodbmap'

class Test_HPLMODBMAP < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_HPLMODBMAP", *fields do
      include ::CLI::CallProcessing::HPLMODBMAP
      # include ::FieldConverter::CallProcessing::HPLMODBMAP
    end
  end

  def self.fields
    @@fields = %w[
      PLMNODBID
      SERVICEKEY
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    @@test_data = [0,1]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
  end

  def test_cd_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/ODB-Config/PLMN-ODB-Mapping;"
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
    expected = "mod HPLMODBMAP "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 0-HPLMODBMAP;"
    assert_equal expected, @obj.del
  end
   
  def teardown
    @obj = nil
  end
   
end

