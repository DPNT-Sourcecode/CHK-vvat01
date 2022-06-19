class SpecialOffer
  attr_reader :qualifying_skus, :qualifying_quantity, :applied_total_price, :applied_sku, :applied_quantity

  def initialize(qualifying_skus, qualifying_quantity, applied_total_price, applied_sku = nil, applied_quantity = nil)
    @qualifying_skus = qualifying_skus
    @qualifying_quantity = qualifying_quantity
    @applied_total_price = applied_total_price
    @applied_sku = applied_sku || @qualifying_sku
    @applied_quantity = applied_quantity || @qualifying_quantity
  end

  def discounted_price_per_unit
    @applied_total_price / @applied_quantity
  end
end
