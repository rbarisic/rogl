class Player
  # In pixels/second
  SPEED = 1

  def initialize(window)
    @window = window
    @x = 32
    @y = 32
    @direction = 0
    @image = Gosu::Image.new(@window,'assets/sprites/player.png', false)
  end

  def update
  @x += @direction * SPEED * Gosu::milliseconds

  @x = 0 if @x = @window.width - @image.width
  @x = @window.width - @image.width
  end

  def draw
    @image.draw(@x, @y, 21)
  end

  def button_down(id)
    case id
        when Gosu::KbLeft
            puts "HUAHUAHUA"
          @direction -= 1
        when Gosu::KbRight
          @direction += 1
    end
  end

  def button_up(id)
    case id
        when Gosu::KbLeft
          @direction += 1
        when Gosu::KbRight
          @direction -= 1
    end
  end
end