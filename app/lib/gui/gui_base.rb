module Engine
    module GUI
        class Base
            include Observable
            attr_accessor :x, :y, :width, :height, :last_x, :last_y, :color, :clickable, :draggable, :resizable, :border
            
            def initialize(x,y,width,height,color, clickable: false, resizable: true, draggable: true, border: { size: 0, color: nil})
                @x = x
                @y = y
                @last_x = @x
                @last_y = @y
                @width = width
                @height = height
                @min_width = 16
                @min_height = 16
                @max_width = $window.width
                @max_height = $window.height
                @col = color
                @draggable = draggable
                @resizable = resizable
                putv "Element #{self} Created".colorize(:blue)
                @border = { size: 4, color: Gosu::Color.new(127,255,255,255) }
                @state = 'default'
                $window.cursor.add_observer(self, :cursor_event)
            end

            def cursor_event(event)
                case(event)
                    when 'lmb_down'
                        if check_collision($window.cursor,self)
                            @state = 'drag'
                        end
                    when 'lmb_up'
                        @state = 'default'
                    when 'rmb_down'
                        if check_collision($window.cursor,self)
                            @state = 'resize'
                        end
                    when 'rmb_up'
                        @state = 'default'
                    when 'mmb_down'

                    when 'mmb_up'
                        @state = 'default'
                end
            end

            def update
                @last_x = @x
                @last_y = @y

                drag if @draggable == true && @state == 'drag'
                resize if @resizable == true && @state == 'resize'
            end

            def dock(objects)
                objects.each do |object|
                    for i in (self.x - 10).to_i..(self.x + 10).to_i do
                        if object.x == i
                            self.x = object.x
                        end
                    end
                    
                end
            end

            def resize
                distance_x = $window.cursor.x - x
                distance_y = $window.cursor.y - y
                @width += ($window.cursor.x - $window.cursor.last_x)
                @height += ($window.cursor.y - $window.cursor.last_y)
                resize_to_boundaries(0,0,$window.width,$window.height)
                align_to_boundaries(0,0,$window.width,$window.height)
            end

            def drag
                putv "is draggable"
                distance_x = $window.cursor.x - x # distance object left top to cursor
                distance_y = $window.cursor.y - y # distance object left top to cursor
                @x += ($window.cursor.x - $window.cursor.last_x)
                @y += ($window.cursor.y - $window.cursor.last_y)
                align_to_boundaries(0,0,$window.width,$window.height) if !inside_boundaries?(0,0,$window.width,$window.height)
            end

            # def draggable?
            #     return true if @draggable
            # end

            def x2
                return x + width
            end

            def y2
                return y
            end

            def x3
                return x
            end

            def y3
                return y + height
            end

            def x4
                return x + width
            end

            def y4
                return y + height
            end

            def resize_to_boundaries(screen_left,screen_top,screen_right,screen_bottom)
                self.width = screen_right - self.x if (self.x + self.width) > (screen_right)
                self.height = screen_bottom - self.y if (self.y + self.height) > (screen_bottom)
            end

            def align_to_boundaries(screen_left,screen_top,screen_right,screen_bottom)
                self.x = screen_left if self.x < screen_left
                self.x = screen_right - self.width if self.x > (screen_right - self.width)
                self.y = screen_top if self.y < screen_top
                self.y = screen_bottom - self.height if self.y > (screen_bottom - self.height)

                self.width = screen_left + 16 if self.width < screen_left + 16
                self.width = screen_right if self.width > screen_right

                self.height = screen_left + 16 - screen_top if self.height < screen_left + 16 - screen_top
                self.height = screen_bottom if self.height > screen_bottom

                #==================================================
                # BUG: Window doesn't stop resizing!
                #==================================================
            end

            def inside_boundaries?(x,y,width,height)
                if ( self.x > x && (self.x + self.width) < (x + width) && self.y > y && (self.y + self.height) < (y + height))
                    return true
                end
            end

            def inside_boundaries_of?(limiter)
                if ( x > limiter.x && x2 < limiter.width && y > limiter.y && y < limiter.height )
                    return true
                end
            end

            def border_valid?
                if @border[:size] != 0 && @border[:color] != nil
                    return true
                end
            end

            def draw_border
                $window.draw_quad(
                    #v1
                    @x - @border[:size],
                    @y - @border[:size],
                    @border[:color],
                    #3
                    @x + @width + @border[:size],
                    @y - @border[:size],
                    @border[:color],
                    #3
                    @x - @border[:size],
                    @y + @height + @border[:size],
                    @border[:color],
                    #4
                    @x + @width + @border[:size],
                    @y + @height + @border[:size],
                    @border[:color],

                    z = 0,
                    mode = :default
                )
            end

            def draw(window)

                draw_border # if border_valid?

                window.draw_quad(
                    #v1
                    @x,
                    @y,
                    @col,
                    #2
                    @x + @width,
                    @y,
                    @col,
                    #3
                    @x,
                    @y + @height,
                    @col,
                    #4
                    @x + @width,
                    @y + @height,
                    @col,

                    z = 0,
                    mode = :default
                )
            end
        end
    end
end