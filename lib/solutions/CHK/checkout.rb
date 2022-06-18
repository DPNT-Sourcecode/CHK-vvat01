# noinspection RubyUnusedLocalVariable

require_relative 'store'
require_relative 'sku'
require_relative 'special_offer'

class Checkout
  def initialize()
    @store = Store.new

    @basket = Hash.new { |h, k| h[k] = { count: 0, discounts: 0 } }
  end

  def checkout(skus)
    return 0 if skus.empty?

    sku_char_array = skus.split('')
    sku_char_array.each do |sku_char|
      store_sku = @store.sku_in_store(sku_char)
      return -1 unless store_sku

      @basket[store_sku][:count] += 1
    end
    @basket.each { |sku, entry| calculate_discounts(sku, entry[:count]) }
    process_offers
    @store.skus.reject { |sku| sku.count.zero? }.map { |sku| sku.total_price }.reduce(:+)
  end

  def calculate_discounts(sku, count)
    @store.special_offers.each do |offer|
      if offer.applied_sku == sku && count >= offer.applied_quantity
        if @basket[offer.qualifying_sku][:count] >= offer.qualifying_quantity
          @basket[offer.qualifying_sku][:count] / offer.qualifying_quantity
        end
      end
      

      end
        total += (count / offer.applied_quantity) * @special_offer.total_price
        if  && count >= offer.qualifying_quantity && count >= offer.applied_quantity

        else

      end
    end
    total + (remaining_count * sku.price)
  end
end

discounted_total = (@count / @special_offer.quantity) * @special_offer.total_price
    regular_total = (@count % @special_offer.quantity) * @price
    discounted_total + regular_total
