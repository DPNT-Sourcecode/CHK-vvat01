# noinspection RubyUnusedLocalVariable
class Checkout
  def initialise(items = {A: 50, B: 30, C: 20, D: 15}, offers = {A: {quantity: 3, total_price: 130}, B: {quantity: 2, total_price: 45}})
    @items = items
    @offers = offers
  end

  def checkout(skus)
    skus.gsub! /[^A-Z]/, ''

  end

end

