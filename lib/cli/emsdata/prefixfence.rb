
module CLI
 
  module EmsData
 
    module PREFIXFENCE

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/Prefix-Translation" +
        "/Digit-Translation/#{prefixtreeselector}-PREFIX/Digit-Prefix-Translation;"
      end

      def query
        "query #{prefixtreeselector}-#{digitpattern}-#{translationgroup}-#{expecteddigitcount}-PREFIXFENCE;"
      end

      def add
        cli =  "add PREFIXFENCE Prefix_Tree=#{prefixtreeselector}, "
        cli << "Digit_String=#{digitpattern}, "
        cli << "Name=#{description}, "
        cli << "Translation_Group=#{translationgroup}, "
        cli << "Min_Digit_Cnt=#{expecteddigitcount}, "
      end

      def mod
        cli = "cd #{prefixtreeselector}-#{digitpattern}-#{translationgroup}-#{expecteddigitcount}-PREFIXFENCE;mod "
      end

      def del
        "del #{prefixtreeselector}-#{digitpattern}-#{translationgroup}-#{expecteddigitcount}-PREFIXFENCE;"
      end

    end
  end
end
 
