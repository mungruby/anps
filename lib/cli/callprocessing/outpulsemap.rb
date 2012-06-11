
module CLI
 
  module CallProcessing
 
    module OUTPULSEMAP

      def context
        cli =  "cd; cd Office-Parameters"
        cli << "/Outpulse-Maps"
        cli << "/ISUP-or-BICC-or-SIP-Outpulse-Map;"
      end

      def cd
        "cd #{outpulsemapid}-#{digitpattern}-#{inputnoa}-#{mindigitcount}-#{maxdigitcount}-OUTPULSEMAP;"
      end

      def query
        "query #{outpulsemapid}-#{digitpattern}-#{inputnoa}-#{mindigitcount}-#{maxdigitcount}-OUTPULSEMAP;"
      end

      def add
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
        "mod "
      end

      def del
        "del #{outpulsemapid}-#{digitpattern}-#{inputnoa}-#{mindigitcount}-#{maxdigitcount}-OUTPULSEMAP;"
      end

    end
  end
end
 
