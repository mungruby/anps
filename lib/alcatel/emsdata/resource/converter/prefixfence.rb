
module Alcatel
  module EmsData
    module Resource
      module PREFIXFENCE
      
        module Converter

          def convert_fields
            self.digitpattern = convert_char_digitpattern
            self.description = convert_char_description
            self.df.leadingdigitsadd = convert_char_leadingdigitsadd
            self.df.carrierid = convert_char_carrierid
            self.df.countrycode = convert_char_countrycode
            self.df.cpc = convert_tinyint_cpc
            self.digitfenceindex = convert_integer_digitfenceindex
            self.df.digitfenceindex = convert_integer_digitfenceindex
            self.ccd.digitfenceindex = convert_integer_digitfenceindex if self.ccd
            self
          end

          def convert_char_digitpattern
            digitpattern.rstrip
          end

          def convert_char_description
            description.rstrip
          end

          def convert_char_leadingdigitsadd
            df.leadingdigitsadd.rstrip
          end

          def convert_char_carrierid
            cid = df.carrierid.rstrip
            cid.empty? ? '""' : df.carrierid
          end

          def convert_char_countrycode
            cc = df.countrycode.rstrip
            cc.empty? ? '""' : df.countrycode
          end

          def convert_tinyint_cpc
            case df.cpc
              when 0 then 'Unknown'
              when 255 then 'Do Not Overwrite'
            else
              raise "Unexpected value: digitFence_CPC=#{df.cpc}"
            end
          end

          def convert_integer_digitfenceindex
            nil
          end

        end
      end
    end
  end
end
 
