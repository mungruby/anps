
module CLI
 
  module MMAppConfigData 
 
    module CFGIMSIGLOBALTITLE

      def cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/" +
        "Mobile-Global-Title-or-Allowed-Roaming-Number;"
      end

      def query
        "query #{e212imsistr}-#{e214gttstr}-#{nwknodeid}-CFGIMSIGLOBALTITLE;"
      end

      def add
        cli =  "add CFGIMSIGLOBALTITLE E212_IMSI_Prefix=#{e212imsistr}, "
        cli << "E214_GTT_Prefix=#{e214gttstr}, "
        cli << "Network_Node=#{nwknodeid}, "
        cli << "Active=#{activeflag};"
      end

      def mod
        cli =  "mod CFGIMSIGLOBALTITLE "
      end

      def del
        "del #{e212imsistr}-#{e214gttstr}-#{nwknodeid}-CFGIMSIGLOBALTITLE;"
      end

    end
  end
end
 
