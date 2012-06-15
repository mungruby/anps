
module Alcatel
  module CallProcessing
    module Resource
      module EMERGENCYCALL
        module Converter

          UMTS = 0
          GSM = 1

          def convert_fields
            self.network_type = set_network_type
            self.cellid_begin = convert_cellid_begin(network_type)
            self.cellid_end = convert_cellid_end(network_type)
            self.sac_begin = set_sac_begin
            self.sac_end = set_sac_end
            self.esrd = convert_char_esrd
            self.esrk_prefix = convert_char_esrk_prefix
            self
          end

          def set_network_type
            case self.cellid_begin > 65535
              when true then UMTS
              when false then GSM
            end
          end

          def convert_cellid_begin network_type
            case network_type
              when UMTS then cellid_begin - 65536
              when GSM then cellid_begin
            end
          end

          def convert_cellid_end network_type
            case network_type
              when UMTS then cellid_end - 65536
              when GSM then cellid_end
            end
          end

          def set_sac_begin
            case self.network_type
              when UMTS then cellid_begin
              when GSM then 0
            end
          end

          def set_sac_end
            case self.network_type
              when UMTS then cellid_end
              when GSM then 0
            end
          end

          def convert_char_esrd
            esrd.rstrip
          end

          def convert_char_esrk_prefix
            esrk_prefix.rstrip
          end

        end
      end
    end
  end
end
 
