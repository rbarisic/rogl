def check_collision(a,b)
    if (a.x >= b.x && a.x <= b.x + b.width) && (a.y >= b.y && a.y <= b.y + b.height)
        return true
    else
        return false
    end
end
