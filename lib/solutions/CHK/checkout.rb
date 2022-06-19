# noinspection RubyUnusedLocalVariable

require_relative 'store'
require_relative 'sku'
require_relative 'special_offer'

class Checkout
  def initialize()
    @store = Store.new

    @basket = Hash.new { |h, k| h[k] = { total_count: 0, remaining_count: 0, total_price: 0 } }
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
    @basket.map { |_sku, entry| entry[:total_price] }.reduce(:+)
  end

  private

  def apply_special_offers
    @store.special_offers.each do |offer|
      next if (@basket.keys & offer.qualifying_skus & offer.applied_skus).empty?

      qualifiers = @basket.select { |sku, entry| offer.qualifying_skus.include?(sku) && entry[:remaining_count] > 0 }
      qualifiers_quantity = qualifiers.keys.map { |sku| @basket[sku][:remaining_count] }.reduce(:+)
      next unless qualifiers_quantity > offer.qualifying_quantity

      appliers = @basket.select { |sku, entry| offer.applied_skus.include?(sku) && entry[:remaining_count] > 0 }
      applyiers_quantity = appliers.keys.map { |sku| @basket[sku][:remaining_count] }.reduce(:+)
      next unless applyiers_quantity > offer.applied_quantity
      
      
      times_qualified = applyiers_quantity / offer.applied_quantity
      times_qualified.times do
        ticker = offer.applied_quantity
        current_appliers_index = 0
        ticker.times do
          @basket[appliers[current_appliers_index]][:remaining_count] -= 1
          @basket[appliers[current_appliers_index]][:total_price] += offer.discounted_price_per_unit
          current_appliers_index += 1 if @basket[appliers[current_appliers_index]][:remaining_count].zero?
        end
      end
    end
  end

  def finalise_total(sku)
    if sku.nil?
      byebug
    end
    @basket[sku][:total_price] += (@basket[sku][:remaining_count] * sku.price)
    @basket[sku][:remaining_count] = 0
  end

  def calculate_total(sku)
    total = 0

    filtered_and_sorted_offers(sku, count).each do |offer|
      if offer.qualifying_skus.count == 1
        times_qualified = @basket[offer.qualifying_skus.first][:count] / offer.qualifying_quantity
        times_qualified.times do
          if @remaining_counts[sku][] >= offer.applied_quantity
            total += offer.applied_total_price
            remaining_count -= offer.applied_quantity
          end
        end
      else

      end
      
    end
    total + (remaining_count * sku.price)
  end

  def filtered_and_sorted_offers(sku, count)
    @store.special_offers.select do |offer|
      !(@basket.keys & offer.qualifying_skus).empty? &&
      offer.applied_skus.include?(sku) &&
      count >= offer.applied_quantity &&
      @basket[offer.qualifying_skus.first][:count] >= offer.qualifying_quantity
    end.sort_by { |offer| offer.discounted_price_per_unit  }
  end
end

