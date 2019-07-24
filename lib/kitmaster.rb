module KitbarashiSampleRb
    class Kitmaster
        def self.kitprice
            [
            {:kitcode=>2, :price_ar=>[120,110,100,0]},
            {:kitcode=>9, :price_ar=>[200,230,250,210]},
            ]
        end
        def self.kittable
            [
            {:kitcode=>2, :linecode=>10, :qty=>1, :price_ar=>[40,30,30,0]},
            {:kitcode=>2, :linecode=>11, :qty=>2, :price_ar=>[20,20,20,0]},
            {:kitcode=>2, :linecode=>12, :qty=>1, :price_ar=>[40,40,30,0]},
            {:kitcode=>9, :linecode=>91, :qty=>1, :price_ar=>[120,130,140,120]},
            {:kitcode=>9, :linecode=>92, :qty=>1, :price_ar=>[80,100,110,90]},
            ]
        end
      
    end
end
