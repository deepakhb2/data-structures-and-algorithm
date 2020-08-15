# ref: https://rosettacode.org/wiki/Linear_congruential_generator
# Linear congruential generator Rn+1 = A * Rn + C (mod M)

module LCG
  module Common
    # The original seed of this generator.
    attr_reader :seed
 
    # Creates a linear congruential generator with the given _seed_.
    def initialize(seed)
      @seed = @r = seed
    end
  end
 
  # LCG::Berkeley generates 31-bit integers using the same formula
  # as BSD rand().
  class Berkeley
    include Common
    def rand
      @r = (1103515245 * @r + 12345) % 0x7fff_ffff
    end
  end
 
  # LCG::Microsoft generates 15-bit integers using the same formula
  # as rand() from the Microsoft C Runtime.
  class Microsoft
    include Common
    def rand
      @r = (214013 * @r + 2531011) % 0x7fff_ffff
      @r >> 16
    end
  end
end

@random = LCG::Microsoft.new(Time.now.to_i) 
def rand5
  @random.rand % 5
end

p [rand5, rand5, rand5, rand5]

def rand7
  @random.rand % 7
end

p [rand7, rand7, rand7, rand7]
p [rand(7), rand(7), rand(7), rand(7)]