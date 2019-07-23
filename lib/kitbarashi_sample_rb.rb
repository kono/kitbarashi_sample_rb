require "kitbarashi_sample_rb/version"

module KitbarashiSampleRb
  class Error < StandardError; end
  
  class Kitbarashi
    def barashi(item, qty, price)
      h = Hash.new
      h[:item] = item
      h[:qty]  = qty
      h[:price]= price
      [h]
    end
  end
end
