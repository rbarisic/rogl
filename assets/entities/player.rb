# class Player
#   # In pixels/second
#   SPEED = 200

#   def self.load(window)
#     with_data('player.png') do|f|
#       @@image = Gosu::Image.new(window, f, false)
#     end
#   end

#   def initialize(window)
#     @window = window
#     @x = (@window.width / 2) - (@@image.width / 2)
#     @y = @window.height - @@image.height
#     @direction = 0
#   end

#   def update(delta)
#     @x += @direction * SPEED * delta

#     @x = 0 if @x  @window.width - @@image.width
#       @x = @window.width - @@image.width
#     end
#   end

#   def draw
#     @@image.draw(@x, @y, Z::Player)
#   end

#   def button_down(id)
#     case id
#     when Gosu::KbLeft
#       @direction -= 1
#     when Gosu::KbRight
#       @direction += 1
#     end
#   end

#   def button_up(id)
#     case id
#     when Gosu::KbLeft
#       @direction += 1
#     when Gosu::KbRight
#       @direction -= 1
#     end
#   end
# end