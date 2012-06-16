
module Alcatel
  module CallProcessing
    module Resource
      module OUTPULSEMAP

        module Converter

          def convert_fields
            self.digitpattern = convert_char_digitpattern
            self.leadingdigitsadd = convert_char_leadingdigitsadd
            self.description = convert_char_description
            self.cpc = convert_tinyint_cpc
            self.cpc_priority = convert_tinyint_cpc_priority
            self
          end

          def convert_char_digitpattern
            digitpattern.rstrip
          end

          def convert_char_leadingdigitsadd
            leadingdigitsadd.rstrip
          end

          def convert_char_description
            description.rstrip
          end

          def convert_tinyint_cpc
            case self.cpc
              when 0 then 'Unknown'
              when 255 then 'Do Not Overwrite'
              else raise "Unexpected value: CPC_Override=#{self.cpc}"
            end
          end

          def convert_tinyint_cpc_priority
            case self.cpc_priority
              when 0 then 'Unknown'
              when 255 then 'Do Not Overwrite'
              else raise "Unexpected value: CPC_Priority=#{self.cpc_priority}"
            end
          end

        end
      end
    end
  end
end
 
