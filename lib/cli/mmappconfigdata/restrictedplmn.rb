
module CLI
 
  module MMAppConfigData 
 
    module RESTRICTEDPLMN  

      def context
        cli =  "cd; cd Office-Parameters"
        cli << "/Mobility-Config-Parameters"
        cli << "/Restricted-PLMN;"
      end

      def cd
        "cd #{restriction_list}-#{mcc}-#{mnc}-RESTRICTEDPLMN;"
      end

      def query
        "query #{restriction_list}-#{mcc}-#{mnc}-RESTRICTEDPLMN;"
      end

      def add
        cli =  "add RESTRICTEDPLMN Restriction_List_Id=#{restriction_list}, "
        cli << "Mobile_Country_Code=#{mcc}, "
        cli << "Mobile_Network_Code=#{mnc}, "
        cli << "Description=#{description};"
      end

      def mod
        "mod "
      end

      def del
        "del #{restriction_list}-#{mcc}-#{mnc}-RESTRICTEDPLMN;"
      end

    end
  end
end
 
