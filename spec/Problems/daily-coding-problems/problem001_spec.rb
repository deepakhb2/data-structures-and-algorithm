# Given a list of numbers and a number k, return whether any two numbers
# from the list add up to k.
#
# For example, given [10, 15, 3, 7] and k of 17, return true since 10 +
# 7 is 17.

describe Problem1 do
  describe '#solution' do
    context 'Valid inputs' do
      it 'Return false when array size greater than 2' do
        values = [10, 15, 3, 7]
        k = 15
        expect(described_class.solution(values, k)).to eq(false)
      end

      it 'Return true when array size greater than 2' do
        values = [10, 15, 3, 7]
        k = 17
        expect(described_class.solution(values, k)).to eq(true)
      end

      it 'Return false when array size is 2' do
        values = [10, 15]
        k = 15
        expect(described_class.solution(values, k)).to eq(false)
      end

      it 'Rreturn true when array size is 2' do
        values = [10, 15]
        k = 25
        expect(described_class.solution(values, k)).to eq(true)
      end
    end

    context 'Invalid Inputs' do
      it 'Return false when k value is negative' do
        values = [10, 15]
        k = -35
        expect(described_class.solution(values, k)).to eq(false)
      end

      it 'Return false when array size is 1' do
        values = [10]
        k = 35
        expect(described_class.solution(values, k)).to eq(false)
      end
    end
  end
end
