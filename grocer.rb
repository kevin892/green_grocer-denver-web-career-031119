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
    clearance_cart = {}
    cart.each do |food, info|
      clearance_cart[food] = {}
      if info[:clearance] == true
        clearance_cart[food][:price] = info[:price] * 4 / 5
      else
        clearance_cart[food][:price] = info[:price]
      end
      clearance_cart[food][:clearance] = info[:clearance]
      clearance_cart[food][:count] = info[:count]
    end
  end
    clearance_cart
  end

  def checkout(cart, coupons)
 cart = consolidate_cart(cart: cart)
  end 	  cart = apply_coupons(cart: cart, coupons: coupons)
    cart = apply_clearance(cart: cart)
    result = 0
    cart.each do |food, info|
      result += (info[:price] * info[:count]).to_f
    end
    e d
    result > 100 ? result * 0.9 : result
  end
