require_solution 'CHK'

describe Checkout do
  it "Read the beginning of a story" do
    expect(Checkout.new.checkout('ABCD')).to eq 115
  end
end

