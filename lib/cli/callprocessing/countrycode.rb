
module CLI
 
  module CallProcessing
 
    module COUNTRYCODE

      def context
        "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/" +
        "International-Translation;"
      end

      def cd
        "cd #{countrycode}-COUNTRYCODE;"
      end

      def query
        "query #{countrycode}-COUNTRYCODE;"
      end

      def add
        cli =  "add COUNTRYCODE Country_Code=#{countrycode}, "
        cli << "Min__Length=#{minlength}, "
        cli << "Max__Length=#{maxlength}, "
        cli << "Orig__Route_Descriptor=#{routeindex}, "
        cli << "Name=#{description};"
      end

      def mod
        "mod "
      end

      def del
        "del #{countrycode}-COUNTRYCODE;"
      end

    end
  end
end
 
