# noinspection RubyUnusedLocalVariable

require_relative 'store'
require_relative 'sku'
require_relative 'special_offer'

class Checkout
  def initialize()
    # Set up our store
    a = SKU.new('A', 50)
    b = SKU.new('B', 30)
    c = SKU.new('C', 20)
    d = SKU.new('D', 15)
    e = SKU.new('E', 40)
    s1 = SpecialOffer.new(a, 3, 130)
    s2 = SpecialOffer.new(a, 5, 200)
    s3 = SpecialOffer.new(b, 2, 45)
    s4 = SpecialOffer.new(e, 2, 0, b, 1)

    @store = Store.new([a, b, c, d, e], [s1, s2, s3, s4])

    @basket = @store.skus.map{ |sku| [sku.name, 0] }.to_h
  end

  def checkout(skus)
    return 0 if skus.empty?

    sku_char_array = skus.split('')
    sku_char_array.each do |sku_char|
      store_sku = @store.sku_in_store(sku_char)
      return -1 unless store_sku

      store_sku.increment_count
    end
    @store.skus.reject { |sku| sku.count.zero? }.map { |sku| sku.total_price }.reduce(:+)
  end
end

