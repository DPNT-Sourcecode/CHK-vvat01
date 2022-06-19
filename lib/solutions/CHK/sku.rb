class SKU
  attr_reader :name, :price, :count

  def initialize(name, price)
    @name = name
    @price = price.to_f
  end
end
