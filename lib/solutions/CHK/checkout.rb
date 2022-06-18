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
    @total = 0

    # Set up our store
    @store = Store.new
    @store.add_sku(SKU.new('A', 50, SpecialOffer.new(3, 130)))
    @store.add_sku(SKU.new('B', 30, SpecialOffer.new(2, 45)))
    @store.add_sku(SKU.new('C', 20))
    @store.add_sku(SKU.new('D', 15))
  end

  def checkout(skus)
    @store.skus.each do |sku|
      count = skus.scan(/(?=#{sku.name})/).count
      @total += sku.total_price(count) unless count.zero?
    end
  end
  @total
end

def SKU
  attr_reader :name

  def initialize(name, price, special_offer = nil)
    @name = name
    @price = price
    @special_offer = special_offer
    @count = 0
  end

  def total_price(count)
    return (count * price) if @special_offer.nil?

    
  end
end

def SpecialOffer
  def initialize(quantity, total_price)
    @quantity = quantity
    @total_price = total_price
  end
end

