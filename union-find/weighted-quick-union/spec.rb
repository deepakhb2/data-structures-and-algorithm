require_relative './solution.rb'

RSpec.describe WeightedQU do
  let(:wquick_union) { WeightedQU.new(10)}

  it "Test the values assigned" do
    expect(wquick_union.size).to eq(10)
    expect(wquick_union.values.size).to eq(10)
    expect(wquick_union.sizes.size).to eq(10)
  end

  it "Check if two elements are connected" do
    expect(wquick_union.connected(0, 1)).to eq(false)
  end

  it "Test the algorithm" do
    wquick_union.union(4, 3)
    expect(wquick_union.values).to eq([0, 1, 2, 4, 4, 5, 6, 7, 8, 9])
    wquick_union.union(9, 8)
    expect(wquick_union.values).to eq([0, 1, 2, 4, 4, 5, 6, 7, 9, 9])
    wquick_union.union(9, 7)
    expect(wquick_union.values).to eq([0, 1, 2, 4, 4, 5, 6, 9, 9, 9])
    wquick_union.union(3, 7)
    expect(wquick_union.values).to eq([0, 1, 2, 4, 9, 5, 6, 9, 9, 9])
    wquick_union.union(6, 7)
    expect(wquick_union.values).to eq([0, 1, 2, 4, 9, 5, 9, 9, 9, 9])

    expect(wquick_union.sizes[9]).to eq(6)
  end

  it "Get the root element of an element" do
    wquick_union.union(6, 7)
    expect(wquick_union.root(7)).to eq(6)
  end

  it "Check if two elements are connected" do
    wquick_union.union(0, 1)
    wquick_union.union(1, 2)
    wquick_union.union(2, 3)
    expect(wquick_union.connected(0, 3)).to eq(true)
  end
end