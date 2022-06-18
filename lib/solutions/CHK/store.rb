class Store
  attr_reader :skus

  def initialize(skus = [])
    @skus = skus
  end

  def add_sku(sku)
    @skus.push(sku)
  end

  def sku_in_store?(sku_string)
    @skus.any { |sku| sku.name == sku_string }
  end
end