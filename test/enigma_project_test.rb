require "minitest/autorun"
require "minitest/pride"
require "./lib/enigma_project"

class EncryptionTest < Minitest::Test

  def test_it_exists
    key = KeyGenerator.new

    assert_equal KeyGenerator, key.class
  end

  def test_it_generates_a_key
    new_key = KeyGenerator.new

    assert_equal new_key, new_key.key_gen
  end



end
