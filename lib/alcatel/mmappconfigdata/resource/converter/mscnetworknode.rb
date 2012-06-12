
module Alcatel
  module MMAppConfigData
    module Resource
      module MSCNETWORKNODE

        module Converter

          def convert_fields
            self.address = convert_binary_address
            # self.mnc = convert_binary_mnc
            self.description = convert_char_description
            self
          end

          # def convert_binary_mnc
          #   mnc.match(/{.([0-9a-f]).([0-9a-f]).([0-9a-f])}/).to_a.drop(1).join.delete('f')
          # end

          def convert_binary_address
            arr_to_fill, idx = 0, 0
            arr0 = Array.new 8
            arr1 = Array.new 8

            self.address.slice(3..18).each_char do |ch|
              case arr_to_fill
                when 0 then arr0[idx] = ch
                when 1 then arr1[idx] = ch; idx += 1
              end
              arr_to_fill = arr_to_fill == 0 ? 1 : 0
            end
            arr1.zip(arr0).flatten.join.delete 'f'
          end

          def convert_char_description
            description.rstrip
          end

        end
      end
    end
  end
end
 
