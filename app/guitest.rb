require './engine.rb'

$window = Engine::Window.new(true) # no fullscreen

@col = Gosu::Color.argb(0xff333333)
base_element = Engine::GUI::Window.new(20,20,200,200,@col, border: { size: 4, color: Gosu::Color.new(127,255,255,255) })
$window.entities << base_element
base_element = Engine::GUI::Window.new(80,80,220,40,@col, border: { size: 4, color: Gosu::Color.new(127,255,255,255) })
$window.entities << base_element

putv base_element

$window.show