class Image
  attr_reader :height, :width, :colour

  def initialize(width, height, colour = "O")
    @width, @height, @colour = width, height, colour
    @canvas = Array.new(height){Array.new(width){colour}}
  end

  def to_image
    @canvas.map{|i| i.join }.join("\n")
  end

  def colour_pixel(x,y, colour = "O")
    @canvas[y-1][x-1] = colour
  end

  def colour_vertical_segment(x,y1,y2,colour)
    (y1..y2).each { |y| colour_pixel(x,y,colour)}
  end

  def colour_horizontal_segment(x1,x2,y,colour)
    (x1..x2).each { |x| colour_pixel(x,y,colour)}
  end

  def fill(x,y,new_colour)
    original_colour = colour_pixel(x,y,colour)
    recursive_fill(x,y,new_colour,original_colour)
  end

  # private

  def recursive_fill(x,y,new_colour,original_colour)
    colour_pixel(x,y,new_colour)
    adjacent(x,y).each do |px|
      recursive_fillh(x[px], y[px], new_colour, original_colour)
      if colour(x[px], y[px]) == original_colour
      end
    end
  end

  def adjacent (x,y)
    (y-1..y+1).map { |ay| (x-1..x+1).map { |ax| [ax, ay] } }
  end

end