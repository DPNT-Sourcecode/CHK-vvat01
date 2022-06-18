# noinspection RubyUnusedLocalVariable
class Checkout
  def initialise(items, offers)
  end

  def checkout(skus)
    stripped_skus = skus.sub /[^A-Z]/, ''
  end

end

