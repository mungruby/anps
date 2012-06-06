
module CLI
 
  module CallProcessing  
 
    module HPLMODBMAP

      def cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/ODB-Config/PLMN-ODB-Mapping;"
      end

      def query
        "query #{plmnodbid}-HPLMODBMAP;"
      end

      def add
        cli = "add HPLMODBMAP PLMN_ODB_ID=#{plmnodbid}, Service_Key=#{servicekey};"
      end

      def mod
        cli = "mod HPLMODBMAP "
      end

      def del
        "del #{plmnodbid}-HPLMODBMAP;"
      end

    end
  end
end
 
