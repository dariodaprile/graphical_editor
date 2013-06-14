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

  # def test_user_can_create_image
  #   #prepare the object
  #   commandline = CommandLine.new
  #   mock_image = Minitest::Mock.new
  #   mock_image.expect(:show)
  #   commandline.stub :image, mock_image do
  #     commandline.run
  #   end
  #   mock_image.verify
  #   #do the action
  #   #check the result

  # end

end