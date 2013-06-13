require_relative 'image'


class CommandLine

  attr_reader :image

  puts "Type 'I' followed by the width and height (integers) to create an image >"
  input = gets.chomp

  if input[/I/]
    a = input.split(' ')
    width, height = a[1].to_i, a[2].to_i
    puts "variable created"
    @image  = Image.new(width, height)
    puts "great we have the image"
    elsecommandline
      puts "The first input should be I, by Charlotte."
    end

# def run
#     image.show
#   end

#   get

#   if "I"



end