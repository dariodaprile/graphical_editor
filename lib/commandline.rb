require_relative 'image'

class CommandLine

  attr_reader :image

  COMMANDS = {
    /^\s*X\s*$/i                         => :quit,
    /^\s*S\s*$/                          => :show,
    /^\s*I\s+(\d)\s+(\d)\s*$/            => :new_image,
    /^\s*C\s*$/i                         => :clear_image,
    /^\s*L\s+(\d)\s+(\d)\s*$/            => :colour_pixel,
    /^\s*V\s+(\d)\s+(\d)\s+(\d)\s*$/     => :colour_column,
    /^\s*H\s+(\d)\s+(\d)\s+(\d)\s*$/     => :colour_row,
    /^\s*F\s+(\d)\s+(\d)\s*$/            => :colour_region,
    /.*/                                 => :unrecognised,
  }

  def new_image(width, height)
    width, height = width.to_i, height.to_i
    @image = Image.new(width, height)
  end

  def execute(input)
    puts "Welcome to the graphical editor!"
    print "> "
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


end