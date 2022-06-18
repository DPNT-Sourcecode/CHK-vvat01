# noinspection RubyUnusedLocalVariable

require_relative 'store'
require_relative 'sku'
require_relative 'special_offer'

class Checkout
  def initialize()
    @store = Store.new

    @basket = Hash.new { |h, k| h[k] = { count: 0 } }
  end

  def checkout(skus)
    return 0 if skus.empty?

    sku_char_array = skus.split('')
    sku_char_array.each do |sku_char|
      store_sku = @store.sku_in_store(sku_char)
      return -1 unless store_sku

      @basket[store_sku][:count] += 1
    end
    @basket.map { |sku, entry| calculate_total(sku, entry[:count]) }.reduce(:+)
  end

  private

  def calculate_total(sku, count)
    total = 0
    remaining_count = count

    filtered_and_sorted_offers(sku, count).each do |offer|
      times_qualified = @basket[offer.qualifying_sku][:count] / offer.qualifying_quantity
      times_qualified.times do
        if remaining_count >= offer.applied_quantity
          total += offer.applied_total_price
          remaining_count -= offer.applied_quantity
        end
      end
    end
    total + (remaining_count * sku.price)
  end

  def filtered_and_sorted_offers(sku, count)
    @store.special_offers.select do |offer|
      @basket.key?(offer.qualifying_sku) &&
      offer.applied_sku == sku &&
      count >= offer.applied_quantity &&
      @basket[offer.qualifying_sku][:count] >= offer.qualifying_quantity
    end.sort_by { |offer| offer.discounted_price_per_unit  }
  end
end

