class SKU
  attr_reader :name, :price, :count

  def initialize(name, price, special_offer = nil)
    @name = name
    @price = price
    @special_offer = special_offer
    @count = 0
  end

  def increment_count
    @count += 1
  end

  def total_price
    return (@count * @price) if @special_offer.nil?

    discounted_total = (@count / @special_offer.quantity) * @special_offer.total_price
    regular_total = (@count % @special_offer.quantity) * @price
    discounted_total + regular_total
  end
end