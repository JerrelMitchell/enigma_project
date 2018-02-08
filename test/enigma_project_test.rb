require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_project'
require 'pry'

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

  def test_it_creates_empty_hash_when_initialized
    rotation_key = Encryptor.new
    assert Hash, rotation_key
  end

  def test_it_creates_key_offsets_in_a_hash
    key = Encryptor.new
    assert_kind_of Hash, key.key_offsets
  end

  def test_it_creates_date_offsets_in_a_hash
    date = Encryptor.new
    assert_kind_of Hash, date.date_offsets
  end

  def test_it_calls_rotation_as_hash
    rotation_key = Encryptor.new
    assert Hash, rotation_key
  end

  def test_it_can_encrypt_character_a
    encryptor = Encryptor.new
    assert_includes ('a'..'z'), encryptor.encrypt_a('j').join
  end

  def test_it_can_encrypt_character_b
    encryptor = Encryptor.new
    assert_includes ('a'..'z'), encryptor.encrypt_b('j').join
  end

  def test_it_can_encrypt_character_c
    encryptor = Encryptor.new
    assert_includes ('a'..'z'), encryptor.encrypt_c('j').join
  end

  def test_it_can_encrypt_character_d
    encryptor = Encryptor.new
    assert_includes ('a'..'z'), encryptor.encrypt_d('j').join
  end

  def test_it_can_encrypt_four_characters_at_once
    encryptor = Encryptor.new
    four_characters = 'jjjj'
    assert_kind_of String, encryptor.encrypt_four(four_characters)
  end

  def test_it_can_encrypt_a_long_word
    encryptor = Encryptor.new
    four_characters = 'jjjj jjjjj j jjj'
    assert_kind_of String, encryptor.encrypt_four(four_characters)
  end
end
