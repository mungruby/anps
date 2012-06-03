
module CLI
 
  module CallProcessing
 
    module TRUNKGROUP

      def self.cd
        "cd; cd Office-Parameters/Routing-and-Translation/Trunk-Group-Bundle;"
      end

      def cd
        "cd #{bundleindex}-TRUNKGROUPBUNDLE;"
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
        cli =  "cd 3-TRUNKGROUP;\n"
        cli << "mod TRUNKGROUP"
      end

      def del
        "del #{sysgrporder}-TRUNKGROUP;"
      end

    end
  end
end
 
