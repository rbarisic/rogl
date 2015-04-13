class Engine
    class Window < Gosu::Window
        def initialize
            super(640,480,false)
            self.caption = "Gosu Tutorial Game"
            @col = Settings::BACKGROUND_FOG
            @entities = []
            @events = []
            for i in 0..200 do
                @entities.push Entity.new(i,rand(200) * 1.0,rand(200) * 1.0,@col,rand(200) * 1.0,rand(200) * 1.0,@col,rand(200) * 1.0,rand(200) * 1.0,@col,rand(200) * 1.0,rand(200) * 1.0,@col)
            end
        end

        def quit_game
            # todo: save game
            raise "Quit"
        end

        def button_down(id)
            case(id)

                when Gosu::KbUp then

                    Event.new {
                        puts "UP"
                    }.push(@events)

                when Gosu::KbE
                    Event.new {
                        puts "yolo"
                    }.push(@events)

                when Gosu::KbA
                    puts "up"
                when Gosu::KbB
                    puts "up"
                when Gosu::KbQ
                    quit_game
                when Gosu::KbR
                    @events.each_with_index do |value,key|
                        value.call
                        @events.delete_at(key)
                    end
                else
                    puts Gosu::KbD
            end
        end

        def draw
            @entities.each do |e|
            end
        end

        def update

        end
    end
end