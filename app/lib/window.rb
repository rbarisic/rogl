def realtime # :yield:
  r0 = Time.now
  yield
  Time.now - r0
end

module Engine
    class Window < Gosu::Window
        attr_accessor :events, :entities
        def initialize
            super(800,480,false)
            self.caption = "Gosu Tutorial Game"
            @col = Settings::BACKGROUND_FOG
            @entities = []
            @events = []
            @cursor = Engine::GUI::Cursor.new(self,"assets/img/cursor.png","assets/img/cursor_highlight.png")
            @entities.push()
            @benchmark = true if ARGV.include?('--benchmark')
        end

        def quit_game
            # todo: save game
            puts "\nQuitting game..."
            exit(0)
        end

        def update
            @cursor.update

            step = realtime do

                def button_up(id)
                    case(id)
                        when Gosu::MsLeft
                            @cursor.left_mouse_up
                        when Gosu::MsRight
                            @cursor.right_mouse_up
                        when Gosu::MsMiddle
                            @cursor.middle_mouse_up
                    end
                end

                def button_down(id)
                    case(id)
                        when Gosu::MsLeft
                            @cursor.left_mouse_down
                        when Gosu::MsRight
                            @cursor.right_mouse_down
                        when Gosu::MsMiddle
                            @cursor.middle_mouse_down
                        when Gosu::KbUp then
                            Event.new {
                                puts "UP"
                            }.push(@events)
                        when Gosu::KbE
                            Event.new {
                                @entities.push(Engine::GUI::Base.new(20,20,200,200,@col))
                                puts "Entities: #{@entities}"
                            }.push(@events)
                        when Gosu::KbQ
                            quit_game
                        when Gosu::KbR
                            unless @events.count == 0
                                @events.each_with_index do |value,key|
                                    value.call
                                    @events.delete_at(key) # bugged!
                                end
                            end
                        else
                            puts id
                        # end when
                    end # end case
                end

                @entities.each do |e|
                    # unless e.instance_of?(Engine::GUI::Cursor)
                    # else
                        e.update
                    # end
                end
            end
            STDOUT.write "Step: \r#{step * 1000}ms" if @benchmark
        end
        
        def draw
            @cursor.draw(self)
            @entities.each do |e|
                # putv "Drawing #{e}"
                putb '.'
                e.draw(self)
            end
        end
    end
end