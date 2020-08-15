require_relative '../../lib/Data-Structures-Array/my_array'

describe MyArray do
  describe '#initialize' do
    it 'new object with length 0' do
      expect(described_class.new.length).to eq(0)
    end
  end

  context 'my array operations' do
    let(:my_array) { described_class.new }

    it 'insert value to my array' do
      my_array.push(3)
      expect(my_array[0]).to eq(3)
    end

    it 'Pop value from my array' do
      my_array.push(3)
      value = my_array.pop
      expect(value).to eq(3)
      expect(my_array[0]).to eq(nil)
    end

    it 'Delete value from my array' do
      my_array.push(1)
      my_array.push(2)
      my_array.push(3)
      my_array.push(4)
      value = my_array.delete(2)
      expect(value).to eq(3)
      expect(my_array[2]).to eq(4)
    end

    context '#Reverse' do
      let(:my_array) {
        described_class.new.tap { |ary|
          ary.push(1)
          ary.push(2)
          ary.push(3)
          ary.push(4)
        }
      }

      it 'Reverse my array' do
        rev_my_array = my_array.reverse
        expect(rev_my_array[0]).to eq(4)
        expect(rev_my_array[3]).to eq(1)
      end

      it 'Reverse returns new object of my array' do
        rev_my_array = my_array.reverse
        expect(rev_my_array.class).to eq(described_class)
        expect(my_array[0]).to eq(rev_my_array[3])
      end
    end
  end
end
