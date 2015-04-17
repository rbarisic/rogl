module Engine
    module GUI
        class Base
            attr_accessor :x, :y, :width, :height, :last_x, :last_y, :color, :draggable, :sender
            
            def initialize(x,y,width,height,color, draggable: true)
                @x = x
                @y = y
                @last_x = @x
                @last_y = @y
                @width = width
                @height = height
                @col = color
                @draggable = draggable
                putv "Element #{self} Created".colorize(:blue)
                @sender = nil
            end

            def update
                if @sender
                    "puts #{@sender} active!"

                    if @draggable == true
                        puts "is draggable"
                        # if @sender.instance_of?(Engine::GUI::Cursor)
                        #     puts "is cursor"
                            if @sender.left_mouse_down?
                                puts "LMB is DOWN"
                                distance_x = @sender.x - x # distance object left top to cursor
                                distance_y = @sender.y - y # distance object left top to cursor

                                @x += (@sender.x - @sender.last_x)
                                @y += (@sender.y - @sender.last_y)
                            else
                                puts "LMB is UP"
                            end
                        # end
                    end
                end
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

            def receive_click(sender)
                @sender = sender
                # putv "click event called."
                # if @draggable == true
                #     if sender.instance_of?(Engine::GUI::Cursor)
                #         putv "#{self} is draggable"
                #         # distance_x = Math.sqrt((x - sender.x) * (x - sender.x)) # returns non-negative
                #         # distance_y = Math.sqrt((y - sender.y) * (y - sender.y)) # returns non-negative
                #         # distance_x = sender.x - x # distance object left top to cursor
                #         # distance_y = sender.y - y # distance object left top to cursor

                #         # move relative *with* cursor
                #         @x = sender.last_x - sender.x
                #     else
                #         putv "#{sender} is not a cursor"
                #     end
                # else
                #     putv "#{self} is not draggable"
                # end
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