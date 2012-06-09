
module FieldConverter
 
  module CallProcessing
 
    module SERVCRILIST

      def convert_fields
        self.digitpattern = convert_binary_digitpattern
        self
      end

      def convert_binary_digitpattern
        arr_to_fill, idx = 0, 0
        arr0 = Array.new 8
        arr1 = Array.new 8

        self.digitpattern.slice(3..18).each_char do |ch|
          case arr_to_fill
            when 0 then arr0[idx] = ch
            when 1 then arr1[idx] = ch; idx += 1
          end
          arr_to_fill = arr_to_fill == 0 ? 1 : 0
        end
        arr1.zip(arr0).flatten.join.delete 'f'
      end

    end
  end
end
 
