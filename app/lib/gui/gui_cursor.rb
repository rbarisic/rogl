module Engine
    module GUI
        class Cursor
            include Observable
            attr_accessor :x, :y, :last_x, :last_y, :images
            
            def initialize(window)
                @window = window
                @x = window.mouse_x
                @y = window.mouse_y
                @last_x = @x
                @last_y = @y
                @width = 32
                @height = 32
                @images = { default: Gosu::Image.new(window,"assets/img/cursor.png",false), highlight: Gosu::Image.new(@window,"assets/img/cursor_highlight.png",false) }
                @image = @images[:default]
                @left_mouse_down = false
                @right_mouse_down = false
                @middle_mouse_down = false
                @event = 'none'
            end

            def left_down
                @event = 'lmb_down'
                changed
                notify_observers(@event)
            end

            def left_up
                @event = 'lmb_up'
                changed
                notify_observers(@event)
            end

            def right_down
                @event = 'rmb_down'
                changed
                notify_observers(@event)
            end

            def right_up
                @event = 'rmb_up'
                changed
                notify_observers(@event)
            end

            def middle_down
                @event = 'mmb_down'
                changed
                notify_observers(@event)
            end

            def middle_up
                @event = 'mmb_up'
                changed
                notify_observers(@event)
            end


            def object_underneath(entities)
                entities.each do |e|
                    return e if (e != self) && (@x > e.x && @x < e.right) && (@y > e.y && @y < e.bottom)
                end
            end

            def object_underneath?(entities)
                entities.each do |e|
                    if (e != self) && (@x > e.x && @x < e.right) && (@y > e.y && @y < e.bottom)
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
                        changed
                    when 259 # Scroll Up
                        changed
                end
            end
        end
    end
end