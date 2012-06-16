
module Alcatel
  module CallProcessing
    module Resource
      module TRUNKGROUPBUNDLE

        module Converter

          def convert_fields
            self.bundledesc = convert_char_bundledesc
            self
          end

          def convert_char_bundledesc
            bundledesc.rstrip
          end

        end
      end
    end
  end
end
 
