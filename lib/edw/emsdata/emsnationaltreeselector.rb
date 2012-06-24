#!/usr/bin/env ruby -w

require_relative '../../../lib/edw/edwpg'
 
module EDW
  module Alcatel 
    module EmsData
 
      class EMSNATIONALTREESELECTOR
 
        # @dbbackup_file = 'EmsData/emsdata_spatial.EMSNATIONALTREESELECTOR.bulk'
        # @columns = ["MSSID", "MSSName", "LastUpdated", "NATTREESELECTOR", "DESCRIPTION"]

        attr_accessor :table, :mss_name

        def initialize edw, mss_name
          @table = 'dbo.emsdata_EMSNATIONALTREESELECTOR'
          @edw = edw
          @mss_name = mss_name
        end

        def fields
          db = @edw.query <<-SQL
            SELECT TOP (1) *
            FROM #{table}
          SQL
          db.fields
        end

        def find_all_by_MSSName
          @edw.query sql_find_all_by_MSSName
        end

        def sql_find_all_by_MSSName
          sql = <<-SQL
            SELECT *
            FROM #{table}
            WHERE MSSName = '#{mss_name}'
            ORDER BY NATTREESELECTOR
          SQL
          sql.delete('\n')
        end

      end
    end
  end
end
 
 
