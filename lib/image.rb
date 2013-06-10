class Image

  attr_accessor :width, :height, :colour, :image

  def initialize (width, height, colour = "O")
    @width = width
    @height = height
    @colour = colour
  end

  def to_image
    @pixel_array = Array.new(@width * @height)
    @pixel_array_of_colours = @pixel_array.map{|i| @colour}
    @images = @pixel_array_of_colours.join.scan(/.{5}/).join("\n")
  end

  def change_color(x,y,colour)
    # a = to_image.split(/\n/)
    # b = a[y-1][x-1]
    # b.gsub!("O",colour)
  end

end
