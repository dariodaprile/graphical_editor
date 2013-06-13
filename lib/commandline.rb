require_relative 'image'

class CommandLine

  attr_reader :image

  COMMANDS = {
    /X/ => :quit,
    /S/ => :show,
    /I/ => :new_image,
    /C/ => :clear_image,
    /L/ => :colour_pixel,
    /V/ => :colour_column,
    /H/ => :colour_row,
    /F/ => :colour_region,
    /.*/ => :unrecognised,
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