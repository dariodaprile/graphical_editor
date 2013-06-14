require_relative 'image'

class CommandLine

  attr_reader :image

  COMMANDS = {
    /^\s*I\s*(\d+)\s*(\d+)\s*$/i => :create_image,
    /^\s*C\s*$/i => :clear,
    /^\s*L\s*(\d+)\s*(\d+)\s*\w\s*$/i => :colour_pixel,
    /^\s*H\s*(\d+)\s*(\d+)\s*(\d+)\s*\w\s*$/i => :colour_horizontal_segment,
    /^\s*V\s*(\d+)\s*(\d+)\s*(\d+)\s*\w\s*$/i => :colour_vertical_segment,
    /^\s*F\s*(\d+)\s*(\d+)\s*\w\s*$/i => :fill,
    /^\s*S\s*$/i => :show,
    /^\s*X\s*$/i => :quit,
  }

  def execute (input)
    puts "Welcome to the graphical editor!"
    print "> "

    regex = COMMANDS.keys.find{|regex| regex =~ input }
    matches = regex.match(input).to_a
    command = COMMANDS[regex]
    arguments = matches.slice(1, matches.length - 1)
    [command, *arguments]
  end

  # puts "Type 'I' followed by the width and height (integers) to create an image >"
  # input = gets.chomp

  # if input[/I/]
  #   a = input.split(' ')
  #   width, height = a[1].to_i, a[2].to_i
  #   puts "variable created"
  #   @image  = Image.new(width, height)
  #   puts "great we have the image"
  #   elsecommandline
  #     puts "The first input should be I, by Charlotte."
  #   end

# def run
#     image.show
#   end

#   get

#   if "I"



end