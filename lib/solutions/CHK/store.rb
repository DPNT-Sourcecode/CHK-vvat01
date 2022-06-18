class Store
  attr_reader :skus, :special_offers

  def initialize(skus = [], special_offers = [])
    @skus = skus
    @special_offers = special_offers
  end

  def sku_in_store(sku_string)
    @skus.find { |sku| sku.name == sku_string }
  end
end
