
module Alcatel
  module CallProcessing
    module Resource
      module PREFIX

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Wireless-Translation"
            cli << "/Prefix-Translation"
            cli << "/Digit-Translation;"
          end

          def cd
            "cd #{transtreeselector}-PREFIX;"
          end

          def query
            "query #{transtreeselector}-PREFIX;"
          end

          def add
            cli =  "add PREFIX Translator_Identifier=#{transtreeselector}, "
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
            "mod "
          end

          def del
            "del #{transtreeselector}-PREFIX;"
          end

        end
      end
    end
  end
end
 
