# noinspection RubyUnusedLocalVariable
class Checkout
  def initialise(items = {A: 50, B: 30, C: 20, D: 15}, offers = {A: {quantity: 3, total_price: 130}, B: {quantity: 2, total_price: 45}})
    @items = items
    @offers = offers
  end

  def checkout(skus)
    total = 0
    @items.each do |key, value|
      count = skus.scan(/(?=#{keu})/).count
      if offers[key] && (count > offers[key][quantity])
        total += offers[key][total_price]
      else
        total += (value * count)
      end
    end
    total
  end

end


