require 'sequel'
require 'sqlite3'

module KitbarashiSampleRb
    class SalesData
        def dbconn
            @con = Sequel.sqlite('db/salesdata.db')
        end
    end
end