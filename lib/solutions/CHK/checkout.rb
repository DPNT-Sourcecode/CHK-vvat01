# noinspection RubyUnusedLocalVariable

require_relative 'store'
require_relative 'sku'
require_relative 'special_offer'

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
