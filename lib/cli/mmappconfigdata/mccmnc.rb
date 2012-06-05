
module CLI
 
  module MMAppConfigData 
 
    module MCCMNC

      def cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/MSC-MCC-and-MNC;"
      end

      def query
        "query #{mcc}-#{mnc}-MCCMNC;"
      end

      def add
        cli =  "add MCCMNC Mobile_Country_Code=#{mcc}, "
        cli << "Mobile_Network_Code=#{mnc}, "
        cli << "PLMN_Id=#{plmnid}, "
        cli << "Access_Type=#{accesstype}, "
        cli << "Description=#{description};"
      end

      def mod
        cli =  "mod MCCMNC "
      end

      def del
        "del #{mcc}-#{mnc}-MCCMNC;"
      end

    end
  end
end
 
