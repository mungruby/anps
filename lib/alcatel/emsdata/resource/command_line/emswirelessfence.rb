
module Alcatel
  module EmsData
    module Resource
      module EMSWIRELESSFENCE

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Wireless-Translation"
            cli << "/Wireless-Normalization"
            cli << "/Digit-Translation"
            cli << "/#{prefixtreeselector}-EMSWIRELESSNORMAL"
            cli << "/Digit-Normalization;"
          end

          def cd
            "cd #{prefixtreeselector}-#{digitpattern}-#{translationgroup}-#{expecteddigitcount}-EMSWIRELESSFENCE;"
          end

          def query
            "query #{prefixtreeselector}-#{digitpattern}-#{translationgroup}-#{expecteddigitcount}-EMSWIRELESSFENCE;"
          end

          def add
            # emsprefixfence
            cli =  "add EMSWIRELESSFENCE Prefix_Tree=#{prefixtreeselector}, "
            cli << "Digit_String=#{digitpattern}, "
            cli << "Name=#{description}, "
            cli << "Translation_Group=#{translationgroup}, "
            cli << "Min_Digit_Cnt=#{expecteddigitcount}, "

            # cpcallmdigitfence
            cli << "Route_Action=#{df.routeactiontype}, "                    # 10
            cli << "Route_Index=#{df.routeaction}, "                         # 11
            cli << "Max_Digit_Cnt=#{df.maxdigitcount}, "                     # 15
            cli << "Remove_Leading_Digits=#{df.leadingdigitscut}, "          # 4
            cli << "Add_Leading_Digits=#{df.leadingdigitsadd}, " unless df.leadingdigitsadd.empty?   # 5
            cli << "Termination_Type=#{df.terminationtype}, "                # 7
            cli << "Service_Index=#{df.serviceindex}, "                      # 8
            cli << "Digit_String_Type=#{df.digittype}, "                     # 9
            cli << "Carrier_Id=#{df.carrierid}, "                            # 14
            cli << "Add_Leading_Digits_Type=#{df.leadingdigitsaddtype}, "    # 16
            cli << "Echo_Cancellation=#{df.echocancellation}, "              # 17
            cli << "Country_Code=#{df.countrycode}, "                        # 18
            cli << "Output_NOA=#{df.outputnoa}, "                            # 19
            cli << "Tariff_Group=#{df.tariffgroup}, "                        # 20
            cli << "Destination_Type=#{df.destinationtype}, "                # 21
            cli << "International_prefix_length=#{df.intlprefixlen}, "       # 23
            cli << "National_Tree=#{df.nattreeselector}, "                   # 24
            cli << "Start_Position=#{df.startposition}, "                    # 25
            # 26 - 35
            cli << "Source_Number_1=#{df.sourcenumber1}, Modify_Index_1=#{df.modifydigitindex1}, "
            cli << "Source_Number_2=#{df.sourcenumber2}, Modify_Index_2=#{df.modifydigitindex2}, "
            cli << "Source_Number_3=#{df.sourcenumber3}, Modify_Index_3=#{df.modifydigitindex3}, "
            cli << "Source_Number_4=#{df.sourcenumber4}, Modify_Index_4=#{df.modifydigitindex4}, "
            cli << "Source_Number_5=#{df.sourcenumber5}, Modify_Index_5=#{df.modifydigitindex5}, "
            cli << "Ann_Or_Tone=#{df.toneannid}, "                           # 36
            cli << "Call_Gapp_Filter_Id=#{df.callgappfilterid}, "            # 38
            cli << "No_Charge=#{df.nocharge}, "                              # 39
            cli << "digitFence_CPC=#{df.cpc};"                               # 22
          end

          def mod
            "mod "
          end

          def del
            "del #{prefixtreeselector}-#{digitpattern}-#{translationgroup}-#{expecteddigitcount}-EMSWIRELESSFENCE;"
          end

        end
      end
    end
  end
end
 
