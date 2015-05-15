module Engine
    class Entity < Sprite
        attr_accessor :x, :y, :width, :height, :color, :image
        
        def initialize(x,y,width,height,color, image: nil)
            @x = x
            @y = y
            @width = width
            @height = height
            @col = color
            @image = image
            putv "Element #{self} Created".colorize(:blue)
        end

        def update
                
        end

        def draw(window)
            if @image
                @image.draw(@x,@y,200)
            else
                window.draw_quad(
                    #v1
                    left,
                    top,
                    @col,
                    #2
                    right,
                    top,
                    @col,
                    #3
                    left,
                    bottom,
                    @col,
                    #4
                    right,
                    bottom,
                    @col,

                    z = 0,
                    mode = :default
                )   
            end
        end
    end
end