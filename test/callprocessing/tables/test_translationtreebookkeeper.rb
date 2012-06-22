
require "minitest/autorun"
require_relative '../../../lib/alcatel/callprocessing/translationtreebookkeeper'

class Test_TRANSLATIONTREEBOOKKEEPER < MiniTest::Unit::TestCase

  def self.fields
    %w[ TRANSTREESELECTOR TREETYPE M1TYPE M2TYPE M3TYPE M4TYPE M5TYPE DESCRIPTION
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [1,3,0,0,0,0,0,"Standard Prefix Trans           "],
     [201,1,0,0,0,0,0,"Standard Normalization          "],
     [203,4,0,0,0,0,0,"HLR Tree                        "],
     [202,5,0,0,0,0,0,"International Prefix            "],
     [205,6,0,0,0,0,0,"CF Prefix Tree                  "]
    ]
  end

  def setup
    @obj = Alcatel::CallProcessing::TRANSLATIONTREEBOOKKEEPER.new(self.class.test_data)
  end

  def test_fields
    assert self.class.fields == @obj.class.fields
  end

  def test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 5
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

  def test_candidate_key
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.transtreeselector = nil
    refute @obj.any? &obj.candidate_key

    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.transtreeselector = cli_obj.transtreeselector
    assert @obj.any? &obj.candidate_key
  end

  def test_compare
    assert @obj.respond_to? :compare
  end

  def test_treetype_1
    # [201,1,0,0,0,0,0,"Standard Normalization          "]
    obj = @obj.find {|cli_obj| cli_obj.treetype == 1}
    assert_kind_of Struct::EMSWIRELESSNORMAL, obj
    assert 201, obj.transtreeselector
    assert 'Standard Normalization', obj.description
  end

  def _test_treetype_2
  end
   
  def test_treetype_3
    # [230,3,0,0,0,0,0,"Emergency Tree                  "]
    obj = @obj.find {|cli_obj| cli_obj.treetype == 3}
    assert_kind_of Struct::PREFIX, obj
  end
   
  def test_treetype_4
    # [203,4,0,0,0,0,0,"HLR Tree                        "]
    # [204,4,0,0,0,0,0,"SCP Prefix Tree                 "]
    obj = @obj.find {|cli_obj| cli_obj.treetype == 4}
    assert_kind_of Struct::PREFIX, obj
  end
   
  def test_treetype_5
    # [202,5,0,0,0,0,0,"International Prefix            "]
    obj = @obj.find {|cli_obj| cli_obj.treetype == 5}
    assert_kind_of Struct::PREFIX, obj
  end
   
  def test_treetype_6
    # [205,6,0,0,0,0,0,"CF Prefix Tree                  "]
    obj = @obj.find {|cli_obj| cli_obj.treetype == 6}
    assert_kind_of Struct::PREFIX, obj
  end
end

