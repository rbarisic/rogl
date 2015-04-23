module Engine
    module GUI
        class Cursor
            attr_accessor :x, :y, :last_x, :last_y, :images, :left_mouse_down, :right_mouse_down, :middle_mouse_down
            
            def initialize(window,image,highlight)
                @window = window
                @x = window.mouse_x
                @y = window.mouse_y
                @last_x = @x
                @last_y = @y
                @width = 32
                @height = 32
                @images = { default: Gosu::Image.new(window,image,false), highlight: Gosu::Image.new(@window,highlight,false) }
                @image = @images[:default]
                @left_mouse_down = false
                @right_mouse_down = false
                @middle_mouse_down = false
            end

            def object_underneath(entities)
                entities.each do |e|
                    return e if (e != self) && (@x > e.x && @x < e.x2) && (@y > e.y && @y < e.y4)
                end
            end

            def object_underneath?(entities)
                entities.each do |e|
                    if (e != self) && (@x > e.x && @x < e.x2) && (@y > e.y && @y < e.y4)
                        putv e
                        return true
                    end
                end
            end

            def update
                @last_x = @x
                @last_y = @y
                @x = @window.mouse_x
                @y = @window.mouse_y
                if (@x != @last_x) || (@y != @last_y)
                    if object_underneath?(@window.entities) == true
                        putv "object underneath cursor"
                        @image = @images[:highlight]
                    else
                        @image = @images[:default]
                    end
                end

                # putv "x in 1 step: #{@x - @last_x}"
                # putv "y in 1 step: #{@y - @last_y}"
            end

            def draw(window)
                @image.draw(@x,@y,200)
            end

            def scroll(direction)
                case(direction)
                    when 260 # Scroll Down

                    when 259 # Scroll Up

                end
            end

            def send_click(object)
                object.receive_click(self)
            end

            def left_mouse_down
                @left_mouse_down = true
                if object_underneath?(@window.entities) == true
                    @object_underneath = object_underneath(@window.entities)
                    send_click(@object_underneath)
                end
            end

            def left_mouse_down?
                return true if @left_mouse_down == true
            end

            def right_mouse_down?
                return true if @right_mouse_down == true
            end

            def left_mouse_up
                @left_mouse_down = false
            end

            def right_mouse_down
                @right_mouse_down = true
            end

            def right_mouse_up
                @right_mouse_down = false
            end

            def middle_mouse_down
                @middle_mouse_down = true
            end

            def middle_mouse_up
                @middle_mouse_down = false
            end
        end
    end
end