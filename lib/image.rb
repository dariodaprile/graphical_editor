class Image
  attr_reader :height, :width

  DEFAULT_COLOUR = "O"

  def initialize(width, height )
    @width, @height = width, height
    @canvas = Array.new(height){Array.new(width){DEFAULT_COLOUR}}
  end

  def to_image
    @canvas.map{|i| i.join }.join("\n")
  end

  def colour_pixel(x,y,colour)
    @canvas[y-1][x-1] = colour
  end

  def colour_vertical_segment(x,y1,y2,colour)
    (y1..y2).each { |y| colour_pixel(x,y,colour)}
  end

  def colour_horizontal_segment(x1,x2,y,colour)
    (x1..x2).each { |x| colour_pixel(x,y,colour)}
  end

  def fill(x,y,new_colour)
    original_colour = pixel_at(x,y)
    recursive_fill(x,y,new_colour,original_colour)
  end

  def adjacent(x,y)
    offsets = [-1,0,1].repeated_permutation(2)
    candidates = offsets.map{|pair| [pair[0]+x, pair[1]+y]} - [[x,y]]
    candidates.select do |pair|
      pair.first.between?(1, width) && pair.last.between?(1, height)

    end
  end

  def pixel_at(x,y)
    @canvas[y-1][x-1]
  end

private

  def recursive_fill(x,y,new_colour,original_colour)
    colour_pixel(x,y,new_colour)
    adjacent(x,y).each do |pair|
      pixel_x, pixel_y = pair
      if pixel_at(pixel_x, pixel_y) == original_colour
        recursive_fill(pixel_x, pixel_y, new_colour, original_colour)
      end
    end
  end
end
