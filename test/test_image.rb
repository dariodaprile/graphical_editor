require 'minitest/autorun'
require '../lib/image'


class ImageTest < MiniTest::Unit::TestCase

  def test_set_pixel_width_and_height
    @image = Image.new(5,6)
    assert_equal 5, @image.width
    assert_equal 6, @image.height
  end

  def test_set_default_colour
    @image = Image.new(5,6)
    assert_equal "O", @image.colour
  end

  def test_each_pixel_is_white_by_default
    @image = Image.new(5,6)
    assert_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
  end

  def test_color_a_specific_pixel
    # prepare the object
    @image = Image.new(5,6)
    # do the action
    @image.colour_pixel(2,3,"A")
    # check the result
    assert_equal "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
  end




end