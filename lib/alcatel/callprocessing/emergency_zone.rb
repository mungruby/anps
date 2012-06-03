#!/usr/bin/env ruby -w


require_relative '../lib/alcatel_auditing_tool'
 
#
# DESIGN DECISIONS
#
# If BEGIN_ESRK is nil leave the parameter out of the CLI command
# If END_ESRK is nil leave the parameter out of the CLI command
#
#
 
 
module Alcatel 
 
  #
  # SPATIAL.EMERGENCY_ZONE, 16 columns, dumped Mon Mar 26 03:45:50 2012
  # columns:
  #      1. ESZ_ID       INTEGER
  #      2. ESZ_NAME     CHAR(32 BYTE)
  #      3. GMLC_DN      CHAR(16 BYTE)
  #      4. PSAP_ZONE_DN CHAR(16 BYTE)
  #      5. BEGIN_ESRK   CHAR(16 BYTE)
  #      6. END_ESRK     CHAR(16 BYTE)
  #      7. BEGIN_ESRK_POOL2 CHAR(16 BYTE)
  #      8. END_ESRK_POOL2 CHAR(16 BYTE)
  #      9. BEGIN_ESRK_POOL3 CHAR(16 BYTE)
  #     10. END_ESRK_POOL3 CHAR(16 BYTE)
  #     11. LOC_SERVICE_OPTION TINYINT
  #     12. EC_ROUTING_OPTION TINYINT
  #     13. SCP_ADDRESS  BINARY(10)
  #     14. SCP_INAP_SSN TINYINT
  #     15. INAP_E911_SERVICE_KEY INTEGER
  #     16. ESZ_QOS_RESP_TIME_CAT TINYINT
  # end
  #
  class EmergencyZoneAuditTool < AlcatelAuditingTool
 
    # @dbbackup_file = 'CallProcessing/callprocessing_spatial.EMERGENCY_ZONE.bulk'
    # @edw_table = 'dbo.callprocessing_EMERGENCY_ZONE'
    @columns = ["MSSID", "MSSName", "LastUpdated",
                "ESZ_ID", "ESZ_NAME", "GMLC_DN", "PSAP_ZONE_DN",
                "BEGIN_ESRK", "END_ESRK", "BEGIN_ESRK_POOL2", "END_ESRK_POOL2",
                "BEGIN_ESRK_POOL3", "END_ESRK_POOL3", "LOC_SERVICE_OPTION",
                "EC_ROUTING_OPTION", "SCP_ADDRESS", "SCP_INAP_SSN",
                "INAP_E911_SERVICE_KEY", "ESZ_QOS_RESP_TIME_CAT"]
 
    def initialize command, parms
      @table = EDW::DM_ALCATEL::EMERGENCY_ZONE
      super
    end


    #
    # Instance methods for database queries
    #

    def find_all_by_MSSName db, mss
      db.query <<-SQL
        SELECT *, LastUpdated
        FROM #{@table}
        WHERE MSSName = '#{mss}'
        ORDER BY ESZ_ID
      SQL
      format_results(db.data) {|row| row.slice!(0, 3)}
    end

    def find_all_by_digits db, digits
      db.query <<-SQL
        SELECT *
        FROM #{@table}
        WHERE ESZ_ID = '#{digits}'
        ORDER BY MSSName
      SQL
      format_results(db.data)
    end

    def format_results rows
      rows.each do |row|
        row[4]  = row[4].rstrip                        # ESZ_NAME
        row[5]  = row[5].rstrip unless row[5].nil?     # GMLC_DN
        row[6]  = row[6].rstrip unless row[6].nil?     # PSAP_ZONE_DN
        row[15] = self.class.from_binary(row[15])      # SCP_ADDRESS
        row[7]  = row[7].rstrip  unless row[12].nil?   # BEGIN_ESRK
        row[8]  = row[8].rstrip  unless row[12].nil?   # END_ESRK
        row[9]  = row[9].rstrip  unless row[12].nil?   # BEGIN_ESRK_POOL2
        row[10] = row[10].rstrip unless row[12].nil?   # END_ESRK_POOL2
        row[11] = row[11].rstrip unless row[12].nil?   # BEGIN_ESRK_POOL3
        row[12] = row[12].rstrip unless row[12].nil?   # END_ESRK_POOL3
        yield(row) if block_given?
      end
    end


    #
    # Instance methods for generating CLI commands
    #

    # cd; cd Office-Parameters; cd Mobility-Config-Parameters; cd Emergency-Service-Zone-Provisioning;
    def cd
      puts "cd;"
      puts "cd Office-Parameters;"
      puts "cd Mobility-Config-Parameters;"
      puts "cd Emergency-Service-Zone-Provisioning;"
      puts
    end
     
    def add_cli values
      parms = Array.new(16)
      parms[0] = @digits          # ESZ_ID
      parms[2] = "14054721408"    # GMLC_DN
      parms[10] = 4               # LOC_SERVICE_OPTION
      parms[11] = 2               # EC_ROUTING_OPTION
      parms[13] = 0               # SCP_INAP_SSN
      self.class.cli_add [parms] 
    end
     
    def mod_cli arr
      self.class.cli_mod [arr.drop(3)] 
    end
     
    def backout_cli arr
      self.class.cli_add [arr.drop(3)] 
    end
     
     
    #
    # Class methods for generating CLI commands
    #

    def self.cli_query items
      items.map {|arr| "query #{arr[0]}-#{context};"}
    end 

    def self.cli_add items
      items.map do |arr|
        cli = "add EMERGENCYZONE Emer_Srvc_Zone_ID=#{arr[0]}, Emer_Srvc_Zone_Name=#{arr[1]}, "
        cli << "GMLC_Address=#{arr[2]}, "      unless arr[2].nil?
        cli << "PSAP_Zone_DN_Type=2, PSAP_Zone_DN=#{arr[3]}, "
        cli << "Loc_Service_Option=#{arr[10]}, Routing_Option=#{arr[11]}, "
        cli << "Begin_ESRK_Pool_1=#{arr[4]}, " unless arr[4].nil?
        cli << "End_ESRK_Pool_1=#{arr[5]}, "   unless arr[5].nil?
        cli << "Begin_ESRK_Pool_2=#{arr[6]}, " unless arr[6].nil?
        cli << "End_ESRK_Pool_2=#{arr[7]}, "   unless arr[7].nil?
        cli << "Begin_ESRK_Pool_3=#{arr[8]}, " unless arr[8].nil?
        cli << "End_ESRK_Pool_3=#{arr[9]}, "   unless arr[9].nil?
        cli << "SCP_Address=#{arr[12]}, "      unless arr[12].nil?
        cli << "SCP_INAP_SSN=#{arr[13]};"
      end 
    end 

    def self.cli_mod items
      items.map do |arr|
        "mod EMERGENCYZONE Emer_Srvc_Zone_ID=#{arr[0]}, Emer_Srvc_Zone_Name=#{arr[1]}, PSAP_Zone_DN=#{arr[3]};"
      end 
    end 

    def self.cli_del items
      items.map {|arr| "del #{arr[0]}-#{context};"}
    end 


    #
    # Class methods for help menus and reuse
    #

    def self.context
      "EMERGENCYZONE"
    end

    def self.parameter
      "ESZ_ID"
    end
     
    def self.value  
      "1029075001"
    end
     
     
    #
    # Class method for BINARY conversion
    #

    def self.from_binary str
      # return '""' if str == "{0091ffffffffffffffff}"
      return nil if str == "{0091ffffffffffffffff}"

      arr0 = Array.new(8)
      arr1 = Array.new(8)

      arr, idx = 0, 0
      str = str.slice 5..20

      str.each_char do |ch|
        case arr
          when 0 then arr0[idx] = ch
          when 1 then arr1[idx] = ch; idx += 1
        end
        arr == 0 ? arr = 1 : arr = 0
      end

      digits = ""
      arr0.length.times {|i| digits << "#{arr1[i]}#{arr0[i]}"}
      "#{digits}".delete("f")
    end

  end
end
 
 
 
if __FILE__ == $0 
  Alcatel::EmergencyZoneAuditTool.new(ARGV.shift, ARGV).run
end
 
 
 
