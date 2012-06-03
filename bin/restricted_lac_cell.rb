#!/usr/bin/env ruby -w


require_relative '../lib/edw/edwpg'
 
 
module Alcatel 
 
  #
  # SPATIAL.MSC_CFG_RESTRICTED_LAC_CELL, 9 columns, dumped Mon Mar 26 03:46:28 2012
  # columns:
  #      1. MCC_MNC_ID   SMALLINT
  #      2. LAC          INTEGER
  #      3. CELLID_BEGIN INTEGER
  #      4. CELLID_END   INTEGER
  #      5. RESTRICTED_LAC TINYINT
  #      6. RESTRICTION_LIST SMALLINT
  #      7. DESCRIPTION  CHAR(32 BYTE)
  #      8. RESTRICTED_ACCESS_TYPE TINYINT
  #      9. REJECTIONCAUSE TINYINT
  # end
  #
  class RestrictedLacCellQuery
 
    def self.edw_table
      @edw_table = 'dbo.mmappconfigdata_MSC_CFG_RESTRICTED_LAC_CELL'
    end

    @dbbackup_file = 'MMAppConfigData/mmappconfigdata_spatial.MSC_CFG_RESTRICTED_LAC_CELL.bulk'
    @columns = ["MSSID", "MSSName", "LastUpdated",
                "MCC_MNC_ID", "LAC", "CELLID_BEGIN", "CELLID_END",
                "RESTRICTED_LAC", "RESTRICTION_LIST", "DESCRIPTION",
                "RESTRICTED_ACCESS_TYPE", "REJECTIONCAUSE"]
 
 
    def initialize command, parms
      @table = self.class.edw_table
    end

    def run
      rs = query restricted_lac
      puts rs.fields
      puts rs.data.uniq.size
      p rs.data.first
    end

    def query sql
      EDW.query sql
    end

    def sql
      <<-SQL
        SELECT TOP(1) *
        FROM #{@table}
      SQL
    end

    def restricted_lac
      <<-SQL
        SELECT RESTRICTED_LAC
        FROM #{@table}
      SQL
    end

  end
end
 
 
if __FILE__ == $0 
  Alcatel::RestrictedLacCellQuery.new(ARGV.shift, ARGV).run
end
 
 
