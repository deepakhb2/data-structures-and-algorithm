describe Problems do

  # Given an array of numbers of length N, find both the minimum and
  # maximum using less than 2 * (N - 2) comparisons.
  describe '#find_min_max_in_ary' do
    it 'return min and max value of array with "2 * (n-1)" comparison' do
      values = [9, 2, 4, 6, 10, 1]
      comparisons = 2 * (values.length - 2)
      expect(Problems.find_min_max_in_ary(values)).to eq([1, 10, comparisons])
    end
  end
end
