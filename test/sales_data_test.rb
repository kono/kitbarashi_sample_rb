require "test_helper"

class SalesDataTest < Test::Unit::TestCase 
    test "connect" do
        o=KitbarashiSampleRb::SalesData.new
        o.dbconn
        assert true
    end
end