module Engine
    class Event
        def initialize(&block)
            @block = block
            @priority = 0
        end

        def call
            putv "calling event #{self}"
            @block.call
        end

        def push(queue)
            queue << self
            putv "added event #{self}"
        end
    end
end