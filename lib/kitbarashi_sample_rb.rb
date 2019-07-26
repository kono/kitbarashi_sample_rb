require "kitbarashi_sample_rb/version"
require "kitmaster"

module KitbarashiSampleRb
  class Error < StandardError; end
  
  class Kitbarashi
    def initialize
      @kitprice = Kitmaster.kitprice
      @kittable = Kitmaster.kittable
    end

    def barashi_sub(kitcode, qty, price_position, result)
      @kittable.select{|item| item[:kitcode]==kitcode}.each{|i|
        e={}
        e[:product]=i[:linecode]
        e[:qty]=i[:qty] * qty
        e[:price]= i[:price_ar][price_position]
        result << e
      }
      result
    end

    def barashi(item, qty, price)
      result = []
      kit=@kitprice.find{|kit| kit[:kitcode]==item}
      unless kit.nil?  # kitの場合
        price_position = kit[:price_ar].index(price)
        barashi_sub(item, qty, price_position, result)
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
