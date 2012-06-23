
require "minitest/autorun"
require_relative '../../../lib/alcatel/EmsData/emsprefixfence'

class Test_EMSPREFIXFENCE < MiniTest::Unit::TestCase

  def self.fields
    %w[ PREFIXTREESELECTOR DIGITPATTERN TRANSLATIONGROUP EXPECTEDDIGITCOUNT
        DIGITFENCEINDEX DESCRIPTION SELECTOR_TYPE
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [
     [1,"144393930                       ",1,11,924,"DCMGW417 MSRNs                  ",0],
     [201,"3                               ",1,1,2325,"3 1D-10D                        ",1]
    ]
  end

  def setup
    @obj = Alcatel::EmsData::EMSPREFIXFENCE.new(self.class.test_data)
  end

  def _test_fields
    assert self.class.fields == @obj.class.fields
  end

  def _test_enumerable
    assert_kind_of Enumerable, @obj
    assert @obj.entries.size == 2
    assert @obj.first
    assert @obj.respond_to? :each
  end

  def _test_resource_has_expected_members
    obj = @obj.first
    assert self.class.fields == obj.members
  end

  def _test_resource_has_cli_methods
    obj = @obj.first
    assert_block do
      [:context, :cd, :query, :add, :mod, :del].map { |method|
        obj.respond_to? method }.include?(false) ? false : true
    end
  end

  def _test_candidate_key
    cli_obj = @obj.first
    obj = cli_obj.clone
    assert @obj.any? &obj.candidate_key

    obj.origroutingmodifier = nil
    refute @obj.any? &obj.candidate_key

    obj = @obj.first.clone
    obj.description = nil
    assert @obj.any? &obj.candidate_key
  end

  def _test_compare
    assert @obj.respond_to? :compare
  end

  def teardown
    @obj = nil
  end
end

