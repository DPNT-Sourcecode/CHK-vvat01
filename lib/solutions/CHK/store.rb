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
    g = SKU.new('G', 20)
    h = SKU.new('H', 10)
    i = SKU.new('I', 35)
    j = SKU.new('J', 60)
    k = SKU.new('K', 80)
    l = SKU.new('L', 90)
    m = SKU.new('M', 15)
    n = SKU.new('N', 40)
    o = SKU.new('O', 10)
    p = SKU.new('P', 50)
    q = SKU.new('Q', 30)
    r = SKU.new('R', 50)
    s = SKU.new('S', 30)
    t = SKU.new('T', 20)
    u = SKU.new('U', 40)
    v = SKU.new('V', 50)
    w = SKU.new('W', 20)
    x = SKU.new('X', 90)
    y = SKU.new('Y', 10)
    z = SKU.new('Z', 50)

    s1 = SpecialOffer.new(a, 3, 130)
    s2 = SpecialOffer.new(a, 5, 200)
    s3 = SpecialOffer.new(b, 2, 45)
    s4 = SpecialOffer.new(e, 2, 0, b, 1)
    s5 = SpecialOffer.new(f, 2, 20, f, 3)

    @skus = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z]
    @special_offers = [s1, s2, s3, s4, s5]
  end

  def sku_in_store(sku_string)
    @skus.find { |sku| sku.name == sku_string }
  end
end