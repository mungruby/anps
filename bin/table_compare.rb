#!/usr/bin/env ruby -w

require_relative '../lib/alcatel/callprocessing/cpcallmdigittranslator'
 
class TableComparisonRunner

  def get_vgmss860
    table = [
      [1,"740                             ",1,1,400,"CARROLL OH                      ",1],
      [1,"741                             ",1,1,403,"CAROL OH                        ",1]
    ]
    Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.new('VGMSS860', table)
  end

  # def get_vgmss861
  #   table = []
  #   Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.new('VGMSS861', table)
  # end

  def test_each table
    table.each {|row| puts row}
  end

  def test_include table
    puts "---include---"
    data = [1,"740                             ",1,1,400,"CARROLL OH                      ",1]
    obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    puts table.include? obj        # true

    data = [1,"741                             ",0,1,403,"CAROL OH                        ",1]
    obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    puts table.include? obj        # false
  end

  def test_compare_by_query_string table
    puts "---any---"
    data = [1,"740                             ",1,1,400,"CARROLL OH                      ",1]
    other_obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    comparator = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.compare_by_query_string other_obj
    puts table.any?( &comparator )   # true
    
    data = [1,"741                             ",0,1,403,"CAROL OH                        ",1]
    other_obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    comparator = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.compare_by_query_string other_obj
    puts table.any?( &comparator )   # true
  end

  def test_compare_by_candidate_key table
    puts "---candidate key---"
    data = [1,"740                             ",1,1,400,"CARROLL OH                      ",1]
    other_obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    comparator = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.candidate_key other_obj
    puts table.any?( &comparator )   # true
    
    data = [1,"741                             ",0,1,403,"CAROL OH                        ",1]
    other_obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    comparator = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.candidate_key other_obj
    puts table.any?( &comparator )   # true
  end

  def test_compare_by_candidate_key_using_self table
    puts "--- candidate key using self ---"
    data = [1,"740                             ",1,1,400,"CARROLL OH                      ",1]
    other_obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    puts table.any?( &other_obj.candidate_key )   # true
    
    data = [1,"741                             ",0,1,403,"CAROL OH                        ",1]
    other_obj = Alcatel::CallProcessing::CPCALLMDIGITTRANSLATOR.dto.new(*data).convert_fields
    puts table.any?( &other_obj.candidate_key )   # true
  end




  def run
    vgmss860 = get_vgmss860
    # test_each vgmss860
    test_include vgmss860
    test_compare_by_query_string vgmss860
    test_compare_by_candidate_key vgmss860
    test_compare_by_candidate_key_using_self vgmss860
  end
   
end
 

if __FILE__ == $0 
  TableComparisonRunner.new.run
end
 
 
