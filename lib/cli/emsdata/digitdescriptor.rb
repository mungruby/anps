
module CLI
 
  module EmsData
 
    module DIGITDESCRIPTOR

      def cd
        "cd; cd Office-Parameters/Routing-and-Translation" +
          "/Routing/Orig-Routing/Orig-Route-Descriptor;"
      end

      def query
        "query #{descriptorindex}-DIGITDESCRIPTOR;"
      end

      def add
        cli = "add DIGITDESCRIPTOR Index=#{descriptorindex}, Name=#{descriptor};"
      end

      def mod
        cli =  "cd #{descriptorindex}-DIGITDESCRIPTOR;\n"
        cli << "mod DIGITDESCRIPTOR "
      end

      def del
        "del #{descriptorindex}-DIGITDESCRIPTOR;"
      end

    end
  end
end
 
