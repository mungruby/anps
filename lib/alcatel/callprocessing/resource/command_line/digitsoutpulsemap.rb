
module Alcatel
  module CallProcessing
    module Resource
      module DIGITSOUTPULSEMAP

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Outpulse-Maps"
            cli << "/Digits-Manipulations"
            cli << "/Digits-Outpulse-Map;"
          end

          def cd
            "cd #{digittype}-#{inputnoa}-#{nodeid}-#{servicekey}-#{outpulsemapindex}-" +
               "#{digitpattern}-#{mindigitcount}-#{maxdigitcount}-DIGITSOUTPULSEMAP;"
          end

          def query
            "query #{digittype}-#{inputnoa}-#{nodeid}-#{servicekey}-#{outpulsemapindex}-" +
                  "#{digitpattern}-#{mindigitcount}-#{maxdigitcount}-DIGITSOUTPULSEMAP;"
          end

          def add
            cli =  "add DIGITSOUTPULSEMAP Outpulse_Map=#{outpulsemapindex}, "
            cli << "Digit_Type=#{digittype}, "
            cli << "Digit_String=#{digitpattern}, "
            cli << "Input_NOA=#{inputnoa}, "
            cli << "Name=#{description}, "
            cli << "Min_Digit_Cnt=#{mindigitcount}, "
            cli << "Max_Digit_Cnt=#{maxdigitcount}, "
            cli << "SCP_NodeID=#{nodeid}, "
            cli << "Service_Key=#{servicekey}, "
            cli << "Sent=#{send}, "
            cli << "Start_Position=#{startposition}, "
            cli << "Digits_To_Delete=#{digitstodelete}, "
            cli << "Insert_Digits=#{insertdigits}, "
            cli << "Not_Sent=#{normalizeloc}, " unless normalizeloc == 1
            cli << "Output_NOA=#{outputnoa}, "
            cli << "Presentation_Ind=#{presentationind}, " unless presentationind == 255
            cli << "Num_Incomplete_Ind=#{numberincompleteind}, " unless numberincompleteind == 255
            cli << "Screening_Ind=#{screeningind}, " unless screeningind == 255
            cli << "Capture_In_CDR=#{captureincdr}, " unless captureincdr == 1
            cli << "Phone_RN_Context=#{phonecontext}, " unless phonecontext.empty?
            cli << "Source_Number_1=#{sourcenumber1}, Modify_Index_1=#{modifydigitindex1}, "
            cli << "Source_Number_2=#{sourcenumber2}, Modify_Index_2=#{modifydigitindex2}, "
            cli << "Source_Number_3=#{sourcenumber3}, Modify_Index_3=#{modifydigitindex3}, "
            cli << "Source_Number_4=#{sourcenumber4}, Modify_Index_4=#{modifydigitindex4}, "
            cli << "Source_Number_5=#{sourcenumber5}, Modify_Index_5=#{modifydigitindex5};"
          end

          def mod
            "mod "
          end

          def del
            "del #{digittype}-#{inputnoa}-#{nodeid}-#{servicekey}-#{outpulsemapindex}-" +
                "#{digitpattern}-#{mindigitcount}-#{maxdigitcount}-DIGITSOUTPULSEMAP;"
          end

        end
      end
    end
  end
end
 
