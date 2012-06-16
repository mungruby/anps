
module Alcatel
  module CallProcessing
    module Resource
      module MSCROUTELIST

        module Converter

          def convert_fields
            self.description = convert_char_description
            self.lookahead = convert_tinyint_lookahead
            self
          end

          def convert_char_description
            description.rstrip
          end

          def convert_tinyint_lookahead
            # db sometimes has a 2 which is not a valid value for lookahead
            self.lookahead == 2 ? 0 : lookahead
          end

        end
      end
    end
  end
end
 
