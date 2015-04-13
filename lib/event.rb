class Engine
    class Event
        def initialize(&block)
            @block = block
            @priority = 0
        end

        def call
            @block.call
        end

        def push(queue)
            queue << self
        end
    end
end