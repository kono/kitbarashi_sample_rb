require "kitbarashi_sample_rb/version"
require "kitmaster"

module KitbarashiSampleRb
  class Error < StandardError; end
  
  class Kitbarashi
    def initialize
      @kitprice = Kitmaster.kitprice
      @kittable = Kitmaster.kittable
    end

    def barashi(item, qty, price)
      result = []
      kit=@kitprice.find{|kit| kit[:kitcode]==item}
      unless kit.nil?
        barashi_sub(item, qty, price, result)
      else
        h = Hash.new
        h[:item] = item
        h[:qty]  = qty
        h[:price]= price
        result.push h
      end
    end

  end
end
