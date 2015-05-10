module Engine
    module GUI
        class MainMenu < Window
            def initialize
                @x = 16
                @y = 16
                @last_x = 16
                @last_y = 16
                @width = 320
                @height = 320
                @min_width = 16
                @min_height = 16
                @max_width = $window.width
                @max_height = $window.height
                @col = Gosu::Color.new(244,244,244,244)
                @draggable = true
                putv "Element #{self} Created".colorize(:blue)
                @sender = nil
                @border = { size: 4, color: Gosu::Color.new(127,255,255,255) }
                
                @menu_items = [ "Info", "Status", "Exit"]
            end

            def update
                super
            end

            def draw(window)
                super
            end
        end
    end
end