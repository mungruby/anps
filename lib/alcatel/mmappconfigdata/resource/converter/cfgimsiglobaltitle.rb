
module Alcatel
  module MMAppConfigData 
    module Resource
      module CFGIMSIGLOBALTITLE

        module Converter

          def convert_fields
            self.e212imsistr = convert_char_e212imsistr
            self.e214gttstr = convert_char_e214gttstr
            self
          end

          def convert_char_e212imsistr
            e212imsistr.rstrip
          end

          def convert_char_e214gttstr
            e214gttstr.rstrip
          end

        end
      end
    end
  end
end
 
