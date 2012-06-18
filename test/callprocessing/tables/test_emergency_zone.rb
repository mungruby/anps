
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/emergency_zone'

class Test_EMERGENCY_ZONE < MiniTest::Unit::TestCase

  def self.fields
    %w[ ESZ_ID ESZ_NAME GMLC_DN PSAP_ZONE_DN BEGIN_ESRK END_ESRK BEGIN_ESRK_POOL2 END_ESRK_POOL2
        BEGIN_ESRK_POOL3 END_ESRK_POOL3 LOC_SERVICE_OPTION EC_ROUTING_OPTION SCP_ADDRESS SCP_INAP_SSN
        INAP_E911_SERVICE_KEY ESZ_QOS_RESP_TIME_CAT
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [[1029199001,"scotland - ph 0 - mo            ","14054721408     ","6604652106      ","0               ","0               ","0               ","0               ","0               ","0               ",4,2,"{0b914150741204f8ffff}",20,0,0] ]
  end

  def setup
    @obj = Alcatel::CallProcessing::EMERGENCY_ZONE.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 1
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def test_resource_has_expected_members
    assert self.class.fields == @obj.first.members
  end

  def test_resource_has_cli_methods
    obj = @obj.first
    assert_block do
      [:context, :cd, :query, :add, :mod, :del].map { |method|
        obj.respond_to? method }.include?(false) ? false : true
    end
  end

  def test_include
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.include? obj

    obj.esz_id = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.esz_id = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.esz_id = cli_obj.esz_id
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

