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

  def test_it_creates_a_key_offset_as_a_hash
    key = KeyGenerator.new
    key.key_offsets

    assert_kind_of Hash, key.key_offsets
  end

  def test_it_generates_date
    date = DateGenerator.new

    assert_equal DateGenerator, date.class
  end

  def test_date_is_an_integer
    date = DateGenerator.new
    date.integer_date

    assert_kind_of Integer, date.integer_date
    # refute_kind_of Integer, date.integer_date
  end

  def test_it_squares_the_date
    date = DateGenerator.new
    date.integer_date_squared

    assert_kind_of Integer, date.integer_date_squared
    # refute_kind_of Integer, date.integer_date_squared
  end

  def test_it_gives_last_four_digits_of_squared_date_integer
    date = DateGenerator.new
    date.date_offsets

    refute_kind_of Integer, date.date_offsets
    assert_kind_of Integer, date.date_offsets
end
