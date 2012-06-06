
module CLI
 
  module CallProcessing  
 
    module LRNLIST

      def cd
        "cd; cd Office-Parameters/Network-Parameters/1-LRNLISTKEY;"
      end

      def query
        "query #{lrn}-LRNLIST;"
      end

      def add
        cli = "add LRNLIST LRN=#{lrn}, HLR_Number=#{hlr_num};"
      end

      def mod
        cli = "mod LRNLIST "
      end

      def del
        "del #{lrn}-LRNLIST;"
      end

    end
  end
end
 
