class Store
  attr_reader :skus

  def initialize(skus = [])
    @skus = skus
  end

  def add_sku(sku)
    @skus.push(sku)
  end

  def valid_checkout(skus_string)
    store_skus_regex = /#{@skus.map { |sku| sku.name }.join('')}/
    skus_string.match(store_skus_regex)
  end
end