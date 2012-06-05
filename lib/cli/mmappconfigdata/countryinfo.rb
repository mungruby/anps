
module CLI
 
  module MMAppConfigData 
 
    module COUNTRYINFO  

      def cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/Country-Info;"
      end

      def query
        "query #{country_id}-COUNTRYINFO;"
      end

      def add
        cli =  "add COUNTRYINFO Country_Region_ID=#{country_id}, "
        cli << "Barring_Criteria=#{cb_criteria}, "
        cli << "Name=#{country_name};"
      end

      def mod
        cli =  "mod COUNTRYINFO "
      end

      def del
        "del #{country_id}-COUNTRYINFO;"
      end

    end
  end
end
 
