
module Alcatel
  module CallProcessing
    module Resource
      module EMERGENCYZONE

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters"
            cli << "/Emergency-Service-Zone-Provisioning;"
          end

          def cd
            "cd #{esz_id}-EMERGENCYZONE;"
          end

          def query
            "query #{esz_id}-EMERGENCYZONE;"
          end

          def add
            cli =  "add EMERGENCYZONE Emer_Srvc_Zone_ID=#{esz_id}, "
            cli << "Emer_Srvc_Zone_Name=#{esz_name}, "
            cli << "PSAP_Zone_DN=#{psap_zone_dn}, PSAP_Zone_DN_Type=2, "
            cli << "GMLC_Address=#{gmlc_dn}, " unless gmlc_dn.empty?
            cli << "Loc_Service_Option=#{loc_service_option}, "
            cli << "Routing_Option=#{ec_routing_option}, "
            cli << "Begin_ESRK_Pool_1=#{begin_esrk}, " unless begin_esrk.empty?
            cli << "End_ESRK_Pool_1=#{end_esrk}, " unless end_esrk.empty?
            cli << "Begin_ESRK_Pool_2=#{begin_esrk_pool2}, " unless begin_esrk_pool2.empty?
            cli << "End_ESRK_Pool_2=#{end_esrk_pool2}, " unless end_esrk_pool2.empty?
            cli << "Begin_ESRK_Pool_3=#{begin_esrk_pool3}, " unless begin_esrk_pool3.empty?
            cli << "End_ESRK_Pool_3=#{end_esrk_pool3}, " unless end_esrk_pool3.empty?
            cli << "SCP_Address=#{scp_address}, " unless scp_address.empty?
            cli << "SCP_INAP_SSN=#{scp_inap_ssn};"
          end

          def mod
            "mod "
          end

          def del
            "del #{esz_id}-EMERGENCYZONE;"
          end

        end
      end
    end
  end
end
 
