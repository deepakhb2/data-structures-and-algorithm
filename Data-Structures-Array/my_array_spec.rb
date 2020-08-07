require_relative './my_array'
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

    it 'Pop value to my array' do
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

    it 'Reverse my array' do
      my_array.push(1)
      my_array.push(2)
      my_array.push(3)
      my_array.push(4)
      reverse = my_array.reverse
      expect(reverse[0]).to eq(4)
      expect(reverse[3]).to eq(1)
    end
  end
end
