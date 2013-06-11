class Image
attr_reader :height, :width, :colour

def initialize(width, height, colour = "O")
  @width = width
  @height = height
  @colour = colour
  @canvas = Array.new(height){Array.new(width){colour}}
end

def to_image
  @array.map{|i| i.join }.join("\n")
end

def colour_pixel(x, y,colour)
  @image[x-1][y-1] = colour
end



end