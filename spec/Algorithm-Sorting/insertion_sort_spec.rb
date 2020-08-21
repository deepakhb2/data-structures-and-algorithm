describe InsertionSort do
  let(:values) { [5,2,4,7,1,3,6] }

  describe '#recursive' do
    it 'sort using recursive technique' do
      expect(described_class.recursive(values)).to eq([1,2,3,4,5,6,7])
    end
  end

  describe '#non_recursive' do
    it 'sort using non-recursive technique' do
      expect(described_class.non_recursive(values)).to eq([1,2,3,4,5,6,7])
    end
  end
end
