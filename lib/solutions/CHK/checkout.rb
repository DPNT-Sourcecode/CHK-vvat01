# noinspection RubyUnusedLocalVariable
class Store
  attr_reader :skus

  def initialize(skus = [])
    @skus = skus
  end

  def add_sku(sku)
    @skus.append(sku)
  end
end

class Checkout
  def initialize()
    # Set up our store
    @store = Store.new
    @store.add_sku(SKU.new('A', 50, SpecialOffer.new(3, 130)))
    @store.add_sku(SKU.new('B', 30, SpecialOffer.new(2, 45)))
    @store.add_sku(SKU.new('C', 20))
    @store.add_sku(SKU.new('D', 15))
  end

  def checkout(skus)
    total = 0
    @store.skus.each do |sku|
      count = skus.scan(/(?=#{sku.name})/).count || 0
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
  attr_reader :name

  def initialize(name, price, special_offers = [])
    @name = name
    @price = price
    @special_offers = special_offers
    @count = 0
  end

  def increment_count
    @count += 1
  end
end

def SpecialOffer
  def initialize(quantity, total_price)
    @quantity = quantity
    @total_price = total_price
  end
end
