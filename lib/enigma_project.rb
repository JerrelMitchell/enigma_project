require "pry"

class KeyGenerator
  attr_reader :key_gen,
              :key_rotation

  def initialize
    @key_gen = rand(10000..99999)
  end


  def key_rotation
    key_offset = @key_gen.to_s.split("")
    key_rotation_a = key_offset[0..1].join.to_i
    key_rotation_b = key_offset[1..2].join.to_i
    key_rotation_c = key_offset[2..3].join.to_i
    key_rotation_d = key_offset[3..4].join.to_i

    @key_rotation = {
      a: key_rotation_a,
      b: key_rotation_b,
      c: key_rotation_c,
      d: key_rotation_d
    }
  end


  # binding.pry
end
