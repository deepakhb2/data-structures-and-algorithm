require_relative './quick_union'

RSpec.describe QuickUnion do
  let(:quick_union) { QuickUnion.new(10) }

  it "Create array with values assigned to its index" do
    expect(quick_union.size).to eq(10)
    expect(quick_union.values.size).to eq(10)
  end

  it "Check if two elements are connected" do
    expect(quick_union.connected(0, 1)).to eq(false)
  end

  it "Test the algorithm" do
    quick_union.union(4, 3)
    expect(quick_union.values).to eq([0, 1, 2, 4, 4, 5, 6, 7, 8, 9])
    quick_union.union(9, 8)
    expect(quick_union.values).to eq([0, 1, 2, 4, 4, 5, 6, 7, 9, 9])
    quick_union.union(9, 7)
    expect(quick_union.values).to eq([0, 1, 2, 4, 4, 5, 6, 9, 9, 9])
    quick_union.union(0, 1)
    expect(quick_union.values).to eq([0, 0, 2, 4, 4, 5, 6, 9, 9, 9])
    quick_union.union(6, 7)
    expect(quick_union.values).to eq([0, 0, 2, 4, 4, 5, 6, 9, 9, 6])
  end

  it "Get the root element of an element" do
    quick_union.union(6, 7)
    expect(quick_union.root(7)).to eq(6)
  end

  it "Check if two elements are connected" do
    quick_union.union(0, 1)
    quick_union.union(1, 2)
    quick_union.union(2, 3)
    expect(quick_union.connected(0, 3)).to eq(true)
  end
end