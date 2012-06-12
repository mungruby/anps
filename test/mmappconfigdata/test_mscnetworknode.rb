
require "minitest/autorun"
require_relative '../../lib/alcatel/mmappconfigdata/resource/mscnetworknode'

class Test_MSCNETWORKNODE < MiniTest::Unit::TestCase

  def self.dto
    @@dto ||= Struct.new "Test_MSCNETWORKNODE", *fields do
      include Alcatel::MMAppConfigData::Resource::MSCNETWORKNODE
   end
  end

  def self.fields
    %w[ NODEID NODETYPE POINTCODE ADDRESS VERSION DESCRIPTION
        ROUTINGCHOICE FORMAT NOA XLATIONTYPE CAMELPHASES NETWORKID
    ].map { |field_name| field_name.downcase.to_sym }
  end

  def self.test_data
    [1,0,13876724,"{0b4150748260f3ffff}",3,"Own Node MSC                    ",2,0,0,0,"{0000}",6]
  end

  def setup
    @obj = self.class.dto.new *self.class.test_data
    @obj.convert_fields
  end

  def test_convert_fields
    obj = self.class.dto.new *self.class.test_data
    assert_equal obj, obj.convert_fields
    # assert_equal '310', obj.mcc
    assert_equal 'Own Node MSC', obj.description
  end

  def _test_convert_integer_pointcode
    @obj.pointcode = 13876724
    assert_equal '', @obj.convert_integer_pointcode
  end

  def test_convert_binary_address
    @obj.address = "{0b4150748260f3ffff}"
    assert_equal '14054728063', @obj.convert_binary_address
  end

  def _test_convert_binary_camelphases
    @obj.camelphases = ""
    assert_equal '', @obj.convert_binary_camelphases
  end

  def test_convert_char_description
    @obj.description = "Own Node MSC                    "
    assert_equal 'Own Node MSC', @obj.convert_char_description
  end

  def test_context_cli
    expected = "cd; cd Office-Parameters/Mobility-Config-Parameters/Network-Nodes;"
    assert_equal expected, @obj.context
  end
   
  def test_cd_cli
    expected = "cd 1-MSCNETWORKNODE;"
    assert_equal expected, @obj.cd
  end
   
  def test_query_cli
    expected = "query 1-MSCNETWORKNODE;"
    assert_equal expected, @obj.query
  end
   
  #
  #  Add MSCNETWORKNODE Node_ID=<value>,
  #  Node_Type_1=<value>,
  #  Local=<value>,
  #  Standard=<value>,
  #  Routing_Choice=<value>,
  #  Network_ID=<value>,
  #  CAMEL_Ph1=<value>,
  #  CAMEL_Ph2=<value>,
  #  CAMEL_Ph3=<value>,
  #  Point_Code=<value>,
  #  Intl_Fmt_Addr__E_164=<value>,
  #  Description=<value>
  #  [,MAP_Version=<value>]
  #  [, GTT_Coding_Format=<value>]
  #  [, Nature_of_Address=<value>]
  #  [, Digit_Translation_Type=<value>]
  #
  def test_add_cli
    expected =  "add MSCNETWORKNODE Node_ID=1, Node_Type_1=0, Local=, Standard=, Routing_Choice=2, "
    expected << "Network_ID=6, CAMEL_Ph1={0000}, CAMEL_Ph2={0000}, CAMEL_Ph3={0000}, "
    expected << "Point_Code=13876724, Intl_Fmt_Addr__E_164=14054728063, MAP_Version=3, "
    expected << "GTT_Coding_Format=0, Nature_of_Address=0, Digit_Translation_Type=0, "
    expected << "Description=Own Node MSC;"
    assert_equal expected, @obj.add
  end
   
  def test_mod_cli
    expected = "mod "
    assert_equal expected, @obj.mod
  end
   
  def test_del_cli
    expected = "del 1-MSCNETWORKNODE;"
    assert_equal expected, @obj.del
  end
   
  #  %w[ NODEID NODETYPE POINTCODE ADDRESS VERSION DESCRIPTION
  #      ROUTINGCHOICE FORMAT NOA XLATIONTYPE CAMELPHASES NETWORKID
  def test_candidate_key
    arr = [@obj]
    obj = @obj.clone
    obj.nodeid = nil
    refute arr.any? &obj.candidate_key

    # obj = @obj.clone
    # obj.mnc = nil
    # refute arr.any? &obj.candidate_key

    obj = @obj.clone
    obj.members.each { |attribute| obj.public_send "#{attribute}=", nil }
    obj.nodeid = @obj.nodeid
    assert arr.any? &obj.candidate_key
  end 
   
  def teardown
    @obj = nil
  end
end

