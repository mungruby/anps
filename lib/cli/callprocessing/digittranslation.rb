
module CLI
 
  module CallProcessing
 
    module DIGITTRANSLATION

      def context
        cli =  "cd; cd Office-Parameters"
        cli << "/Routing-and-Translation"
        cli << "/Wireless-Translation"
        cli << "/National-Tree-Selector"
        cli << "/#{nattreeselector}-NATTREESELECTOR"
        cli << "/National-Translation;"
      end

      def cd
        "cd #{translationgroup}-#{nattreeselector}-#{digitpattern}-DIGITTRANSLATION;"
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
        "mod "
      end

      def del
        "del #{translationgroup}-#{nattreeselector}-#{digitpattern}-DIGITTRANSLATION;"
      end

    end
  end
end
 
