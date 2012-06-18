
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/system_emergency_call'

class Test_SYSTEM_EMERGENCY_CALL < MiniTest::Unit::TestCase

  def self.fields
    %w[ DUMMY DEFAULT_PSAP_ZONE_DN DEFAULT_ESRD INVALID_ESRK DEFAULT_MPC_DN POS_INFO_TIMER
        GMLC_MPC_QUERY_TIMER PSAP_ROUTING_OPTION NON_DIAL_EMGCY_PREFIX DEFAULT_ESRK
        DEFAULT_SOLUTION_TYPE DEFAULT_LOC_DELIVERY_METHOD GMLC_DN_ESRD DEFAULT_CAMA_INFO_DIGIT
        DEFAULT_SCP_ADDRESS DEFAULT_REMOTE_SSN POS_INFO_TIMER_3G EXTENDED_POS_INFO_TIMER_3G
        TRANSLATION_OPTION CLI_FOR_SIMLESS_CALL
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [0,"911             ","                ","9999999999      ","911             ",4,7,1,"911       ",
      "                ",0,3,"911             ",0,"{00000000000000000000}",0,4,60,1,0]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::SYSTEM_EMERGENCY_CALL.new('test_mss', self.class.test_data)
  end

  def test_mss_name
    assert_equal 'test_mss', @obj.mss_name
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

  def test_first_entry_has_cli_methods
    obj = @obj.first
    assert_block do
      [:context, :cd, :query, :add, :mod, :del].map { |method|
        obj.respond_to? method }.include?(false) ? false : true
    end
  end

  def test_resource_has_expected_members
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def test_include
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.include? obj

    obj.dummy = nil
    refute @obj.include? obj
  end

  def test_any
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.dummy = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.dummy = cli_obj.dummy
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

end

