
module Comparators
 
  module MMAppConfigData
 
    module DIGITPREFIX

      def candidate_key
        lambda { |other| self.digitprefix == other.digitprefix }
      end

    end
  end
end
 
