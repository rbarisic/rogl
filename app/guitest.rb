require './engine.rb'

$window = Engine::Window.new(false) # no fullscreen

@col = Gosu::Color.argb(0xff333333)


base_element =  Engine::GUI::Window.new(20,20,200,200,@col)
$window.entities << base_element
base_element = Engine::GUI::Window.new(80,80,220,40,@col)
$window.entities << base_element

putv base_element

# $window.entities << Engine::GUI::MainMenu.new

$window.show