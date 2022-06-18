require_solution 'CHK'

describe Checkout do
  it "Calculates the total checkout value of the items" do
    expect(Checkout.new.checkout('ABCD')).to eq 115
  end

  it "Returns 0 for empty input" do
    expect(Checkout.new.checkout('')).to eq 0
  end

  it "Returns -1 for unexpected characters in input" do
    expect(Checkout.new.checkout('A,B-C/D')).to eq -1
  end

  it "Factors in special offers" do
    expect(Checkout.new.checkout('ABACADB')).to eq 210
  end

  it "Handles multiple occurences of a special offer" do
    expect(Checkout.new.checkout('ABACADBAAAAAAAA')).to eq 570
  end
end
