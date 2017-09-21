class Star

attr_reader :x, :y

  def initialize(image)
    @image = image
    # allows for random position of star within borders of window
    @x = rand(10..630)
    @y = rand(50..470)
  end

  def draw
    # Draws the image rotated, with its rotational center at (x, y)
    @image.draw_rot(@x, @y, 0, 25 * Math.sin(Gosu.milliseconds / 140))
  end

end
