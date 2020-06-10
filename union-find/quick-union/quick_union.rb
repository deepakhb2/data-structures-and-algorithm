class QuickUnion
  attr_reader :values, :size
  def initialize(size)
    @size = size
    @values = Array.new(@size)
    (0...@size).each do |i|
      @values[i] = i
    end
  end

  def root(p)
    root = p
    while(root != @values[root])
      root = @values[root]
    end
    root
  end

  def connected(p, q)
    return root(p) == root(q)
  end

  def union(p, q)
    pr = root(p)
    qr = root(q)
    unless(pr == qr)
      @values[qr] = @values[pr]
    end    
  end
end