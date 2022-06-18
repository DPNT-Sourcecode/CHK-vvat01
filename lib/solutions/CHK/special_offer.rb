class SpecialOffer
  attr_reader :quantity, :total_price
  
  def initialize(quantity, total_price)
    @quantity = quantity
    @total_price = total_price
  end
end