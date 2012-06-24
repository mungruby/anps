
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/camel_n_csi_dp_criteria_data'

class Test_CAMEL_N_CSI_DP_CRITERIA_DATA < MiniTest::Unit::TestCase

  def self.fields
    %w[ DIGITFENCEINDEX DEFAULTHANDLING SERVICEKEY PROTOCOLTYPE DIGITSTYPE
        NETWORKLISTSINDEX NODEID SCFBUNDLEID SSN
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [ [86,1,10,2,1,0,1111,0,12], [225,1,89,1,1,0,1005,0,12] ]
  end

  def setup
    @obj = Alcatel::CallProcessing::CAMEL_N_CSI_DP_CRITERIA_DATA.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 2
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def test_resource_has_expected_members
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def test_join_with_emsprefixfence
    test_data = [
      [1,"211                             ",1,3,86,"Community Referral Info Serv    ",0],
      [151,"20810                           ",1,5,225,"SFR France                      ",0]
    ]
    epf = Alcatel::EmsData::EMSPREFIXFENCE.new(test_data)

    assert_same epf, @obj.join(epf)
    assert_equal 86, epf.first.digitfenceindex
  end

  def test_raises_join_error_unless_join_for_all_entries
    test_data = [
      [1,"211                             ",1,3,86,"Community Referral Info Serv    ",0]
    ]
    epf = Alcatel::EmsData::EMSPREFIXFENCE.new(test_data)

    assert_raises RuntimeError do
      @obj.join epf
    end
  end

  def teardown
    @obj = nil
  end
end

