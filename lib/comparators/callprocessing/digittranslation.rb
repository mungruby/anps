
module Comparators
 
  module CallProcessing
 
    module DIGITTRANSLATION

      def candidate_key
        Proc.new do |entry|
          entry.translationgroup == self.translationgroup  and
          entry.nattreeselector == self.nattreeselector and
          entry.digitpattern == self.digitpattern
        end 
      end

    end
  end
end
 
