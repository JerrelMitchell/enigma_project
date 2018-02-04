class KeyGenerator
  attr_reader :key_gen

  def initialize
    @key_gen = rand(10000..99999)
  end

  def key_offset
    key_offset = @key_gen.to_s.split("")

    #create subarrays of strings for A,B,C,D

  end

end
