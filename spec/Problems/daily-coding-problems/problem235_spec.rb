describe Problem235 do

  # Given an array of numbers of length N, find both the minimum and
  # maximum using less than 2 * (N - 2) comparisons.
  describe '#non_recursive_solution' do
    it 'return min and max value of array with "2 * (n-1)" comparison' do
      values = [9, 2, 4, 6, 10, 1, 11, -1, 3, 5]
      comparisons = 3 * (values.length / 2)
      expect(Problem235.non_recursive_solution(values, 0)).to eq([-1, 11, comparisons])
    end
  end

  describe '#recursive_solution' do
    it 'return min and max value of array with "2 * (n-1)" comparison' do
      values = [9, 2, 4, 6, 10, 1, 11, -1]
      comparisons = 3 * (values.length / 2) - 2
      expect(Problem235.recursive_solution(values, 0)).to eq([-1, 11, comparisons])
    end
  end
end
