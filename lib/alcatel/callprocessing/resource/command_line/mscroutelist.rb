
module Alcatel
  module CallProcessing
    module Resource
      module MSCROUTELIST

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Route-List;"
          end

          def cd
            "cd #{routeindex}-MSCROUTELIST;"
          end

          def query
            "query #{routeindex}-MSCROUTELIST;"
          end

          def add
            cli =  "add MSCROUTELIST Route_List_Id=#{routeindex}, "
            cli << "Name=#{description}, "
            cli << "Type_1=#{type1}, Value_1=#{parameter1}, Outpulse_1=#{outpulseindex1}, "
            cli << "Type_2=#{type2}, Value_2=#{parameter2}, Outpulse_2=#{outpulseindex2}, "
            cli << "Type_3=#{type3}, Value_3=#{parameter3}, Outpulse_3=#{outpulseindex3}, "
            cli << "Type_4=#{type4}, Value_4=#{parameter4}, Outpulse_4=#{outpulseindex4}, "
            cli << "Type_5=#{type5}, Value_5=#{parameter5}, Outpulse_5=#{outpulseindex5}, "
            cli << "Type_6=#{type6}, Value_6=#{parameter6}, Outpulse_6=#{outpulseindex6}, "
            cli << "Type_7=#{type7}, Value_7=#{parameter7}, Outpulse_7=#{outpulseindex7}, "
            cli << "Type_8=#{type8}, Value_8=#{parameter8}, Outpulse_8=#{outpulseindex8}, "
            cli << "Look_Ahead=#{lookahead}, "
            cli << "CliOutpulse_1=#{clioutpulseindex1}, RNOutpulse_1=#{rnoutpulseindex1}, "
            cli << "OCNOutpulse_1=#{ocnoutpulseindex1}, PredefCLI_1=#{predefinedcliactive1}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_1=#{digitsoutpulseindex1}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_2=#{digitsoutpulseindex2}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_3=#{digitsoutpulseindex3}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_4=#{digitsoutpulseindex4}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_5=#{digitsoutpulseindex5}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_6=#{digitsoutpulseindex6}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_7=#{digitsoutpulseindex7}, "
            cli << "DIGITS_OUTPULSE_MAP_INDEX_8=#{digitsoutpulseindex8}, "
            cli << "CliOutpulse_2=#{clioutpulseindex2}, RNOutpulse_2=#{rnoutpulseindex2}, "
            cli << "OCNOutpulse_2=#{ocnoutpulseindex2}, PredefCLI_2=#{predefinedcliactive2}, "
            cli << "CliOutpulse_3=#{clioutpulseindex3}, RNOutpulse_3=#{rnoutpulseindex3}, "
            cli << "OCNOutpulse_3=#{ocnoutpulseindex3}, PredefCLI_3=#{predefinedcliactive3}, "
            cli << "CliOutpulse_4=#{clioutpulseindex4}, RNOutpulse_4=#{rnoutpulseindex4}, "
            cli << "OCNOutpulse_4=#{ocnoutpulseindex4}, PredefCLI_4=#{predefinedcliactive4}, "
            cli << "CliOutpulse_5=#{clioutpulseindex5}, RNOutpulse_5=#{rnoutpulseindex5}, "
            cli << "OCNOutpulse_5=#{ocnoutpulseindex5}, PredefCLI_5=#{predefinedcliactive5}, "
            cli << "CliOutpulse_6=#{clioutpulseindex6}, RNOutpulse_6=#{rnoutpulseindex6}, "
            cli << "OCNOutpulse_6=#{ocnoutpulseindex6}, PredefCLI_6=#{predefinedcliactive6}, "
            cli << "CliOutpulse_7=#{clioutpulseindex7}, RNOutpulse_7=#{rnoutpulseindex7}, "
            cli << "OCNOutpulse_7=#{ocnoutpulseindex7}, PredefCLI_7=#{predefinedcliactive7}, "
            cli << "CliOutpulse_8=#{clioutpulseindex8}, RNOutpulse_8=#{rnoutpulseindex8}, "
            cli << "OCNOutpulse_8=#{ocnoutpulseindex8}, PredefCLI_8=#{predefinedcliactive8};"
          end

          def mod
            "mod "
          end

          def del
            "del #{routeindex}-MSCROUTELIST;"
          end

        end
      end
    end
  end
end
 
