
module Alcatel
  module CallProcessing
    module Resource
      module SYSTEMEMERGENCYCALL

        module Converter

          def convert_fields
            self.default_psap_zone_dn = convert_char_default_psap_zone_dn
            self.default_esrd = convert_char_default_esrd
            self.invalid_esrk = convert_char_invalid_esrk
            self.default_mpc_dn = convert_char_default_mpc_dn
            self.non_dial_emgcy_prefix = convert_char_non_dial_emgcy_prefix
            self.default_esrk = convert_char_default_esrk
            self.gmlc_dn_esrd = convert_char_gmlc_dn_esrd
            self.default_scp_address = convert_binary_default_scp_address
            self
          end

          def convert_char_default_psap_zone_dn
            default_psap_zone_dn.rstrip
          end

          def convert_char_default_esrd
            default_esrd.rstrip
          end

          def convert_char_invalid_esrk
            invalid_esrk.rstrip
          end

          def convert_char_default_mpc_dn
            default_mpc_dn.rstrip
          end

          def convert_char_non_dial_emgcy_prefix
            non_dial_emgcy_prefix.rstrip
          end

          def convert_char_default_esrk
            default_esrk.rstrip
          end

          def convert_char_gmlc_dn_esrd
            gmlc_dn_esrd.rstrip
          end

          def convert_binary_default_scp_address
            if self.default_scp_address == "{00000000000000000000}"
              default_scp_address.slice 5..20
            else
              raise "#{default_scp_address}"
            end
          end

        end
      end
    end
  end
end
 
