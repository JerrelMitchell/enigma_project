require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_project'

# :nodoc:
class EncryptionTest < Minitest::Test
  def test_it_exists
    key = KeyGenerator.new

    assert_equal KeyGenerator, key.class
  end

  def test_it_generates_unique_keys
    key = KeyGenerator.new

    assert_equal key.key_gen, key.key_gen

    new_key = KeyGenerator.new

    assert_equal new_key.key_gen, new_key.key_gen
  end

  def test_it_creates_a_key_rotation_as_a_hash
    key = KeyGenerator.new
    key.key_rotation

    assert_kind_of Hash, key.key_rotation
    refute_kind_of Hash, key.key_rotation
  end
end
