class Engine
    class Entity
        attr_accessor :id, :x1, :y1, :col, :x2, :y2, :col2, :x3, :y3, :col3, :x4, :y4, :col4
        def initialize(id,x1,y1,col1,x2,y2,col2,x3,y3,col3,x4,y4,col4)
            @id = id
            @x1
            @x2
            @x3
            @x4
            @y1
            @y2
            @y3
            @y4
            @col = Settings::BACKGROUND_FOG
            # puts "Entity created."
        end
    end
end