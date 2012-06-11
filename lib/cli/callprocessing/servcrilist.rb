
module CLI
 
  module CallProcessing  
 
    module SERVCRILIST

      def context
        "cd; cd Office-Parameters/Mobility-Config-Parameters/ODB-Config/1-SERVICECRILISTKEY;"
      end

      def cd
        "cd #{servicekey}-#{digitpattern}-#{digittype}-SERVCRILIST;"
      end

      def query
        "query #{servicekey}-#{digitpattern}-#{digittype}-SERVCRILIST;"
      end

      def add
        cli =  "add SERVCRILIST Service_Key=#{servicekey}, "
        cli << "Digit_Pattern=#{digitpattern}, "
        cli << "Digit_Type=#{digittype};"
      end

      def mod
        "The resource cannot be modified."
      end

      def del
        "del #{servicekey}-#{digitpattern}-#{digittype}-SERVCRILIST;"
      end

    end
  end
end
 
