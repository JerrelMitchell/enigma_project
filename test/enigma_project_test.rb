require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_project'
require 'date'

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

  def test_we_get_four_assignable_rotations
    key = KeyGenerator.new
    key.key_offset

    assert_instance_of Fixnum, key.key_offset

  end

  def test_it_creates_a_key_rotation
    key = KeyGenerator.new
    key.key_rotation


    assert_kind_of Hash, key.key_rotation
  end

  def test_date_generates
    date = DateOffset.new

    assert_instance_of DateOffset, date
  end

  def test_date_exists_as_interger
    date = DateTime.now
    integer_date = date.strftime("%d%m%y").to_i


    assert_kind_of Fixnum, integer_date
  end

end
