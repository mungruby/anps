
module CLI
 
  module CallProcessing
 
    module EMSWIRELESSNORMAL

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation/Wireless-Translation/" +
        "Wireless-Normalization/Digit-Translation;"
      end

      def query
        "query #{transtreeselector}-EMSWIRELESSNORMAL;"
      end

      def add
        cli =  "add EMSWIRELESSNORMAL Translator_Identifier=#{transtreeselector}, "
        cli << "Tree_Type=#{treetype}"
        cli << ", Modifier1_Type=#{m1type}" unless m1type == 0
        cli << ", Modifier2_Type=#{m2type}" unless m2type == 0
        cli << ", Modifier3_Type=#{m3type}" unless m3type == 0
        cli << ", Modifier4_Type=#{m4type}" unless m4type == 0
        cli << ", Modifier5_Type=#{m5type}" unless m5type == 0
        cli << ", Name=#{description}"      unless description.empty?
        cli << ";"
      end

      def mod
        "cd #{transtreeselector}-EMSWIRELESSNORMAL; mod Name=#{description};"
      end

      def del
        "del #{transtreeselector}-EMSWIRELESSNORMAL;"
      end

    end
  end
end
 
