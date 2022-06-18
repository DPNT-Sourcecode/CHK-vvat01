require_solution 'CHK'

describe Checkout do
  it "Calculates the total checkout value of the items" do
    expect(Checkout.new.checkout('ABCDE')).to eq 155
  end

  it "Returns 0 for empty input" do
    expect(Checkout.new.checkout('')).to eq 0
  end

  it "Returns -1 for unexpected characters in input" do
    expect(Checkout.new.checkout('A,B-C/Dx')).to eq -1
  end

  it "Returns -1 for a sku name not in store" do
    expect(Checkout.new.checkout('AxB')).to eq -1
  end

  it "Factors in special offers" do
    expect(Checkout.new.checkout('ABACADB')).to eq 210
  end

  it "Handles multiple occurences of a special offer" do
    expect(Checkout.new.checkout('ABACADBAAAAAAAA')).to eq 530
  end

  it "Handles multiple special offers for same sku" do
    expect(Checkout.new.checkout('AAAAABAAAAACAAADA')).to eq 645
  end

  it "Handles special offers applied to other skus" do
    expect(Checkout.new.checkout('EEEBB')).to eq 150
  end

  it "Handles special offers applied to other skus where other sku quantity not present" do
    expect(Checkout.new.checkout('EEE')).to eq 120
  end

  it "Handles special offers with different applied quantity on same sku" do
    expect(Checkout.new.checkout('FFFFFFFF')).to eq 60
  end

  it "Handles all skus" do
    expect(Checkout.new.checkout('ABCDEFGHIJKLMNOPQRSTUVWXYZ')).to eq 965
  end

  it "Handles offers with large quantities" do
    expect(Checkout.new.checkout('HHHHHKHHHHHKHHHHHKHH')).to eq 455
  end

  it "Handles complex offers across various skus" do
    expect(Checkout.new.checkout('HHHHHKHHHHHKHHHHHKHHNMNMPPPPPPQQQRRRUUUUUVVVVV')).to eq 1350
  end
end





