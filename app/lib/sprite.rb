module Engine
	class Sprite
        def right
            return x + width
        end

        def top
            return y
        end

        def left
            return x
        end

        def bottom
            return y + height
        end
	end
end