module Engine
    class Entity
        attr_accessor :x, :y, :width, :height, :color
        
        def initialize(x,y,width,height,color)
            @x = x
            @y = y
            @width = width
            @height = height
            @col = color
            putv "Element #{self} Created".colorize(:blue)
        end

        def update
                
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