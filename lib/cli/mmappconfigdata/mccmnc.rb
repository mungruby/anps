
module CLI
 
  module MMAppConfigData 
 
    module MCCMNC

      def context
        cli =  "cd; cd Office-Parameters"
        cli << "/Mobility-Config-Parameters"
        cli << "/MSC-MCC-and-MNC;"
      end

      def cd
        "cd #{mcc}-#{mnc}-MCCMNC;"
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
        "mod "
      end

      def del
        "del #{mcc}-#{mnc}-MCCMNC;"
      end

    end
  end
end
 
