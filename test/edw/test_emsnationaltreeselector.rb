
require "minitest/autorun"
require_relative '../../lib/edw/emsdata/emsnationaltreeselector'

class Test_EMSNATIONALTREESELECTOR < MiniTest::Unit::TestCase

  def self.fields
    %w[MSSID MSSName LastUpdated NATTREESELECTOR DESCRIPTION]
  end

  def setup
    @edw = EDW::EDWPG.new
    @obj = EDW::Alcatel::EmsData::EMSNATIONALTREESELECTOR.new(@edw, 'sfmss840')
  end

  def test_fields
    assert self.class.fields == @obj.fields
  end

  def test_sql_find_all_by_mssname
    expected  = "            SELECT *\n"
    expected << "            FROM dbo.emsdata_EMSNATIONALTREESELECTOR\n"
    expected << "            WHERE MSSName = 'sfmss840'\n"
    expected << "            ORDER BY NATTREESELECTOR\n"
    assert_equal expected, @obj.sql_find_all_by_MSSName
  end

  def test_find_all_by_mssname
    expected = self.class.fields
    assert_equal expected, @obj.find_all_by_MSSName.fields
  end

  def test_load_table
    # expected = self.class.fields
    # actual = @edw.load_table('EMSNATIONALTREESELECTOR', 'sfmss840').fields
    # assert_equal expected, actual
    expected = [1, "Santa Clara National Tree       "]
    actual = @edw.load_table('EMSNATIONALTREESELECTOR', 'sfmss840').first
    p actual
    assert_equal expected, actual
  end

  def teardown
    @obj = nil
    @edw = nil
  end
end

