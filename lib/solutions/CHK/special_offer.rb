class SpecialOffer
  attr_reader :qualifying_sku, :qualifying_quantity, :applied_total_price, :applied_sku, :applied_quantity

  def initialize(qualifying_sku, qualifying_quantity, applied_total_price, applied_sku = nil, applied_quantity = nil)
    @qualifying_sku = qualifying_sku
    @qualifying_quantity = qualifying_quantity
    @applied_total_price = applied_total_price
    @applied_sku = applied_sku || @qualifying_sku
    @applied_quantity = applied_quantity || @qualifying_quantity
  end
end
