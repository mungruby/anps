
module CLI
 
  module MMAppConfigData 
 
    module COUNTRYINFO  

      def context
        cli =  "cd; cd Office-Parameters"
        cli << "/Mobility-Config-Parameters"
        cli << "/Country-Info;"
      end

      def cd
        "cd #{country_id}-COUNTRYINFO;"
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
        "mod "
      end

      def del
        "del #{country_id}-COUNTRYINFO;"
      end

    end
  end
end
 
