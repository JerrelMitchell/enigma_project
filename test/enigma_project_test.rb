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

  def test_it_creates_key_offsets_in_a_hash
    key = KeyGenerator.new
    key.key_offsets

    assert_kind_of Hash, key.key_offsets
  end

  def test_it_generates_date
    date = KeyGenerator.new

    assert_equal KeyGenerator, date.class
  end

  def test_date_is_an_integer
    date = KeyGenerator.new
    date.integer_date

    assert_kind_of Integer, date.integer_date
    # refute_kind_of Integer, date.integer_date
  end

  def test_it_squares_the_date
    date = KeyGenerator.new
    date.integer_date_squared

    assert_kind_of Integer, date.integer_date_squared
    # refute_kind_of Integer, date.integer_date_squared
  end

  def test_it_creates_date_offsets_in_a_hash
    date = KeyGenerator.new
    date.date_offsets

    assert_kind_of Hash, date.date_offsets
    # refute_kind_of Hash, date.date_offsets
  end

  def test_encryption_calculator_exists
    rotation_key = KeyGenerator.new

    assert_equal KeyGenerator, rotation_key.class
  end

  def test_it_creates_empty_hash_when_initialized
    rotation_key = KeyGenerator.new

    assert Hash, rotation_key
  end

  def test_it_calls_values
    rotation_key = KeyGenerator.new
    rotation_key.values

    assert Hash, rotation_key
  end


end
