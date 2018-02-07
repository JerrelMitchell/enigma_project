require 'date'


# Class creating encryption process.
class Encryptor
  attr_reader :key_gen,
              :date,
              :squared_date,
              :rotation_key,
              :shift

  def initialize
    @key_gen = rand(10_000..99_999)
    @date = DateTime.now
    @rotation_key = rotation_key
    @key_offsets  = key_offsets
    @integer_date = integer_date
    @squared_date = squared_date
    @date_offsets = date_offsets
    @shift = shift
    @alpha_num = alpha_num

  end

  def key_offsets
    key_offset = key_gen.to_s.split('')
    key_offsets = {
      a: key_offset[0..1].join.to_i,
      b: key_offset[1..2].join.to_i,
      c: key_offset[2..3].join.to_i,
      d: key_offset[3..4].join.to_i
    }
  end

  def integer_date
    integer_date = date.strftime('%d%m%y').to_i
  end

  def integer_date_squared
    integer_date = date.strftime('%d%m%y').to_i
    squared_date = integer_date**2
  end

  def date_offsets
    integer_date = date.strftime('%d%m%y').to_i
    squared_date = integer_date**2
    date_string = squared_date.to_s
    date_offset = date_string[date_string.length - 4, 4].split('')
    date_offsets = {
      a: date_offset[0].to_i,
      b: date_offset[1].to_i,
      c: date_offset[2].to_i,
      d: date_offset[3].to_i
    }
  end

  def rotation_key
    rotation_key = key_offsets.merge(date_offsets) do |key, oldval, newval|
      newval + oldval
    end

  end

  def encrypt_a(string)
    shift = rotation_key[:a]
    encrypt_a = Hash[alpha_num.zip(alpha_num.rotate(shift))]
    encrypted_a = string.chars.map { |charc| encrypt_a.fetch(charc, "")}
  end

  def encrypt_b(string)
    shift = rotation_key[:b]
    encrypt_b = Hash[alpha_num.zip(alpha_num.rotate(shift))]
    encrypted_b = string.chars.map { |charc| encrypt_b.fetch(charc, "")}
  end

  def encrypt_c(string)
    shift = rotation_key[:c]
    encrypt_c = Hash[alpha_num.zip(alpha_num.rotate(shift))]
    encrypted_c = string.chars.map { |charc| encrypt_c.fetch(charc, "")}
  end

  def encrypt_d(string)
    shift = rotation_key[:d]
    encrypt_d = Hash[alpha_num.zip(alpha_num.rotate(shift))]
    encrypted_d = string.chars.map { |charc| encrypt_d.fetch(charc, "")}
  end

  def alpha_num
    ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
      "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
      "w", "x", "y", "z"]
  end
end
