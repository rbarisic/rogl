module Engine
    module GUI
        class Base
            attr_accessor :x, :y, :width, :height, :last_x, :last_y, :color, :clickable, :draggable, :sender
            
            def initialize(x,y,width,height,color, clickable: false, draggable: true)
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
                putv "Element #{self} Created".colorize(:blue)
                @sender = nil
            end

            def update
                @last_x = @x
                @last_y = @y
                if @sender
                    putv "#{@sender} active!"

                    if @sender.left_mouse_down?
                        putv "LMB is DOWN"

                        if @clickable == true
                            putv "#{self} clicked!"
                        elsif @draggable == true #&& inside_boundaries?(0,0,800,600)
                            drag
                        end
                    else
                        putv "LMB is UP"
                    end
                    if @sender.right_mouse_down?
                        resize
                    end
                        putv "#{$window.entities.count}".colorize(:blue) + " entity/entities found."
                    if $window.entities.count > 1
                        dock($window.entities)
                    end
                end                
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
                distance_x = @sender.x - x
                distance_y = @sender.y - y
                @width += (@sender.x - @sender.last_x)
                @height += (@sender.y - @sender.last_y)
                align_to_boundaries(0,0,$window.width,$window.height)
            end

            def drag
                putv "is draggable"
                distance_x = @sender.x - x # distance object left top to cursor
                distance_y = @sender.y - y # distance object left top to cursor
                @x += (@sender.x - @sender.last_x)
                @y += (@sender.y - @sender.last_y)
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

            def align_to_boundaries(x,y,width,height)
                self.x = x if self.x < x
                self.x = width - self.width if self.x > (width - self.width)
                self.y = y if self.y < y
                self.y = height - self.height if self.y > (height - self.height)

                self.width = x + 16 if self.width < x + 16
                self.width = width if self.width > width

                self.height = x + 16 - y if self.height < x + 16 - y
                self.height = height if self.height > height

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

            def receive_click(sender)
                @sender = sender #hotfix - replace this!
            end

            def draw(window)
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