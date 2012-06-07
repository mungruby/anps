
module CLI
 
  module CallProcessing
 
    module DIGITTRANSLATION

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/" +
        "National-Tree-Selector/#{nattreeselector}-NATTREESELECTOR/National-Translation;"
      end

      def query
        "query #{translationgroup}-#{nattreeselector}-#{digitpattern}-DIGITTRANSLATION;"
      end

      def add
        cli =  "add DIGITTRANSLATION Digit_String=#{digitpattern}, "
        cli << "Route_Action=#{routeactiontype}, "
        cli << "Route_Index=#{routeaction}, "
        cli << "National_Tree=#{nattreeselector}, "
        cli << "Translation_Group=#{translationgroup}, "
        cli << "Ported_Office=#{portedenableoffice}, "
        cli << "Description=#{description};"
      end

      def mod
        cli =  "cd #{translationgroup}-#{nattreeselector}-#{digitpattern}-DIGITTRANSLATION;\n"
        cli << "mod DIGITTRANSLATION "
      end

      def del
        "del #{translationgroup}-#{nattreeselector}-#{digitpattern}-DIGITTRANSLATION;"
      end

    end
  end
end
 
