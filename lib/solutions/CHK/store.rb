class Store
  attr_reader :skus

  def initialize(skus = [])
    @skus = skus
  end

  def add_sku(sku)
    @skus.append(sku)
  end
end