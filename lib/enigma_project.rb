class KeyGenerator
  attr_reader :key_gen

  def initialize
    @key_gen = rand(10000..99999)
  end
end
