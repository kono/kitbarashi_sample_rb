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
      h = Hash.new
      h[:item] = item
      h[:qty]  = qty
      h[:price]= price
      [h]
    end
  end
end
