
module CLI
 
  module CallProcessing
 
    module EMERGENCYZONE

      def self.cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/Emergency-Service-Zone-Provisioning;"
      end

      def cd
        "cd #{esz_id}-EMERGENCYZONE;"
      end

      def query
        "query #{esz_id}-EMERGENCYZONE;"
      end

      def add
        # field conversions
        esz_name = convert_char_esz_name
        psap_zone_dn = convert_char_psap_zone_dn
        gmlc_dn = convert_char_gmlc_dn
        begin_esrk = convert_char_begin_esrk
        end_esrk = convert_char_end_esrk
        begin_esrk_pool2 = convert_char_begin_esrk_pool2
        end_esrk_pool2 = convert_char_end_esrk_pool2
        begin_esrk_pool3 = convert_char_begin_esrk_pool3
        end_esrk_pool3 = convert_char_end_esrk_pool3
        scp_address = convert_binary_scp_address

        cli =  "add EMERGENCYZONE Emer_Srvc_Zone_ID=#{esz_id}, "
        cli << "Emer_Srvc_Zone_Name=#{esz_name}, "
        cli << "PSAP_Zone_DN=#{psap_zone_dn}, PSAP_Zone_DN_Type=2, "
        cli << "GMLC_Address=#{gmlc_dn}, " unless gmlc_dn.empty?
        cli << "Loc_Service_Option=#{loc_service_option}, "
        cli << "Routing_Option=#{ec_routing_option}, "
        cli << "Begin_ESRK_Pool_1=#{begin_esrk}, " unless begin_esrk.empty?
        cli << "End_ESRK_Pool_1=#{end_esrk}, " unless end_esrk.empty?
        cli << "Begin_ESRK_Pool_2=#{begin_esrk_pool2}, " unless begin_esrk_pool2.empty?
        cli << "End_ESRK_Pool_2=#{end_esrk_pool2}, " unless end_esrk_pool2.empty?
        cli << "Begin_ESRK_Pool_3=#{begin_esrk_pool3}, " unless begin_esrk_pool3.empty?
        cli << "End_ESRK_Pool_3=#{end_esrk_pool3}, " unless end_esrk_pool3.empty?
        cli << "SCP_Address=#{scp_address}, " unless scp_address.empty?
        cli << "SCP_INAP_SSN=#{scp_inap_ssn};"
      end

      def mod
        "mod EMERGENCYZONE"
      end

      def del
        "del #{esz_id}-EMERGENCYZONE;"
      end


      #
      # field conversions
      #

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
 
