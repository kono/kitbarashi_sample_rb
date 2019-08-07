require "test_helper"

class SalesDataTest < Test::Unit::TestCase 
    test "connect" do
        o=KitbarashiSampleRb::SalesData.new
        o.dbconn
        assert true
    end
    test "select" do
        o = KitbarashiSampleRb::SalesData.new
        o.dbconn
        assert_equal(1, o.count_sales_data)

    end
end