class SpecialOffer
  attr_reader :quantity, :deduction_per_item

  def initialize(quantity, deduction_per_item, applied_to_other_sku = nil)
    @quantity = quantity
    @deduction_per_item = deduction_per_item
  end
end