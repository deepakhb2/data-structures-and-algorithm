require_relative './quick_union'

RSpec.describe QuickUnion do
  it "Create array with values assigned to its index" do
    qf = QuickUnion.new(10)
    expect(qf.size).to eq(10)
    expect(qf.values.size).to eq(10)
  end
end