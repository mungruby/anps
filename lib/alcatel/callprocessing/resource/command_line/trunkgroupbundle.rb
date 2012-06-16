
module Alcatel
  module CallProcessing
    module Resource
      module TRUNKGROUPBUNDLE

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Trunk-Group-Bundle;"
          end

          def cd
            "cd #{bundleindex}-TRUNKGROUPBUNDLE;"
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
            "mod "
          end

          def del
            "del #{bundleindex}-TRUNKGROUPBUNDLE;"
          end

        end
      end
    end
  end
end
 
