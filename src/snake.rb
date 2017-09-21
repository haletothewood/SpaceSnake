class Snake

attr_accessor :direction, :x, :y, :speed, :length, :segments, :ticker

  def initialize(window)
    @window = window
    @x = 200
    @y = 200
    @segments = []
    @direction = "right"
    @head_segment = Segment.new(self, @window, [@x, @y])
    @segments << @head_segment
    @speed = 2
    @length = 1
  
    # Counts down to lengthen the snake each tick when it has eaten an apple
    @ticker = 0
  end

  def draw
    @segments.each do |segment| # draws all segments in our segment array (AKA the snake)
      segment.draw
    end
  end

  def update_position
    add_segment
    @segments.shift unless @ticker > 0
  end

  def add_segment
    if @direction == "left"
      x = @head_segment.x - @speed
      y = @head_segment.y
      new_segment = Segment.new(self, @window, [x, y])
    end

    if @direction == "right"
 			x = @head_segment.x + @speed
 			y = @head_segment.y
 			new_segment = Segment.new(self, @window, [x, y])
 		end

 		if @direction == "up"
 			x = @head_segment.x
 			y = @head_segment.y - @speed
 			new_segment = Segment.new(self, @window, [x, y])
 		end

 		if @direction == "down"
 			x = @head_segment.x
 			y = @head_segment.y + @speed
 			new_segment = Segment.new(self, @window, [x, y])
 		end

 		@head_segment = new_segment
 		@segments << @head_segment
  end

  def collected_star?(star)
    true if Gosu::distance(@head_segment.x, @head_segment.y, star.x, star.y) < 13
  end

  def hit_self?
    segments = Array.new(@segments)

    if segments.length > 21
      # remove the dead segment from consideration
      segments.pop((10* @speed))
      segments.each do |segment|
        if Gosu::distance(@head_segment.x, @head_segment.y, segment.x, segment.y) < 11 # collision!
          return true
        end
      end
      false
    end
  end

  def outside_bounds?
    if @head_segment.x < 0 || @head_segment.x > 630
      true
    elsif @head_segment.y < 0 || @head_segment.y > 470
      true
    else
      false
    end
  end

end
