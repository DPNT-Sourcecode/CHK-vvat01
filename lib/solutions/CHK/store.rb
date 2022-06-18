require_relative 'sku'
require_relative 'special_offer'

class Store
  attr_reader :skus, :special_offers

  def initialize()
    # Set up our store
    a = SKU.new('A', 50)
    b = SKU.new('B', 30)
    c = SKU.new('C', 20)
    d = SKU.new('D', 15)
    e = SKU.new('E', 40)
    f = SKU.new('F', 10)
    s1 = SpecialOffer.new(a, 3, 130)
    s2 = SpecialOffer.new(a, 5, 200)
    s3 = SpecialOffer.new(b, 2, 45)
    s4 = SpecialOffer.new(e, 2, 0, b, 1)
    s5 = SpecialOffer.new(f, 2, 0, f, 1)

    @skus = [a, b, c, d, e, f]
    @special_offers = [s1, s2, s3, s4, s5]
  end

  def sku_in_store(sku_string)
    @skus.find { |sku| sku.name == sku_string }
  end
end
