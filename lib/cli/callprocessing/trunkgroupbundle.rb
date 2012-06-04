
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

    end
  end
end
 
