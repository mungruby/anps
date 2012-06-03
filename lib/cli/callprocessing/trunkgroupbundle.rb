
module CLI
 
  module CallProcessing
 
    module TRUNKGROUPBUNDLE

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation/Trunk-Group-Bundle;"
      end

      def query
        "query #{bundleindex}-TRUNKGROUPBUNDLE;"
      end

      def add
        # field conversions
        bundledesc = convert_char_bundledesc

        cli =  "add TRUNKGROUPBUNDLE TRK2Bundle_Number=#{bundleindex}"
        cli << ", TRK2Name=#{bundledesc}" unless bundledesc.empty?
        cli << ";"
      end

      def mod
        cli =  "cd #{bundleindex}-TRUNKGROUPBUNDLE;\n"
        cli << "mod TRUNKGROUPBUNDLE "
      end

      def del
        "del #{bundleindex}-TRUNKGROUPBUNDLE;"
      end

      #
      # field conversions
      #

      def convert_char_bundledesc
        self.bundledesc.rstrip
      end

    end
  end
end
 
