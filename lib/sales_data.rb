require 'sequel'
require 'sqlite3'

module KitbarashiSampleRb
    class SalesData
        def dbconn
            @con = Sequel.sqlite('db/salesdata.db')
        end
        def count_sales_data
            r = @con['select count(*) as cnt from salesdata'].all
            r[0][:cnt]
        end
    end
end