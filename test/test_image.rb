require 'minitest/autorun'
require '../lib/image'


class ImageTest < MiniTest::Unit::TestCase

  def test_image_create_an_array_with_pixels
    @image= Image.new(5,6)
    assert_equal 5, @image.width
    assert_equal 6, @image.height
  end

end