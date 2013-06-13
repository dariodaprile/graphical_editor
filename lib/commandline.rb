require_relative 'image'

class CommandLine

  attr_reader :image

  COMMANDS = {
    /^\s*X\s*$/i                          => :quit,
    /^\s*S\s*$/i                          => :show,
    /^\s*I\s+(\d)\s+(\d)\s*$/i            => :new_image,
    /^\s*C\s*$/i                          => :clear_image,
    /^\s*L\s+(\d)\s+(\d)\s+(\w)*$/i       => :colour_image,
    /^\s*V\s+(\d)\s+(\d)\s+(\d)\s+(\w)*$/i=> :colour_column,
    /^\s*H\s+(\d)\s+(\d)\s+(\d)\s+(\w)*$/i=> :colour_row,
    /^\s*F\s+(\d)\s+(\d)\s+(\w)*$/i       => :colour_region,
    /.*/                                  => :unrecognised,
  }

  def new_image(width, height)
    width, height = width.to_i, height.to_i
    @image = Image.new(width, height)
  end

  def welcome
    puts "Welcome to the graphical editor!"
  end

  def execute(input)
    regex = COMMANDS.keys.find{|regex| regex =~ input }
    matches = regex.match(input).to_a
    command = COMMANDS[regex] #=> call the value of the hash
    arguments = matches.slice(1, matches.length - 1)
    parse = [command, *arguments]
    send(parse.shift, *parse)
  end

  def quit
    puts "Goodbye!"
    exit
  end

  def show
    puts @image.to_image
  end

  def unrecognised
    puts "Charlotte and The Fabulous Dario, do good code. They also do not recognise this command. Please try again!"
  end

  def colour_image(x,y,colour)
    x, y = x.to_i, y.to_i
    @image.colour_pixel(x,y,colour)
  end

  def colour_column(x,y1,y2,colour)
    x, y1, y2 = x.to_i, y1.to_i, y2.to_i
    @image.colour_vertical_segment(x,y1,y2,colour)
  end

  def colour_row(x1,x2,y,colour)
    x1, x2, y = x1.to_i, x2.to_i, y.to_i
    @image.colour_horizontal_segment(x1,x2,y,colour)
  end

  def colour_region(x,y,new_colour)
    x, y = x.to_i, y.to_i
    @image.fill(x,y,new_colour)
  end
end