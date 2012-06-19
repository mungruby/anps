
require "minitest/autorun"
require_relative '../../../lib/alcatel/mmappconfigdata/msc_cfg_networknodes'

class Test_MSC_CFG_NETWORKNODES < MiniTest::Unit::TestCase

  def self.fields
    %w[ NODEID NODETYPE POINTCODE ADDRESS VERSION DESCRIPTION
        ROUTINGCHOICE FORMAT NOA XLATIONTYPE CAMELPHASES NETWORKID
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [1,0,13876724,"{0b4150748260f3ffff}",3,"Own Node MSC                    ",2,0,0,0,"{0000}",6],
     [2,1,13876724,"{0b4150747260f3ffff}",3,"Own Node VLR                    ",2,0,0,0,"{0000}",6],
     [3,70,0,"{00ffffffffffffffff}",0,"NPDB                            ",4,2,0,242,"{8000}",6],
     [4,3,0,"{0b4140541504f4ffff}",3,"SCP                             ",0,0,0,0,"{0000}",6],
     [23,7,0,"{0b4150741204f8ffff}",0,"GMLC LCS                        ",0,0,0,0,"{8000}",6],
     [136,0,0,"{0b5126721520f3ffff}",0,"SFMSS840_MSC                    ",0,0,0,0,"{e000}",6],
     [1003,3,0,"{0b4150741264f5ffff}",3,"ZOOVE SCP                       ",0,0,0,0,"{2000}",6] 
    ]
  end

  def setup
    @obj = Alcatel::MMAppConfigData::MSC_CFG_NETWORKNODES.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 7
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def test_resource_has_expected_members
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def test_resource_has_cli_methods
    obj = @obj.first
    assert_block do
      [:context, :cd, :query, :add, :mod, :del].map { |method|
        obj.respond_to? method }.include?(false) ? false : true
    end
  end

  def test_candidate_key
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.nodeid = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.nodeid = cli_obj.nodeid
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

