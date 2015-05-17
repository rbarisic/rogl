module Engine
    module Entities
        class Player < Entity
            include Engine::Timer

            def initialize(x,y,width,height,color, image: nil)
                @x = x
                @y = y
                @width = width
                @height = height
                @image = Gosu::Image.new($window,image,false)
                $window.add_observer(self,:event)
                putv "Element #{self} Created".colorize(:blue)
                @alpha = 256
                @red = 0xff
                @green = 0x80
                @blue = 33
                @col = Gosu::Color.argb(@alpha,@red,@green,@blue)
            end

            def update
            end

            def event(arg)
                puts "Event called: #{arg}"
                case(arg)
                    when Gosu::KbUp
                        @x -= $tile_width / 4
                        @y -= $tile_height / 4
                    when Gosu::KbRight
                        @x += $tile_width / 4
                        @y -= $tile_height / 4
                    when Gosu::KbDown
                        @x += $tile_width / 4
                        @y += $tile_height / 4
                    when Gosu::KbLeft
                        @x -= $tile_width / 4
                        @y += $tile_height / 4
                    when Gosu::KbA
                        timeout(16, :countdown)
                end
            end

            def countdown
                puts "THE TIME HAS COMETH"
            end
        end
    end
end