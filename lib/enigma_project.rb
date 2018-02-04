require "pry"

class KeyGenerator
  attr_reader :key_gen

  def initialize
    @key_gen = rand(10000..99999)
  end


  def key_offset
    key_offset = @key_gen.to_s.split("")
    key_rotation_a = key_offset.index[0..1].join.to_i
    key_rotation_b = key_offset.index[1..2].join.to_i
    key_rotation_c = key_offset.index[2..3].join.to_i
    key_rotation_d = key_offset.index[3..4].join.to_i
  end

  # binding.pry
end
