require 'minitest/autorun'
require '../lib/image'


class ImageTest < MiniTest::Unit::TestCase

  def setup
    @image = Image.new(5,6)
  end

  def test_set_pixel_width_and_height
    assert_equal 5, @image.width
    assert_equal 6, @image.height
  end

  def test_set_default_colour
    assert_equal "O", @image.colour
  end

  def test_each_pixel_is_white_by_default
    assert_equal "OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
  end

  def test_colour_a_specific_pixel
    @image.colour_pixel(2,3,"A")
    assert_equal "OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
  end

  def test_colour_a_vertical_segment
    @image.colour_vertical_segment(2,3,4,"W")
    assert_equal "OOOOO\nOOOOO\nOWOOO\nOWOOO\nOOOOO\nOOOOO", @image.to_image
  end

  def test_colour_a_horizontal_segment
    @image.colour_horizontal_segment(3,4,2,"Z")
    assert_equal "OOOOO\nOOZZO\nOOOOO\nOOOOO\nOOOOO\nOOOOO", @image.to_image
  end

  def test_fill_the_region
    @image.colour_vertical_segment(2,3,4,"W")
    @image.colour_horizontal_segment(3,4,2,"Z")
    @image.fill(3,3,"J")
    assert_equal "JJJJJ\nJJZZJ\nJWJJJ\nJWJJJ\nJJJJJ\nJJJJJ", @image.to_image
  end




end