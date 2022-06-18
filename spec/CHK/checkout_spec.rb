require_solution 'CHK'

describe Checkout do
  it "Calculates the total checkout value of the items" do
    expect(Checkout.new.checkout('ABCD')).to eq 115
  end

  it "Ignores unexpected characters in input" do
    expect(Checkout.new.checkout('A,B-C/D')).to eq 115
  end

  it "Factors in special offers" do
    expect(Checkout.new.checkout('ABACADB')).to eq 210
  end
end

