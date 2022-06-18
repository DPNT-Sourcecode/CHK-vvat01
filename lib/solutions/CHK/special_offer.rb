class SpecialOffer
  attr_reader :qualifying_sku, :qualifying_quantity, :applied_total_price, :applied_sku

  def initialize(qualifying_sku, qualifying_quantity, applied_total_price, applied_sku = nil)
    @qualifying_sku = qualifying_sku
    @qualifying_quantity = qualifying_quantity
    @applied_total_price = applied_total_price
    @applied_sku = applied_sku || @qualifying_sku
  end
end