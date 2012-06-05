
module CLI
 
  module MMAppConfigData 
 
    module DIGITPREFIX  

      def cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/Digit-Prefix;"
      end

      def query
        "query #{digitprefix}-DIGITPREFIX;"
      end

      def add
        cli =  "add DIGITPREFIX Digit_Prefix=#{digitprefix}, "
        cli << "Country_Region_ID=#{country_id}, "
        cli << "Description=#{description};"
      end

      def mod
        cli =  "mod DIGITPREFIX "
      end

      def del
        "del #{digitprefix}-DIGITPREFIX;"
      end

    end
  end
end
 
