require "pry"

def consolidate_cart(cart)
  hash = {}
  cart.each do |a|
    a.each do |item, info|
      hash[item] ||= info
      hash[item][:count] ||= 0
      hash[item][:count] += 1
      end
    end
    hash
  end

  def apply_coupons(cart, coupons)
    result = {}
    cart.each do |food, info|
      coupons.each do |coupon|
        if food == coupon[:item] && info[:count] >= coupon[:num]
          info[:count] =  info[:count] - coupon[:num]
          if result["#{food} W/COUPON"]
            result["#{food} W/COUPON"][:count] += 1
          else
            result["#{food} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
          end
        end
      end
      result[food] = info
    end
    result
  end


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
