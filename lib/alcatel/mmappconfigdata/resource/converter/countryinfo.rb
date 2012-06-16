
module Alcatel
  module MMAppConfigData 
    module Resource
      module COUNTRYINFO     

        module Converter

          def convert_fields
            self.country_name = convert_char_country_name
            self
          end

          def convert_char_country_name
            country_name.rstrip
          end

        end
      end
    end
  end
end
 
