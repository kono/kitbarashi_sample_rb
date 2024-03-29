require "test_helper"

class KitbarashiSampleRbTest < Test::Unit::TestCase 
  def test_that_it_has_a_version_number
    refute_nil ::KitbarashiSampleRb::VERSION
  end

  data(
    "kittable なし"=> [[{:item=>1, :qty=>2, :price=>100}], 
                        1,2,100],
      "kittable 1番目単価" => [[{:product=>10, :qty=>1, :price=>40}, 
                          {:product=>11, :qty=>2, :price=>20}, 
                          {:product=>12, :qty=>1, :price=>40}],
                         2,1,120],
      "kittable 2番目単価" => [[{:product=>10, :qty=>2, :price=>30}, 
                          {:product=>11, :qty=>4, :price=>20},
                          {:product=>12, :qty=>2, :price=>40}],
                          2,2,110],
      "kittable 該当単価なし" => [[{:product=>10, :qty=>1, :price=>13},
                          {:product=>11, :qty=>2, :price=>7},
                          {:product=>12, :qty=>1, :price=>13}],
                        2, 1, 40],
      "kittable 該当単価なし2" => [[{:product=>91, :qty=>1, :price=>107},
                          {:product=>92, :qty=>1, :price=>71}],
                        9,1, 178]
                          
  )
  test "kit" do |(expected, item,qty,price)|
    o = KitbarashiSampleRb::Kitbarashi.new
    assert_equal(expected,o.barashi(item,qty,price))
  end
  
end
