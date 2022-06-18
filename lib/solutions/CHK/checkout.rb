# noinspection RubyUnusedLocalVariable
class Store
  def initialize(skus = [], special_offers = [])
    @skus = skus
    @special_offers = special_offers
  end

  def add_sku(sku)
    @skus.append(sku)
  end

  def add_special_offer(special_offer)
    @special_offers.append(special_offer)
  end
end

class Checkout
  def initialize(items = {A: 50, B: 30, C: 20, D: 15}, special_offers = {A: {quantity: 3, total_price: 130}, B: {quantity: 2, total_price: 45}})
    @items = items
    @offers = offers
  end

  def checkout(skus)
    total = 0
    @items.each do |key, value|
      count = skus.scan(/(?=#{key})/).count || 0
      if @offers[key] && (count > @offers[key]['quantity'])
        total += offers[key][total_price]
      else
        total += (value * count)
      end
    end
    total
  end
end

def SKU
  def initialize(name, price)
    @name = name
    @price = price
    @count = 0
  end

  def increment_count
    @count += 1
  end
end

def SpecialOffer
  def initialize(sku, quantity, total_price)
    @sku = sku
    @quantity = quantity
    @total_price = total_price
  end
end
