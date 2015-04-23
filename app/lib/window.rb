def realtime # :yield:
  r0 = Time.now
  yield
  e = Time.now - r0
  @frame_count += 1
  @total_time += e
  if @frame_count == 60
    @fps = @frame_count / @total_time
    puts "Time taken for 60 steps: #{@total_time}s"
    puts "FPS: #{@fps}"
    @frame_count = 0
    @total_time = 0
  end
  print "\rStep: #{e * 1000}ms" if @benchmark
  return e
end

module Engine
    class Window < Gosu::Window
        attr_accessor :events, :entities
        def initialize(fullscreen)
            super(1024,768,fullscreen)
            @x = 0
            @y = 0
            self.caption = "Gosu Tutorial Game"
            @col = Settings::BACKGROUND_FOG
            @entities = []
            @events = []
            @cursor = Engine::GUI::Cursor.new(self,"assets/img/cursor.png","assets/img/cursor_highlight.png")
            @entities.push()
            @benchmark = true if ARGV.include?('--benchmark')
            @frame_count = 0
            @total_time = 0
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
                    end # end case
                end

                @entities.each do |e|
                    # unless e.instance_of?(Engine::GUI::Cursor)
                    # else
                        e.update
                    # end
                end
            end
        end
        
        def draw
            @cursor.draw(self)
            @entities.each do |e|
                # putv "Drawing #{e}"
                e.draw(self)
            end
        end
    end
end