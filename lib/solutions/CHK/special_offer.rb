class SpecialOffer
  attr_reader :qualifying_skus, :qualifying_quantity, :applied_total_price, :applied_skus, :applied_quantity

  def initialize(qualifying_skus, qualifying_quantity, applied_total_price, applied_skus = nil, applied_quantity = nil)
    @qualifying_skus = qualifying_skus
    @qualifying_quantity = qualifying_quantity
    @applied_total_price = applied_total_price.to_f
    @applied_skus = applied_skus || @qualifying_skus
    @applied_quantity = applied_quantity || @qualifying_quantity
  end

  def discounted_price_per_unit
    @applied_total_price / @applied_quantity
  end

  def required_qualifying_count
    if @qualifying_skus == @applied_skus && @applied_quantity > @qualifying_quantity
      @applied_quantity
    else
      @qualifying_quantity
    end
  end
end