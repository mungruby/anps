
module Alcatel
  module MMAppConfigData
    module Resource
      module RESTRICTEDLACCELL

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/LAC-Restriction-Provisioning;"
          end

          def cd
            "cd #{mcc_mnc}-#{lac}-#{cellid_begin}-#{cellid_end}-RESTRICTEDLACCELL;"
          end

          def query
            "query #{mcc_mnc}-#{lac}-#{cellid_begin}-#{cellid_end}-RESTRICTEDLACCELL;"
          end

          def add
            cli =  "add RESTRICTEDLACCELL Mcc_Mnc_Id=#{mcc_mnc}, "
            cli << "LAC=#{lac}, "
            cli << "RESTRICTED_LAC=#{restricted_lac}, "
            if restricted_lac == 0
              cli << "CELLID_BEGIN=#{cellid_begin}, "
              cli << "CELLID_END=#{cellid_end}, "
            end
            cli << "RESTRICTION_LIST=#{restriction_list}, "
            cli << "Description=#{description};"
          end

          def mod
            "mod "
          end

          def del
            "del #{mcc_mnc}-#{lac}-#{cellid_begin}-#{cellid_end}-RESTRICTEDLACCELL;"
          end

        end
      end
    end
  end
end
 
