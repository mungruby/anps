
module CLI
 
  module CallProcessing  
 
    module NPANXX 

      def cd
        "cd; cd Office-Parameters/Network-Parameters/LATAs/#{latanumber}-LATA;"
      end

      def query
        "query #{npa_nxx}-NPANXX;"
      end

      def add
        cli = "add NPANXX NPA_NXX_X=#{npa_nxx}, Description=#{description};"
      end

      def mod
        "cd #{npa_nxx}-NPANXX;\nmod NPANXX "
      end

      def del
        "del #{npa_nxx}-NPANXX;"
      end

    end
  end
end
 
