
module Alcatel
  module CallProcessing  
    module Resource
      module EMERGENCYCALL

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/LAC-or-CELL-Emergency-Call-Provisioning;"
          end

          def cd
            "cd #{mcc_mnc}-#{lac}-#{cellid_begin}-#{cellid_end}-#{network_type}-EMERGENCYCALL;"
          end

          def query
            "query #{mcc_mnc}-#{lac}-#{cellid_begin}-#{cellid_end}-#{network_type}-EMERGENCYCALL;"
          end

          def add
            cli =  "add EMERGENCYCALL NetworkType=#{network_type}, "
            cli << "Mcc_Mnc_Id=#{mcc_mnc}, "
            cli << "Location_Area_Code=#{lac}, "
            cli << "Cell_Id_Begin=#{cellid_begin}, "
            cli << "Cell_Id_End=#{cellid_end}, "
            if network_type == 0
              cli << "SAC_Id_Begin=#{sac_begin}, "
              cli << "SAC_Id_End=#{sac_end}, "
            end
            cli << "E911_Solution_Type=#{solution_type}, "
            cli << "Emer_Srvc_Zone_ID=#{esz_id}, "
            cli << "Esrd=#{esrd}, "
            cli << "ESRK_Assn_Method=#{esrk_assignment_method}, "
            cli << "Location_Delivery_Method=#{loc_delivery_method};"
          end

          def mod
            "mod "
          end

          def del
            "del #{mcc_mnc}-#{lac}-#{cellid_begin}-#{cellid_end}-#{network_type}-EMERGENCYCALL;"
          end

        end
      end
    end
  end
end
 
