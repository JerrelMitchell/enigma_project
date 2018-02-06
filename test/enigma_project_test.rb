require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_project'

# :nodoc:
class EncryptionTest < Minitest::Test
  def test_it_exists
    key = Encryptor.new

    assert_equal Encryptor, key.class
  end

  def test_it_generates_unique_keys
    key = Encryptor.new

    assert_equal key.key_gen, key.key_gen

    new_key = Encryptor.new

    assert_equal new_key.key_gen, new_key.key_gen
  end

  def test_it_creates_key_offsets_in_a_hash
    key = Encryptor.new
    key.key_offsets

    assert_kind_of Hash, key.key_offsets
  end

  def test_date_is_an_integer
    date = Encryptor.new
    date.integer_date

    assert_kind_of Integer, date.integer_date
    # refute_kind_of Integer, date.integer_date
  end

  def test_it_squares_the_date
    date = Encryptor.new
    date.integer_date_squared

    assert_kind_of Integer, date.integer_date_squared
  end

  def test_it_creates_date_offsets_in_a_hash
    date = Encryptor.new
    date.date_offsets

    assert_kind_of Hash, date.date_offsets
  end

  def test_it_creates_empty_hash_when_initialized
    rotation_key = Encryptor.new

    assert Hash, rotation_key
  end

  def test_it_calls_values_as_hash
    rotation_key = Encryptor.new
    rotation_key.values

    assert Hash, rotation_key
  end

  # def test_encrypt_exists_with_alpha_num
  #   alpha_num = Encryptor.new
  #   alpha_num.encrypt
  #
  #   assert_instance_of Array, alpha_num.encrypt
  # end

  def test_encrypt_can_be_passed_one_character
    alpha_num = Encryptor.new
    alpha_num.encrypt("j")

    assert_equal "j", alpha_num.encrypt("j")
  end

  # def test_encrypt_can_encypt_one_character
  #   alpha_num = Encryptor.new
  #
  #
  # end

end
