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


end