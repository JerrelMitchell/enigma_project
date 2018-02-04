require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_project'

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

  def test_it_creates_an_offset
    key = KeyGenerator.new
    key.key_rotation(1,2,3,4,5)

    # assert_equal [], key.key_offset   #this test will make the whole test pass, comment out when trying to run next part of test
    assert_equal {a: 12, b: 23, c: 34, d: 45}, key_rotation
  end

end
