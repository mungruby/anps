
module Alcatel
  module MMAppConfigData
    module Resource
      module MSCNETWORKNODE

        module Converter

          def convert_fields
            self.pointcode = convert_integer_pointcode
            self.address = convert_binary_address
            self.description = convert_char_description
            self.camelphases = convert_binary_camelphases
            self
          end

          def convert_integer_pointcode
            case self.pointcode
              when 0 then '000-000-000'
            else
              decimal = pointcode
              a = decimal / 65536
              decimal = decimal - (a * 65536)
              b = decimal / 256
              c = decimal - (b * 256)
              "#{a}-#{b}-#{c}"
            end
          end

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

          def convert_binary_camelphases
            if camelphases =~ /{[0-9a-f]000}/
              sprintf('%04b', camelphases[1].hex).split(//).map(&:to_i)
            else
              %w[Unk Unk Unk Unk]
            end

            # case self.camelphases
            #   when "{0000}" then [0, 0, 0, 0]
            #   when "{2000}" then [0, 0, 1, 0]
            #   when "{5000}" then [0, 1, 0, 1]
            #   when "{6000}" then [0, 1, 1, 0]
            #   when "{8000}" then [1, 0, 0, 0]
            #   when "{a000}" then [1, 0, 1, 0]
            #   when "{c000}" then [1, 1, 0, 0]
            #   when "{e000}" then [1, 1, 1, 0]
            #   else
            #     %w[Unk Unk Unk]
            # end
          end

        end
      end
    end
  end
end
 
