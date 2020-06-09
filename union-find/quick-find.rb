class QuickFind
  attr_reader :size, :values

  def initialize(size)
    @size = size
    @values = Array.new(size)
    @values.each_with_index do |v, i|
      values[i] = i 
    end
  end

  def connected?(p, q)
    values[p] == values[q]
  end

  def union(p, q)
    pid = values[p]
    qid = values[q]
    (0..@size).each do |i|
      if(values[i] == pid)
        values[i] = qid
      end
    end
  end
end

qf = QuickFind.new(10)
p qf.values
qf.union(4, 3)
p qf.values
qf.union(9, 8)
p qf.values
qf.union(4, 8)
p qf.values

