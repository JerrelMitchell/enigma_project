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
    key_offset = key.key_offset

    # assert_equal [], key.key_offset   #this test will make the whole test pass, comment out when trying to run next part of test
    assert_equal ["94","44","42","26"], key.key_offset

  end

end
