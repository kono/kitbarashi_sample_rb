require "kitbarashi_sample_rb/version"
require "kitmaster"

module KitbarashiSampleRb
  class Error < StandardError; end
  
  class Kitbarashi
    def initialize
      @kitprice = Kitmaster.kitprice
      @kittable = Kitmaster.kittable
    end

    def barashi_sub(kitcode, qty, price_position, ratio, result)
      @kittable.select{|item| item[:kitcode]==kitcode}.each{|i|
        e={}
        e[:product]=i[:linecode]
        e[:qty]=i[:qty] * qty
        e[:price]= (i[:price_ar][price_position] * ratio).round
        result << e
      }
      result
    end

    def get_ratio(kit, price)
      price.to_f / kit[:price_ar][0].to_f
    end

    def barashi(item, qty, price)
      result = []
      kit=@kitprice.find{|kit| kit[:kitcode]==item}
      unless kit.nil?  # kitの場合
        price_position = kit[:price_ar].index(price)
        if price_position.nil?
          ratio = get_ratio(kit, price)
          price_position = 0
        else
          ratio = 1
        end
        barashi_sub(item, qty, price_position, ratio, result)
      else             # kitでない場合
        h = Hash.new
        h[:item] = item
        h[:qty]  = qty
        h[:price]= price
        result.push h
      end
    end

  end
end
