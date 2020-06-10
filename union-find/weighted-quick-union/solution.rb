class WeightedQU
  attr_reader :size, :values, :sizes

  def initialize(size)
    @size = size
    @values = Array.new(@size)
    @sizes = Array.new(@size)
    (0...@size).each do |i|
      @values[i] = i
    end
    (0...@size).each do |i|
      @sizes[i] = 1
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
    return if pr == qr
    if(@sizes[pr] >= @sizes[qr])
      @values[qr] = pr 
      @sizes[pr] += @sizes[qr]
    else
      @values[pr] = qr 
      @sizes[qr] += @sizes[pr]
    end
  end
end