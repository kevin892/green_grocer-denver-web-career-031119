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
    coupon_hash = {}
    cart.each do |item, info|
      coupons.each do |coupon|
        if item == coupon[:item] && info[:count] >= coupon[:num]
          info[:count] -= coupon[:num]
          if coupon_hash["#{item} W/COUPON"]
            coupon_hash["#{item} W/COUPON"][:count] += 1
          else
            coupon_hash["#{item} W/COUPON"] = {:price => coupon[:cost], :clearance => info[:clearance], :count => 1}
          end
        end
      end
      coupon_hash[item] = info
    end
    coupon_hash
  end


  def apply_clearance(cart)
    discount = 0.20
    cart.each do |item, details|
      if item[:clearance] == true
        item[:price] = (item[:price]*discount).round(2)
      end
    end
    cart
  end

def checkout(cart, coupons)
  # code here
end
