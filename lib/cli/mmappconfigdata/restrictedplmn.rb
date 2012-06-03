
module CLI
 
  module MMAppConfigData 
 
    module RESTRICTEDPLMN  

      def self.cd
        "cd; cd Office-Parameters/Mobility-Config-Parameters/Restricted-PLMN;"
      end

      def cd
        # field conversions
        mcc = convert_binary_mcc
        mnc = convert_binary_mnc

        "cd #{restriction_list}-#{mcc}-#{mnc}-RESTRICTEDPLMN;"
      end

      def query
        # field conversions
        mcc = convert_binary_mcc
        mnc = convert_binary_mnc

        "query #{restriction_list}-#{mcc}-#{mnc}-RESTRICTEDPLMN;"
      end

      def add
        # field conversions
        mcc = convert_binary_mcc
        mnc = convert_binary_mnc
        description = convert_char_description

        cli =  "add RESTRICTEDPLMN Restriction_List_Id=#{restriction_list}, "
        cli << "Mobile_Country_Code=#{mcc}, "
        cli << "Mobile_Network_Code=#{mnc}, "
        cli << "Description=#{description};"
      end

      def mod
        cli =  "mod RESTRICTEDPLMN "
      end

      def del
        # field conversions
        mcc = convert_binary_mcc
        mnc = convert_binary_mnc

        "del #{restriction_list}-#{mcc}-#{mnc}-RESTRICTEDPLMN;"
      end

      #
      # field conversions
      #

      def convert_char_description
        self.description.rstrip
      end

      def convert_binary_mcc
        idx = 0
        digits = []
        self.mcc.slice(1..6).each_char do |ch|
          digits << ch unless idx % 2 == 0
          idx += 1
        end
        digits.join.delete 'f'
      end

      def convert_binary_mnc
        idx = 0
        digits = []
        self.mnc.slice(1..6).each_char do |ch|
          digits << ch unless idx % 2 == 0
          idx += 1
        end
        digits.join.delete 'f'
      end

    end
  end
end
 
