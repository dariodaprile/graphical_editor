require 'test/unit'
require 'minitest/mock'
require '../lib/commandline'
require '../lib/image'
require 'mocha/setup'


class CommandLineTest < Test::Unit::TestCase

  def setup
    @commandline = CommandLine.new
  end

  def test_commandline_can_execute_exit_command
    @commandline.expects(:quit)
    @commandline.execute "X"
  end

  def test_commandline_can_create_an_empty_image
    refute @commandline.image
    @commandline.execute("I 5 6")
    assert @commandline.image.is_a?(Image)
  end

   def test_can_show_an_image
    @commandline.execute("I 5 6")
    @commandline.image.expects(:to_image)
    @commandline.execute("S")
  end

  def test_can_colour_a_pixel
    @commandline.execute("I 5 6") #must instantiate image
    @commandline.image.expects(:colour_pixel)
    @commandline.execute("L 2 3 C")
  end

  def test_can_colour_a_column
    @commandline.execute("I 5 6") #must instantiate image
    @commandline.image.expects(:colour_vertical_segment)
    @commandline.execute("V 2 3 4 W")
  end

  def test_can_colour_a_row
    @commandline.execute("I 5 6") #must instantiate image
    @commandline.image.expects(:colour_horizontal_segment)
    @commandline.execute("H 3 4 2 Z")
  end

  def test_can_colour_a_region
    @commandline.execute("I 5 6") #must instantiate image
    @commandline.image.expects(:fill)
    @commandline.execute("F 3 3 J")
  end

  def test_unrecognised_command
    @commandline.expects(:unrecognised)
    @commandline.execute("Whatever")
  end

  # def test_execute_command
  #   assert_equal :quit, @commandline.execute("X")
  # end

end