
module Alcatel
  module CallProcessing
    module Resource
      module TRUNKGROUP

        module CommandLine

          def context
            cli =  "cd; cd Office-Parameters"
            cli << "/Routing-and-Translation"
            cli << "/Trunk-Group-Bundle"
            cli << "/#{bundleindex}-TRUNKGROUPBUNDLE;"
          end

          def cd
            "cd #{sysgrporder}-TRUNKGROUP;"
          end

          def query
            "query #{sysgrporder}-TRUNKGROUP;"
          end

          def add
            # usergrpnum = systemgroups.usergrpnum(sysgrpnum)
            cli =  "add TRUNKGROUP TRK1Order=#{sysgrporder}, "
            cli << "TRK1Group_Number=#{usergrpnum}, "
            cli << "TRK1Weight=#{weight}, "
            cli << "TRK1DIGITS_OUTPULSE_INDEX=#{digitsoutpulseindex}, "
            cli << "TRK1CldOutpulse=#{cldoutpulseindex}, "
            cli << "TRK1CliOutpulse=#{clioutpulseindex};"
          end

          def mod
            "mod "
          end

          def del
            "del #{sysgrporder}-TRUNKGROUP;"
          end

        end
      end
    end
  end
end
 
