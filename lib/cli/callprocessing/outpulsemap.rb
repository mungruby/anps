
module CLI
 
  module CallProcessing
 
    module OUTPULSEMAP

      def cd
        "cd; cd Office-Parameters/Outpulse-Maps/ISUP-or-BICC-or-SIP-Outpulse-Map;"
      end

      def query
        digitpattern = convert_char_digitpattern
        "query #{outpulsemapid}-#{digitpattern}-#{inputnoa}-" +
        "#{mindigitcount}-#{maxdigitcount}-OUTPULSEMAP;"
      end

      def add
        # field conversions
        digitpattern = convert_char_digitpattern
        leadingdigitsadd = convert_char_leadingdigitsadd
        description = convert_char_description
        cpc = convert_tinyint_cpc
        cpc_priority = convert_tinyint_cpc_priority

        cli =  "add OUTPULSEMAP Outpulse_Map=#{outpulsemapid}, "
        cli << "Digit_String=#{digitpattern}, "
        cli << "Input_NOA=#{inputnoa}, "
        cli << "Min_Digit_Cnt=#{mindigitcount}, "
        cli << "Max_Digit_Cnt=#{maxdigitcount}, "
        cli << "Name=#{description}, "
        cli << "Rm_Leading_Digits_Cnt=#{leadingdigitscut}, "
        cli << "Add_Leading_Digits=#{leadingdigitsadd}, "
        cli << "Operation__1=#{outpulsemapindex1}, "
        cli << "Operation__2=#{outpulsemapindex2}, "
        cli << "Operation__3=#{outpulsemapindex3}, "
        cli << "Operation__4=#{outpulsemapindex4}, "
        cli << "Operation__5=#{outpulsemapindex5}, "
        cli << "Operation__6=#{outpulsemapindex6}, "
        cli << "Operation__7=#{outpulsemapindex7}, "
        cli << "Operation__8=#{outpulsemapindex8}, "
        cli << "Operation__9=#{outpulsemapindex9}, "
        cli << "Operation_10=#{outpulsemapindex10}, "
        cli << "Operation_11=#{outpulsemapindex11}, "
        cli << "Operation_12=#{outpulsemapindex12}, "
        cli << "Operation_13=#{outpulsemapindex13}, "
        cli << "Operation_14=#{outpulsemapindex14}, "
        cli << "Operation_15=#{outpulsemapindex15}, "
        cli << "Operation_16=#{outpulsemapindex16}, "
        cli << "Operation_17=#{outpulsemapindex17}, "
        cli << "Operation_18=#{outpulsemapindex18}, "
        cli << "Operation_19=#{outpulsemapindex19}, "
        cli << "Operation_20=#{outpulsemapindex20}, "
        cli << "Operation_21=#{outpulsemapindex21}, "
        cli << "Operation_22=#{outpulsemapindex22}, "
        cli << "Operation_23=#{outpulsemapindex23}, "
        cli << "Operation_24=#{outpulsemapindex24}, "
        cli << "Operation_25=#{outpulsemapindex25}, "
        cli << "Operation_26=#{outpulsemapindex26}, "
        cli << "Operation_27=#{outpulsemapindex27}, "
        cli << "Operation_28=#{outpulsemapindex28}, "
        cli << "Operation_29=#{outpulsemapindex29}, "
        cli << "Operation_30=#{outpulsemapindex30}, "
        cli << "Operation_31=#{outpulsemapindex31}, "
        cli << "Operation_32=#{outpulsemapindex32}, "
        cli << "Nature_Of_Address=#{natureofaddress}, "
        cli << "Oli=#{oli}, "
        cli << "CPC_Override=#{cpc}, "
        cli << "CPC_Priority=#{cpc_priority};"
      end

      def mod
        cli = "del #{outpulsemapid}-#{digitpattern}-#{inputnoa}-"
        cli << "#{mindigitcount}-#{maxdigitcount}-OUTPULSEMAP;"
        cli << "mod OUTPULSEMAP "
      end

      def del
        digitpattern = convert_char_digitpattern
        "del #{outpulsemapid}-#{digitpattern}-#{inputnoa}-" +
        "#{mindigitcount}-#{maxdigitcount}-OUTPULSEMAP;"
      end

      #
      # field conversions
      #

      def convert_char_digitpattern
        self.digitpattern.rstrip
      end

      def convert_char_leadingdigitsadd
        self.leadingdigitsadd.rstrip
      end

      def convert_char_description
        self.description.rstrip
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
 
