# noinspection RubyUnusedLocalVariable

require_relative 'store'
require_relative 'sku'
require_relative 'special_offer'

class Checkout
  def initialize()
    @store = Store.new

    @basket = Hash.new { |h, k| h[k] = { total_count: 0, remaining_count: 0, total_price: 0.0 } }
  end

  def checkout(skus)
    return 0 if skus.empty?

    sku_char_array = skus.split('')
    sku_char_array.each do |sku_char|
      store_sku = @store.sku_in_store(sku_char)
      return -1 unless store_sku

      @basket[store_sku][:total_count] += 1
      @basket[store_sku][:remaining_count] += 1
    end
    apply_special_offers
    @basket.keys.each { |sku| finalise_total(sku) }
    @basket.map { |_sku, entry| entry[:total_price] }.reduce(:+).to_int
  end

  private

  def apply_special_offers
    @store.special_offers.sort_by { |offer| offer.discounted_price_per_unit  }.each do |offer|
      next if (@basket.keys & offer.qualifying_skus).empty? && (@basket.keys & offer.applied_skus).empty?

      qualifiers = @basket.select { |sku, entry| offer.qualifying_skus.include?(sku) && entry[:remaining_count] > 0 }
      next if qualifiers.empty?

      qualifiers_quantity = qualifiers.keys.map { |sku| @basket[sku][:remaining_count] }.reduce(:+)
      next unless qualifiers_quantity >= offer.qualifying_quantity

      appliers = @basket.select { |sku, entry| offer.applied_skus.include?(sku) && entry[:remaining_count] > 0 }
      next if appliers.empty?

      appliers_quantity = appliers.keys.map { |sku| @basket[sku][:remaining_count] }.reduce(:+)
      next unless appliers_quantity >= offer.applied_quantity
      
      times_qualified = qualifiers_quantity / offer.required_qualifying_count
      current_appliers_index = 0
      sorted_appliers = appliers.keys.sort_by { |sku| -sku.price }
      times_qualified.times do
        ticker = offer.applied_quantity
        ticker.times do
          @basket[sorted_appliers[current_appliers_index]][:remaining_count] -= 1
          @basket[sorted_appliers[current_appliers_index]][:total_price] += offer.discounted_price_per_unit
          current_appliers_index += 1 if @basket[sorted_appliers[current_appliers_index]][:remaining_count].zero?
        end
      end
    end
  end

  def finalise_total(sku)
    @basket[sku][:total_price] += (@basket[sku][:remaining_count] * sku.price)
    @basket[sku][:remaining_count] = 0
  end
end



