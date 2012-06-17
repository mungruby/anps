
module Alcatel
  module CallProcessing  
    module Resource
      module SYSTEMEMERGENCYCALL

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Mobility-Config-Parameters;"
          end

          def cd
            "cd #{dummy}-SYSTEMEMERGENCYCALL;"
          end

          def query
            "query #{dummy}-SYSTEMEMERGENCYCALL;"
          end

          def add
            cli =  "add SYSTEMEMERGENCYCALL Default_E911_Solution=#{default_solution_type}, "
            cli << "Def_SCP_Address=#{default_scp_address}"
            cli << ", Sys_PSAP_Zone_DN=#{default_psap_zone_dn}" unless default_psap_zone_dn == '911'
            cli << ", System_ESRD=#{default_esrd}"   # default: not defined
            cli << ", Default_ESRK=#{default_esrk}"  # default: not defined
            cli << ", Invalid_ESRK=#{invalid_esrk}" unless invalid_esrk == '9999999999'
            cli << ", MPC_DN=#{default_mpc_dn}" unless default_mpc_dn == '911'
            cli << ", Post_Info_Timer=#{pos_info_timer}" unless pos_info_timer == 4
            cli << ", SCP-GMLC-MPC_Qry_Tmr=#{gmlc_mpc_query_timer}" unless gmlc_mpc_query_timer == 7
            cli << ", PSAP_Call_Routing=#{psap_routing_option}" unless psap_routing_option == 1
            cli << ", Non_Dial_Emgcy_Prefix=#{non_dial_emgcy_prefix}" unless non_dial_emgcy_prefix == '911'
            cli << ", Def_Loc_Deliv_Method=#{default_loc_delivery_method}" unless default_loc_delivery_method == 1
            cli << ", GMLC_Address=#{gmlc_dn_esrd}"  # default: not defined
            cli << ", Non_Emer_Setup_Trans_Opt=#{translation_option}" unless translation_option == 0
            cli << ", Default_Remote_SSN=#{default_remote_ssn}, " unless default_remote_ssn == 12
            cli << ", CLI_for_Simless_Call=#{cli_for_simless_call}" unless cli_for_simless_call == 0
            cli << ", Pos_Info_UMTS_Timer=#{pos_info_timer_3g}"
            cli << ", Extnd_Pos_Info_UMTS_Timer=#{extended_pos_info_timer_3g}"
            cli << ";"
          end

          # def full_add
          #   cli =  "add SYSTEMEMERGENCYCALL Default_E911_Solution=#{default_solution_type}, "
          #   cli << "Def_SCP_Address=#{default_scp_address}"
          #   cli << ", Sys_PSAP_Zone_DN=#{default_psap_zone_dn}"
          #   cli << ", System_ESRD=#{default_esrd}"
          #   cli << ", Default_ESRK=#{default_esrk}"
          #   cli << ", Invalid_ESRK=#{invalid_esrk}"
          #   cli << ", MPC_DN=#{default_mpc_dn}"
          #   cli << ", Post_Info_Timer=#{pos_info_timer}"
          #   cli << ", SCP-GMLC-MPC_Qry_Tmr=#{gmlc_mpc_query_timer}"
          #   cli << ", PSAP_Call_Routing=#{psap_routing_option}"
          #   cli << ", Non_Dial_Emgcy_Prefix=#{non_dial_emgcy_prefix}"
          #   cli << ", Def_Loc_Deliv_Method=#{default_loc_delivery_method}"
          #   cli << ", GMLC_Address=#{gmlc_dn_esrd}"
          #   cli << ", Non_Emer_Setup_Trans_Opt=#{translation_option}"
          #   cli << ", Default_Remote_SSN=#{default_remote_ssn}, "
          #   cli << ", CLI_for_Simless_Call=#{cli_for_simless_call}"
          #   cli << ", Pos_Info_UMTS_Timer=#{pos_info_timer_3g}"
          #   cli << ", Extnd_Pos_Info_UMTS_Timer=#{extended_pos_info_timer_3g}"
          #   cli << ";"
          # end

          def mod
            "mod "
          end

          def del
            "del #{dummy}-SYSTEMEMERGENCYCALL;"
          end

        end
      end
    end
  end
end
 
