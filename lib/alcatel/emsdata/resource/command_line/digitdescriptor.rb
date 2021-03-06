
module Alcatel
  module EmsData
    module Resource
      module DIGITDESCRIPTOR

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Routing"
            cli << "/Orig-Routing"
            cli << "/Orig-Route-Descriptor;"
          end

          def cd
            "cd #{descriptorindex}-DIGITDESCRIPTOR;"
          end

          def query
            "query #{descriptorindex}-DIGITDESCRIPTOR;"
          end

          def add
            "add DIGITDESCRIPTOR Index=#{descriptorindex}, Name=#{descriptor};"
          end

          def mod
            "The resource cannot be modified."
          end

          def del
            "del #{descriptorindex}-DIGITDESCRIPTOR;"
          end

        end
      end
    end
  end
end
 
