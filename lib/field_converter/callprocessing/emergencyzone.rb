
module FieldConverter
 
  module CallProcessing
 
    module EMERGENCYZONE

      def convert_fields
        self.esz_name = convert_char_esz_name
        self.psap_zone_dn = convert_char_psap_zone_dn
        self.gmlc_dn = convert_char_gmlc_dn
        self.begin_esrk = convert_char_begin_esrk
        self.end_esrk = convert_char_end_esrk
        self.begin_esrk_pool2 = convert_char_begin_esrk_pool2
        self.end_esrk_pool2 = convert_char_end_esrk_pool2
        self.begin_esrk_pool3 = convert_char_begin_esrk_pool3
        self.end_esrk_pool3 = convert_char_end_esrk_pool3
        self.scp_address = convert_binary_scp_address
      end

      def convert_char_esz_name
        self.esz_name.rstrip
      end

      def convert_char_psap_zone_dn
        self.psap_zone_dn.rstrip
      end

      def convert_char_gmlc_dn 
        self.gmlc_dn.rstrip
      end

      def convert_char_begin_esrk
        self.begin_esrk.rstrip
      end

      def convert_char_end_esrk
        self.end_esrk.rstrip
      end

      def convert_char_begin_esrk_pool2
        self.begin_esrk_pool2.rstrip
      end

      def convert_char_end_esrk_pool2
        self.end_esrk_pool2.rstrip
      end

      def convert_char_begin_esrk_pool3
        self.begin_esrk_pool3.rstrip
      end

      def convert_char_end_esrk_pool3
        self.end_esrk_pool3.rstrip
      end

      def convert_binary_scp_address
        arr_to_fill, idx = 0, 0
        arr0 = Array.new 8
        arr1 = Array.new 8

        self.scp_address.slice(5..20).each_char do |ch|
          case arr_to_fill
            when 0 then arr0[idx] = ch
            when 1 then arr1[idx] = ch; idx += 1
          end
          arr_to_fill = arr_to_fill == 0 ? 1 : 0
        end
        scp_address = ""
        arr0.length.times {|i| scp_address << "#{arr1[i]}#{arr0[i]}"}
        scp_address.delete 'f'
      end

    end
  end
end
 
