require './engine.rb'

window = Engine::Window.new

@col = Gosu::Color.argb(0xff00ffff)
base_element = Engine::GUI::Window.new(20,20,200,200,@col)
window.entities << base_element
putv base_element

window.show