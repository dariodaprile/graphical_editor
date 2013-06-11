class Image
  attr_reader :height, :width, :colour

  def initialize(width, height, colour = "O")
    @width = width
    @height = height
    @colour = colour
    @canvas = Array.new(height){Array.new(width){colour}}
  end

  def to_image
    @canvas.map{|i| i.join }.join("\n")
  end

  def colour_pixel(x,y,colour)
    @canvas[y-1] [x-1] = colour
  end



end