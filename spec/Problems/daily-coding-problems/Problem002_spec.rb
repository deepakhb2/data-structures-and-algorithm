# This problem was asked by Uber.
#
# Given an array of integers, return a new array such that each element at
# index i of the new array is the product of all the numbers in the original
# array except the one at i.
#
# For example, if our input was [1, 2, 3, 4, 5], the expected output would be
# [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the expected output would
# be [2, 3, 6].
#
# Follow-up: what if you can't use division?

describe Problem002 do
  context 'Valid inputs' do
    it '#solution inc order number' do
      values = [1, 2, 3, 4, 5]
      expected_values = [120, 60, 40, 30, 24]
      expect(described_class.solution(values)).to eq(expected_values)
    end

    it '#solution desc order number' do
      values = [3, 2, 1]
      expected_values = [2, 3, 6]
      expect(described_class.solution(values)).to eq(expected_values)
    end
  end
end
