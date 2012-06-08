
module CLI
 
  module CallProcessing  
 
    module SERVICECRITERIA

      def cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/ODB-Config/Service-Criteria;"
      end

      def query
        "query #{servicekey}-SERVICECRITERIA;"
      end

      def add
        cli =  "add SERVICECRITERIA Service_Key=#{servicekey}, "
        cli << "Criteria=#{handlingcriteria}, "
        cli << "Description=#{description};"
      end

      def mod
        "cd #{servicekey}-SERVICECRITERIA;\nmod SERVICECRITERIA "
      end

      def del
        "del #{servicekey}-SERVICECRITERIA;"
      end

    end
  end
end
 
