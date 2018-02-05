require 'date'
require 'pry'

# KeyGenerator for first part of encryption process.
class KeyGenerator
  attr_reader :key_gen

  def initialize
    @key_gen = rand(10_000..99_999)
  end

  def key_rotation
    key_offset = @key_gen.to_s.split('')
    @key_rotation = {
      a: key_offset[0..1].join.to_i,
      b: key_offset[1..2].join.to_i,
      c: key_offset[2..3].join.to_i,
      d: key_offset[3..4].join.to_i
    }
  end
end

# DateOffset for second part of encryption process.
class DateOffset
  attr_reader :date

  def initialize
    @date = Date.now
  end

  def integer_date
    @integer_date = @date.strftime('%d%m%y')
  end
end
