# This module has to be included in another class.
# Example:
# 
# class Player
#     include Engine::Timer
#     ...
# end

module Engine
    module Timer
        def timeout(timeout, func=:countdown)
            puts "abc #{timeout}"
            if timeout > 1
                self.timeout(timeout - 1, func=func)
            else
                self.send func
            end
        end
    end
end