# noinspection RubyUnusedLocalVariable
class Checkout
  def initialise(items, offers)
  end

  def checkout(skus)
    stripped_skus = skus.gsub /[^A-Z]/, ''
  end

end
