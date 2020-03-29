class MyHash
  BUCKETS = 32 
  
  def initialize
    @hash = Array.new(BUCKETS)
    @addr_list = []
    @size = 0
  end

  def set(key, value)
    address = hash(key)
    if @hash[address]
      @hash[address].append([key, value])
    else
      @hash[address] = [[key, value]]
    end
    @addr_list.append(address)
    @size += 1
  end

  def get(key)
    address = hash(key)
    @hash[address].find{|obj| obj[0]==key}[1]
  end

  def keys
    keys = []
    @addr_list.each do |key|
      keys.append(@hash[key][0])
    end
    keys
  end

  def to_s
    print @hash
  end

  private

  def hash(input)
    input.to_s.chars.inject(0) { |sum, ch| sum + ch.ord } % BUCKETS
  end
end

hash = MyHash.new
hash.set(:a, 1)
hash.set(:b, 2)
hash.set(:c, 3)
hash.set(:d, 4)
puts hash.get(:c)
keys = hash.keys
print keys
puts ''
puts hash
